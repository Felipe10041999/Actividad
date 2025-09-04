package com.example.actividad.historial

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import org.springframework.stereotype.Service
import java.sql.ResultSet

@Service
class HistorialService {

    private val logger = LoggerFactory.getLogger(HistorialService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate
    var mapRow= RowMapper{rs, _->
        HistorialEvento(
            rs.getLong("id"),
            rs.getLong("usuario_id"),
            rs.getLong("comunidad_id"),
            rs.getString("tipo_evento"),
            rs.getString("descripcion"),
            rs.getTimestamp("fecha").toLocalDateTime()
        )
    }

    fun registrarEvento(usuarioId: Long?, comunidadId: Long?, tipoEvento: String, descripcion: String) {
        val sql = """
            INSERT INTO historial_eventos (usuario_id, comunidad_id, tipo_evento, descripcion)
            VALUES (?, ?, ?, ?)
        """
        jdbcTemplate.update(sql, usuarioId, comunidadId, tipoEvento, descripcion)
        logger.info("Evento registrado: $tipoEvento - $descripcion")
    }

    fun obtenerHistorial(): List<HistorialEvento> {
        val sql = "SELECT * FROM historial_eventos "
        return jdbcTemplate.query(sql, mapRow)
    }

    fun obtenerHistorialPorComunidad(comunidadId: Long): List<HistorialEvento> {
        val sql = "SELECT * FROM historial_eventos WHERE comunidad_id = ? "
        return jdbcTemplate.query(sql,mapRow, comunidadId )
    }


    fun obtenerHistorialPorUsuario(usuarioId: Long): List<HistorialEvento> {
        val sql = "SELECT * FROM historial_eventos WHERE usuario_id = ? ORDER BY fecha DESC"
        return jdbcTemplate.query(sql,mapRow,usuarioId)
    }


}
