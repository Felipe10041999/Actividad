package com.example.actividad.Categoria

import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import java.sql.ResultSet

@Service
class CategoriaService {

    private val logger = LoggerFactory.getLogger(CategoriaService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun obtenerTodos(): List<Categoria> {
        val sql = "SELECT * FROM categoria"
        return jdbcTemplate.query(sql) { rs, _ -> mapRow(rs) }
    }

    fun obtenerPorId(id: Long): Categoria? {
        val sql = "SELECT * FROM categoria WHERE id = ?"
        return jdbcTemplate.query(sql, arrayOf(id)) { rs, _ -> mapRow(rs) }.firstOrNull()
    }

    fun crear(ejemplo: Categoria): Int {
        val sql = "INSERT INTO categoria (nombre, descripcion) VALUES (?, ?)"
        logger.info("Creando registro: ${ejemplo.nombre}")
        return jdbcTemplate.update(sql, ejemplo.nombre, ejemplo.descripcion)
    }

    fun actualizar(id: Long, ejemplo: Categoria): Int {
        val sql = "UPDATE categoria SET nombre = ?, descripcion = ? WHERE id = ?"
        logger.info("Actualizando registro ID: $id")
        return jdbcTemplate.update(sql, ejemplo.nombre, ejemplo.descripcion, id)
    }

    fun eliminar(id: Long): Int {
        val sql = "DELETE FROM categoria WHERE id = ?"
        logger.info("Eliminando registro ID: $id")
        return jdbcTemplate.update(sql, id)
    }

    private fun mapRow(rs: ResultSet): Categoria {
        return Categoria(
            id = rs.getLong("id"),
            nombre = rs.getString("nombre"),
            descripcion = rs.getString("descripcion")
        )
    }
}
