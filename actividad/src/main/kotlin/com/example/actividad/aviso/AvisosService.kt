package com.example.actividad.aviso

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service


@Service
class AvisosService {

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun obtenerAvisos(): List<Aviso> {
        val sql = "SELECT * FROM avisos"
        return jdbcTemplate.query(sql) { rs, _ ->
            Aviso(
                id = rs.getLong("id"),
                titulo = rs.getString("titulo"),
                descripcion =  rs.getString("descripcion"),
                categoriaId = rs.getString("categoria"),
                estado = rs.getString("estado"),
                usuarioId = rs.getLong("usuario_Id")
            )
        }
    }

    fun obtenerAvisoPorId(id: Long): Aviso? {
        val sql = "SELECT * FROM avisos WHERE id = ?"
        return jdbcTemplate.query(sql, arrayOf(id)) { rs, _ ->
            Aviso(
                id = rs.getLong("id"),
                titulo = rs.getString("titulo"),
                descripcion = rs.getString("descripcion"),
                categoriaId = rs.getString("categoria"),
                estado = rs.getString("estado"),
                usuarioId = rs.getLong("usuario_id")
            )
        }.firstOrNull()
    }


    fun crearAviso(aviso: Aviso): Int {
        val sql = """
            INSERT INTO avisos (titulo, descripcion, categoria_id, estado, usuario_id)
            VALUES (?, ?, ?, ?, ?)
        """
        return jdbcTemplate.update(sql, aviso.titulo, aviso.descripcion, aviso.categoriaId, aviso.estado, aviso.usuarioId)
    }


    fun marcarAvisoAtendido(id: Long): Int {
        val sql = "UPDATE avisos SET estado = 'atendido' WHERE id = ?"
        return jdbcTemplate.update(sql, id)
    }


    fun eliminarAviso(id: Long): Int {
        val sql = "DELETE FROM avisos WHERE id = ?"
        return jdbcTemplate.update(sql, id)
    }
}