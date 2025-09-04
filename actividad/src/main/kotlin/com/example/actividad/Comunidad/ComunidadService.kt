package com.example.actividad.Comunidad

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import java.sql.ResultSet

@Service
class ComunidadService {

    private val logger = LoggerFactory.getLogger(ComunidadService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun obtenerTodas(): List<Comunidad> {
        val sql = "SELECT * FROM comunidad"
        return jdbcTemplate.query(sql) { rs, _ -> mapRow(rs) }
    }

    fun obtenerPorId(id: Long): Comunidad? {
        val sql = "SELECT * FROM comunidad WHERE id = ?"
        return jdbcTemplate.query(sql, arrayOf(id)) { rs, _ -> mapRow(rs) }.firstOrNull()
    }

    fun crear(comunidad: Comunidad): Int {
        val sql = "INSERT INTO comunidad (nombre, direccion, fecha_creacion) VALUES (?, ?, NOW())"
        logger.info("Creando comunidad: ${comunidad.nombre}")
        return jdbcTemplate.update(sql, comunidad.nombre, comunidad.direccion)
    }

    fun actualizar(id: Long, comunidad: Comunidad): Int {
        val sql = "UPDATE comunidad SET nombre = ?, direccion = ? WHERE id = ?"
        logger.info("Actualizando comunidad ID: $id")
        return jdbcTemplate.update(sql, comunidad.nombre, comunidad.direccion, id)
    }

    fun eliminar(id: Long): Int {
        val sql = "DELETE FROM comunidad WHERE id = ?"
        logger.info("Eliminando comunidad ID: $id")
        return jdbcTemplate.update(sql, id)
    }

    private fun mapRow(rs: ResultSet): Comunidad {
        return Comunidad(
            id = rs.getLong("id"),
            nombre = rs.getString("nombre"),
            direccion = rs.getString("direccion"),
            fechaCreacion = rs.getTimestamp("fecha_creacion").toLocalDateTime()
        )
    }
}
