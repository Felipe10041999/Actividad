package com.example.actividad.comentario

import com.example.actividad.historial.HistorialService
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import org.springframework.stereotype.Service



@Service
class ComentarioService {

    val logger = LoggerFactory.getLogger(ComentarioService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    @Autowired
    lateinit var historialService: HistorialService
    var mapRow = RowMapper{rs, _-> Comentario(
        rs.getLong("id"),
        rs.getString("contenido"),
        rs.getLong("usuario_id"),
        rs.getLong("aviso_id"),
        rs.getLong("comunidad_id"),
        rs.getTimestamp("fecha_creacion").toLocalDateTime()
    )
    }
    fun obtenerComentarioPorId(id: Long): Comentario? {
        val sql = "SELECT * FROM comentario WHERE id = ?"
        return jdbcTemplate.queryForObject(sql, mapRow, id)
    }

    fun agregarComentario(comentario: Comentario): Int {
        val sql = """
            INSERT INTO comentario (contenido, usuario_id, aviso_id, comunidad_id, fecha_creacion)
            VALUES (?, ?, ?, ?, NOW())
        """

        val filas = jdbcTemplate.update(
            sql,
            comentario.getContenido(),
            comentario.getUsuarioId(),
            comentario.getAvisoId(),
            comentario.getComunidadid()
        )

        if (filas > 0) {
            historialService.registrarEvento(
                usuarioId = comentario.getUsuarioId(),
                comunidadId = comentario.getComunidadid(),
                tipoEvento = "COMENTARIO_CREADO",
                descripcion = "Comentario agregado al aviso ${comentario.getAvisoId()}: '${comentario.getContenido().take(100)}...'"
            )
        }

        logger.info("Comentario agregado al aviso ${comentario.getAvisoId()} en comunidad ${comentario.getComunidadid()}")
        return filas
    }

    fun obtenerComentariosPorAviso(avisoId: Long): List<Comentario> {
        val sql = "SELECT * FROM comentario WHERE aviso_id = ? ORDER BY fecha_creacion ASC"
        return jdbcTemplate.query(sql, mapRow, avisoId)
    }

    fun actualizarComentario(id: Long, nuevoContenido: String): Int {
        val sql = "UPDATE comentario SET contenido = ? WHERE id = ?"
        val filas = jdbcTemplate.update(sql, nuevoContenido, id)

        if (filas > 0) {
            val datos = obtenerComentarioPorId(id)
            historialService.registrarEvento(
                usuarioId = datos?.getUsuarioId(),
                comunidadId = datos?.getComunidadid(),
                tipoEvento = "COMENTARIO_EDITADO",
                descripcion = "Comentario con ID $id fue editado"
            )
        }

        logger.info("Comentario con ID $id fue actualizado")
        return filas
    }

    fun eliminarComentario(id: Long): Int {
        val datos = obtenerComentarioPorId(id)
        val filas = jdbcTemplate.update("DELETE FROM comentario WHERE id = ?", id)

        if (filas > 0) {
            historialService.registrarEvento(
                usuarioId = datos?.getUsuarioId(),
                comunidadId = datos?.getComunidadid(),
                tipoEvento = "COMENTARIO_ELIMINADO",
                descripcion = "Comentario con ID $id fue eliminado"
            )
        }

        logger.info("Comentario con ID $id fue eliminado")
        return filas
    }




}
