package com.example.actividad.comentario

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/comentarios")
class ComentarioController {

    @Autowired
    lateinit var comentarioService: ComentarioService

    @PostMapping
    fun agregarComentario(@RequestBody comentario: Comentario): String {
        val filas = comentarioService.agregarComentario(comentario)
        return if (filas > 0) "Comentario agregado correctamente" else "Error al agregar comentario"
    }

    @GetMapping("/aviso/{avisoId}")
    fun obtenerPorAviso(@PathVariable avisoId: Long): List<Comentario> {
        return comentarioService.obtenerComentariosPorAviso(avisoId)
    }

    @PutMapping("/{id}")
    fun actualizarComentario(@PathVariable id: Long, @RequestParam contenido: String): String {
        val filas = comentarioService.actualizarComentario(id, contenido)
        return if (filas > 0) "Comentario actualizado correctamente" else "No se pudo actualizar el comentario"
    }

    @DeleteMapping("/{id}")
    fun eliminarComentario(@PathVariable id: Long): String {
        val filas = comentarioService.eliminarComentario(id)
        return if (filas > 0) "Comentario eliminado correctamente" else "No se pudo eliminar el comentario"
    }
}
