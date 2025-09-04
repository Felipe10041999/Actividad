package com.example.actividad.Notificaciones
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service


@Service
class NotificacionService(
    @Autowired private val jdbcTemplate: JdbcTemplate
) {
    private val logger: Logger = LoggerFactory.getLogger(NotificacionService::class.java) as Logger

    fun crearNotificacion(mensaje: String) {
        val sql = "INSERT INTO notificaciones(mensaje) VALUES(?)"
        val filasInsertadas = jdbcTemplate.update(sql, mensaje)

        if (filasInsertadas > 0) {
            logger.info("Notificación guardada en BD: $mensaje")
        } else {
            logger.warn("Error al guardar notificación en BD: $mensaje")
        }
    }

    fun listarNotificaciones(): List<String> {
        val sql = "SELECT mensaje FROM notificaciones ORDER BY fecha DESC"
        return jdbcTemplate.query(sql) { rs, _ -> rs.getString("mensaje") }
    }
}
