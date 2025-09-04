package Comentarios
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*
import org.springframework.web.bind.annotation.RestController
@RestController
class ComentariosController{
    @Autowired
    lateinit var comentariosService: ComentariosService

    @GetMapping("/comentarios")
    fun obtenerComentarios(): List<Comentarios>{
        return comentariosService.obtenerComentarios()
    }
}