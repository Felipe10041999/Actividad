package com.example.actividad.historial

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import java.sql.ResultSet

@Service
class HistorialService {

    private val logger = LoggerFactory.getLogger(HistorialService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    // Método para registrar un evento
    fun registrarEvento(usuarioId: Long?, comunidadId: Long?, tipoEvento: String, descripcion: String) {
        val sql = """
            INSERT INTO historial_eventos (usuario_id, comunidad_id, tipo_evento, descripcion)
            VALUES (?, ?, ?, ?)
        """
        jdbcTemplate.update(sql, usuarioId, comunidadId, tipoEvento, descripcion)
        logger.info("Evento registrado: $tipoEvento - $descripcion")
    }

    // Obtener todo el historial
    fun obtenerHistorial(): List<HistorialEvento> {
        val sql = "SELECT * FROM historial_eventos "
        return jdbcTemplate.query(sql) { rs, _ -> mapRow(rs) }
    }

    // Obtener historial por comunidad
    fun obtenerHistorialPorComunidad(comunidadId: Long): List<HistorialEvento> {
        val sql = "SELECT * FROM historial_eventos WHERE comunidad_id = ? "
        return jdbcTemplate.query(sql, arrayOf(comunidadId)) { rs, _ -> mapRow(rs) }
    }

    // Obtener historial por usuario
    fun obtenerHistorialPorUsuario(usuarioId: Long): List<HistorialEvento> {
        val sql = "SELECT * FROM historial_eventos WHERE usuario_id = ? ORDER BY fecha DESC"
        return jdbcTemplate.query(sql, arrayOf(usuarioId)) { rs, _ -> mapRow(rs) }
    }

    // Utilidad para mapear una fila
    private fun mapRow(rs: ResultSet): HistorialEvento {
        return HistorialEvento(
            id = rs.getLong("id"),
            usuarioId = rs.getLong("usuario_id").takeIf { !rs.wasNull() },
            comunidadId = rs.getLong("comunidad_id").takeIf { !rs.wasNull() },
            tipoEvento = rs.getString("tipo_evento"),
            descripcion = rs.getString("descripcion"),
            fecha = rs.getTimestamp("fecha").toLocalDateTime()
        )
    }
}
