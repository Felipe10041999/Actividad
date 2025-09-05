package com.example.actividad.login
import com.example.actividad.usuario.Usuario
import com.example.actividad.usuario.UsuarioService
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service
import org.springframework.jdbc.core.RowMapper
@Service
class LoginService {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate
    val logger = LoggerFactory.getLogger(UsuarioService::class.java)
    var mapRow= RowMapper{rs, _->
        Login(
            rs.getString("email"),
            rs.getString("contrasena"),

        )
    }
    fun validarCredenciales(email: String, contrasena: String): Login? {
        val sql = "SELECT * FROM usuario WHERE email = ? AND contrasena = ?"
        val usuarios = jdbcTemplate.query(sql, mapRow, email, contrasena)

        return if (usuarios.isNotEmpty()) {
            logger.info("Login exitoso para usuario con email: $email")
            usuarios.first()
        } else {
            logger.warn("Intento de login fallido para email: $email")
            null
        }
    }

}