package com.example.actividad.Categoria

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import org.springframework.stereotype.Service


@Service
class CategoriaService {

    private val logger = LoggerFactory.getLogger(CategoriaService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    var mapRow = RowMapper{rs, _-> Categoria(
        id = rs.getLong("id"),
        nombre = rs.getString("nombre"),
        descripcion = rs.getString("descripcion")
    )
    }

    fun obtenerTodos(): List<Categoria> {
        val sql = "SELECT * FROM categoria"
        return jdbcTemplate.query(sql,mapRow)
    }

    fun obtenerPorId(id: Long): Categoria? {
        val sql = "SELECT * FROM categoria WHERE id = ?"
        return jdbcTemplate.queryForObject(sql, mapRow, id)
    }

    fun crear(ejemplo: Categoria): Int {
        val sql = "INSERT INTO categoria (nombre, descripcion) VALUES (?, ?)"
        logger.info("Creando registro: ${ejemplo.getnombre()}")
        return jdbcTemplate.update(sql, ejemplo.getnombre(), ejemplo.getdescripcion())
    }

    fun actualizar(id: Long, ejemplo: Categoria): Int {
        val sql = "UPDATE categoria SET nombre = ?, descripcion = ? WHERE id = ?"
        logger.info("Actualizando registro ID: $id")
        return jdbcTemplate.update(sql, ejemplo.getnombre(), ejemplo.getdescripcion(), id)
    }

    fun eliminar(id: Long): Int {
        val sql = "DELETE FROM categoria WHERE id = ?"
        logger.info("Eliminando registro ID: $id")
        return jdbcTemplate.update(sql, id)
    }


}
