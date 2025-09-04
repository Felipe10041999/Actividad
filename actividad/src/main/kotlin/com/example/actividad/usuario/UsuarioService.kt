package com.example.actividad.usuario

import com.example.actividad.historial.HistorialService
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service

@Service
class UsuarioService {

    private val logger = LoggerFactory.getLogger(UsuarioService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    @Autowired
    lateinit var historialService: HistorialService

    fun obtenerUsuarios(): List<Usuario> {
        val sql = "SELECT * FROM usuario"
        return jdbcTemplate.query(sql) { rs, _ ->
            Usuario(
                rs.getLong("id"),
                rs.getString("nombre"),
                rs.getString("email"),
                rs.getString("contrasena"),
                rs.getString("direccion"),
                rs.getLong("comunidad_id"),
                rs.getString("rol")
            )
        }
    }

    fun obtenerUsuarioPorId(id: Long): Usuario? {
        val sql = "SELECT * FROM usuario WHERE id = ?"
        return jdbcTemplate.query(sql, arrayOf(id)) { rs, _ ->
            Usuario(
                rs.getLong("id"),
                rs.getString("nombre"),
                rs.getString("email"),
                rs.getString("contrasena"),
                rs.getString("direccion"),
                rs.getLong("comunidad_id"),
                rs.getString("rol")
            )
        }.firstOrNull()
    }

    fun crearUsuario(usuario: Usuario): Int {
        val sql = """
            INSERT INTO usuario (nombre, email, contrasena, direccion, comunidad_id, rol)
            VALUES (?, ?, ?, ?, ?, ?)
        """

        logger.info("Creando nuevo usuario: ${usuario.getNombre()} (${usuario.getRol()}) en comunidad ${usuario.getComunidadid()}")
        return  jdbcTemplate.update(
            sql,
            usuario.getNombre(),
            usuario.getEmail(),
            usuario.getContrasena(),
            usuario.getDireccion(),
            usuario.getComunidadid(),
            usuario.getRol()
        )
    }

    fun actualizarUsuario(id: Long, usuario: Usuario): Int {
        val sql = """
            UPDATE usuario 
            SET nombre = ?, email = ?, contrasena = ?, direccion = ?, comunidad_id = ?, rol = ?
            WHERE id = ?
        """

        logger.info("Actualizando usuario con ID $id")
        val filas = jdbcTemplate.update(
            sql,
            usuario.getNombre(),
            usuario.getEmail(),
            usuario.getContrasena(),
            usuario.getDireccion(),
            usuario.getComunidadid(),
            usuario.getRol(),
            id
        )

        if (filas > 0) {
            historialService.registrarEvento(
                usuarioId = id,
                comunidadId = usuario.getComunidadid(),
                tipoEvento = "USUARIO_ACTUALIZADO",
                descripcion = "El usuario con ID $id fue actualizado"
            )
        }

        return filas
    }

    fun eliminarUsuario(id: Long): Int {
        val sql = "DELETE FROM usuario WHERE id = ?"
        return  jdbcTemplate.update(sql, id)
    }
}
