package com.example.actividad.Categoria

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/categoria")
class CategoriaController {

    @Autowired
    lateinit var categoriaService: CategoriaService

    @GetMapping
    fun obtenerTodos(): List<Categoria> = categoriaService.obtenerTodos()

    @GetMapping("/{id}")
    fun obtenerPorId(@PathVariable id: Long): Categoria? = categoriaService.obtenerPorId(id)

    @PostMapping
    fun crear(@RequestBody categoria: Categoria): String {
        val filas = categoriaService.crear(categoria)
        return if (filas > 0) "Registro creado correctamente" else "Error al crear"
    }

    @PutMapping("/{id}")
    fun actualizar(@PathVariable id: Long, @RequestBody categoria: Categoria): String {
        val filas = categoriaService.actualizar(id,categoria)
        return if (filas > 0) "Registro actualizado" else "Error al actualizar"
    }

    @DeleteMapping("/{id}")
    fun eliminar(@PathVariable id: Long): String {
        val filas = categoriaService.eliminar(id)
        return if (filas > 0) "Registro eliminado" else "Error al eliminar"
    }
}

