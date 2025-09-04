package Comentarios
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import org.springframework.stereotype.Service

@Service
class ComentariosService {
    @Autowired
    lateinit var jdbcTemplate: JdbcTemplate
    var mapeo = RowMapper{rs,_-> Comentarios(
        rs.getInt("id"),
        rs.getString("contenido"),
        rs.getInt("aviso_id"),
        rs.getInt("usuario_id")
    ) }
    fun obtenerComentarios(): List<Comentarios> {
        val obtener = "SELECT * FROM comentarios"
        return jdbcTemplate.query(obtener,mapeo )
    }
}