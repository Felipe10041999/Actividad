package com.example.actividad.usuario

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service

@Service
class UsuarioServicio {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    fun obtenerUsuarios(): List<Usuario> {
        val sql = "SELECT id, nombre, email, password, rol FROM usuarios"
        return jdbcTemplate.query(sql) { rs, _ ->
            Usuario(
                id = rs.getInt("id"),
                nombre = rs.getString("nombre"),
                email = rs.getString("email"),
                password = rs.getString("password"),
                rol = rs.getString("rol")
            )
        }
    }

    fun agregarUsuario(usuario: Usuario): Int {
        val sql = "INSERT INTO usuarios (nombre, email, password, rol) VALUES (?, ?, ?, ?)"
        return jdbcTemplate.update(
            sql,
            usuario.getNombre(),
            usuario.getEmail(),
            usuario.getPassword(),
            usuario.getRol()
        )
    }

    fun actualizarUsuario(id: Int, usuario: Usuario): Int {
        val sql = "UPDATE usuarios SET nombre = ?, email = ?, password = ?, rol = ? WHERE id = ?"
        return jdbcTemplate.update(
            sql,
            usuario.getNombre(),
            usuario.getEmail(),
            usuario.getPassword(),
            usuario.getRol(),
            id
        )
    }

    fun eliminarUsuario(id: Int): Int {
        val sql = "DELETE FROM usuarios WHERE id = ?"
        return jdbcTemplate.update(sql, id)
    }
}