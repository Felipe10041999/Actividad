package com.example.actividad.Comunidad

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import org.springframework.stereotype.Service
import java.sql.ResultSet

@Service
class ComunidadService {

    private val logger = LoggerFactory.getLogger(ComunidadService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate
    var mapRow = RowMapper{rs,_-> Comunidad(
        id = rs.getLong("id"),
        nombre = rs.getString("nombre"),
        direccion = rs.getString("direccion"),
    )
    }
    fun obtenerTodas(): List<Comunidad> {
        val sql = "SELECT * FROM comunidad"
        return jdbcTemplate.query(sql, mapRow)
    }

    fun obtenerPorId(id: Long): Comunidad? {
        val sql = "SELECT * FROM comunidad WHERE id = ?"
        return jdbcTemplate.queryForObject(sql,mapRow,id)
    }

    fun crear(comunidad: Comunidad): Int {
        val sql = "INSERT INTO comunidad (nombre, direccion, fecha_creacion) VALUES (?, ?, NOW())"
        logger.info("Creando comunidad: ${comunidad.getNombre()}")
        return jdbcTemplate.update(sql, comunidad.getNombre(), comunidad.getdireccion())
    }

    fun actualizar(id: Long, comunidad: Comunidad): Int {
        val sql = "UPDATE comunidad SET nombre = ?, direccion = ? WHERE id = ?"
        logger.info("Actualizando comunidad ID: $id")
        return jdbcTemplate.update(sql, comunidad.getNombre(), comunidad.getdireccion(), id)
    }

    fun eliminar(id: Long): Int {
        val sql = "DELETE FROM comunidad WHERE id = ?"
        logger.info("Eliminando comunidad ID: $id")
        return jdbcTemplate.update(sql, id)
    }


}
