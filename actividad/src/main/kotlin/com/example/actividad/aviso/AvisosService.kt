package com.example.actividad.aviso

import com.example.actividad.historial.HistorialService
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Service

@Service
class AvisosService {

     val logger = LoggerFactory.getLogger(AvisosService::class.java)

    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate

    @Autowired
    lateinit var historialService: HistorialService


    fun obtenerAvisos(): List<Aviso> {
        val sql = "SELECT * FROM aviso"
        return jdbcTemplate.query(sql) { rs, _ ->
            Aviso(
                rs.getLong("id"),
                rs.getString("titulo"),
                rs.getString("contenido"),
                rs.getString("estado"),
                rs.getLong("categoria_id"),
                rs.getLong("usuario_id"),
                rs.getLong("comunidad_id"),
            )
        }
    }

    fun obtenerAvisoPorId(id: Long): Aviso? {
        val sql = "SELECT * FROM aviso WHERE id = ?"
        return jdbcTemplate.queryForObject(sql, arrayOf(id)) { rs, _ ->
            Aviso(
                rs.getLong("id"),
                rs.getString("titulo"),
                rs.getString("contenido"),
                rs.getString("estado"),
                rs.getLong("categoria_id"),
                rs.getLong("usuario_id"),
                rs.getLong("comunidad_id"),
            )
        }
    }fun obtenerAvisoPorEstado(estado: String): List<Aviso> {
        val sql = "SELECT * FROM aviso WHERE estado = ?"
        return jdbcTemplate.query(sql, arrayOf(estado)) { rs, _ ->
            Aviso(
                rs.getLong("id"),
                rs.getString("titulo"),
                rs.getString("contenido"),
                rs.getString("estado"),
                rs.getLong("categoria_id"),
                rs.getLong("usuario_id"),
                rs.getLong("comunidad_id"),
            )
        }
    }

    fun crearAviso(aviso: Aviso): Int {
        val sql = """
            INSERT INTO aviso (titulo, contenido, estado, categoria_id, usuario_id, comunidad_id, fecha_creacion)
            VALUES (?, ?, ?, ?, ?, ?, NOW())
        """
        logger.info("Creando nuevo aviso con título: ${aviso.getTitulo()} publicado en comunidad ${aviso.getComunidadId()}")

        val filas = jdbcTemplate.update(
            sql,
            aviso.getTitulo(),
            aviso.getContenido(),
            aviso.getEstado(),
            aviso.getCategoriaId(),
            aviso.getUsuarioId(),
            aviso.getComunidadId()
        )

        if (filas > 0) {
            historialService.registrarEvento(
                usuarioId = aviso.getUsuarioId(),
                comunidadId = aviso.getComunidadId(),
                tipoEvento = "AVISO_CREADO",
                descripcion = "Se creó un aviso con título '${aviso.getTitulo()}'"
            )
        }

        return filas
    }
    fun marcarAvisoAtendido(id: Long): Int {
        val sql = "UPDATE aviso SET estado = 'ATENDIDO' WHERE id = ?"
        logger.info("Se notifica que el aviso con ID $id se marca como ATENDIDO")

        val filas = jdbcTemplate.update(sql, id)

        if (filas > 0) {
            val datos = obtenerAvisoPorId(id)
            historialService.registrarEvento(
                usuarioId =datos?.getUsuarioId(),
                comunidadId = datos?.getComunidadId(),
                tipoEvento = "AVISO_ATENDIDO",
                descripcion = "El aviso con ID $id fue marcado como atendido"
            )
        }

        return filas
    }
    fun actualizarAviso(id: Long, nuevoTitulo: String, nuevoContenido: String, nuevaCategoriaId: Long): Int {
        val sql = """
        UPDATE aviso 
        SET titulo = ?, contenido = ?, categoria_id = ?, estado = 'ATENDIDO' 
        WHERE id = ?
    """

        logger.info("Actualizando aviso ID $id con nuevo título: $nuevoTitulo, nueva categoría: $nuevaCategoriaId")

        val filas = jdbcTemplate.update(sql, nuevoTitulo, nuevoContenido, nuevaCategoriaId, id)

        if (filas > 0) {
            val datos = obtenerAvisoPorId(id)
            historialService.registrarEvento(
                usuarioId = datos?.getUsuarioId(),
                comunidadId = datos?.getComunidadId(),
                tipoEvento = "AVISO_ACTUALIZADO",
                descripcion = "El aviso con ID $id fue actualizado con nuevos datos: título='$nuevoTitulo', categoría=$nuevaCategoriaId"
            )
        }

        return filas
    }

    fun eliminarAviso(id: Long): Int {
        val sql = "DELETE FROM aviso WHERE id = ?"
        logger.info("Se eliminó el aviso con ID: $id")

        return jdbcTemplate.update(sql, id)

    }
}
