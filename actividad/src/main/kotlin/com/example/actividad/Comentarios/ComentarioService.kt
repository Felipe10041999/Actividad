package com.example.actividad.comentario

import com.example.actividad.historial.HistorialService
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import java.sql.ResultSet
import java.time.LocalDateTime

@Service
class ComentarioService {

    private val logger = LoggerFactory.getLogger(ComentarioService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    @Autowired
    lateinit var historialService: HistorialService

    fun agregarComentario(comentario: Comentario): Int {
        val sql = """
            INSERT INTO comentario (contenido, usuario_id, aviso_id, comunidad_id, fecha_creacion)
            VALUES (?, ?, ?, ?, NOW())
        """.trimIndent()

        val filas = jdbcTemplate.update(
            sql,
            comentario.contenido,
            comentario.usuarioId,
            comentario.avisoId,
            comentario.comunidadId
        )

        if (filas > 0) {
            historialService.registrarEvento(
                usuarioId = comentario.usuarioId,
                comunidadId = comentario.comunidadId,
                tipoEvento = "COMENTARIO_CREADO",
                descripcion = "Comentario agregado al aviso ${comentario.avisoId}: '${comentario.contenido.take(100)}...'"
            )
        }

        logger.info("Comentario agregado al aviso ${comentario.avisoId} en comunidad ${comentario.comunidadId}")
        return filas
    }

    fun obtenerComentariosPorAviso(avisoId: Long): List<Comentario> {
        val sql = "SELECT * FROM comentario WHERE aviso_id = ? ORDER BY fecha_creacion ASC"
        return jdbcTemplate.query(sql, arrayOf(avisoId)) { rs, _ -> mapRow(rs) }
    }

    fun actualizarComentario(id: Long, nuevoContenido: String): Int {
        val sql = "UPDATE comentario SET contenido = ? WHERE id = ?"
        val filas = jdbcTemplate.update(sql, nuevoContenido, id)

        if (filas > 0) {
            val datos = obtenerComentarioPorId(id)
            historialService.registrarEvento(
                usuarioId = datos?.usuarioId,
                comunidadId = datos?.comunidadId,
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
                usuarioId = datos?.usuarioId,
                comunidadId = datos?.comunidadId,
                tipoEvento = "COMENTARIO_ELIMINADO",
                descripcion = "Comentario con ID $id fue eliminado"
            )
        }

        logger.info("Comentario con ID $id fue eliminado")
        return filas
    }

    private fun obtenerComentarioPorId(id: Long): Comentario? {
        val sql = "SELECT * FROM comentario WHERE id = ?"
        return jdbcTemplate.query(sql, arrayOf(id)) { rs, _ -> mapRow(rs) }.firstOrNull()
    }

    private fun mapRow(rs: ResultSet): Comentario {
        return Comentario(
            id = rs.getLong("id"),
            contenido = rs.getString("contenido"),
            usuarioId = rs.getLong("usuario_id").takeIf { !rs.wasNull() },
            avisoId = rs.getLong("aviso_id"),
            comunidadId = rs.getLong("comunidad_id").takeIf { !rs.wasNull() },
            fechaCreacion = rs.getTimestamp("fecha_creacion").toLocalDateTime()
        )
    }
}
