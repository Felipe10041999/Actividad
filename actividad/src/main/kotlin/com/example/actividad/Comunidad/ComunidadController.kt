package com.example.actividad.Comunidad

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/comunidades")
class ComunidadController {

    @Autowired
    lateinit var comunidadService: ComunidadService

    @GetMapping
    fun obtenerTodas(): List<Comunidad> = comunidadService.obtenerTodas()

    @GetMapping("/{id}")
    fun obtenerPorId(@PathVariable id: Long): Comunidad? = comunidadService.obtenerPorId(id)

    @PostMapping
    fun crear(@RequestBody comunidad: Comunidad): String {
        val filas = comunidadService.crear(comunidad)
        return if (filas > 0) "Comunidad creada correctamente" else "Error al crear comunidad"
    }

    @PutMapping("/{id}")
    fun actualizar(@PathVariable id: Long, @RequestBody comunidad: Comunidad): String {
        val filas = comunidadService.actualizar(id, comunidad)
        return if (filas > 0) "Comunidad actualizada correctamente" else "No se pudo actualizar"
    }

    @DeleteMapping("/{id}")
    fun eliminar(@PathVariable id: Long): String {
        val filas = comunidadService.eliminar(id)
        return if (filas > 0) "Comunidad eliminada correctamente" else "No se pudo eliminar"
    }
}
