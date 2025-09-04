package com.example.actividad.aviso

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/avisos")
class AvisosController {

    @Autowired
    lateinit var avisosService: AvisosService

    @GetMapping
    fun obtenerAvisos(): List<Aviso> = avisosService.obtenerAvisos()

    @GetMapping("/{id}")
    fun obtenerAvisoPorId(@PathVariable id: Long): Aviso? = avisosService.obtenerAvisoPorId(id)

    @GetMapping("/estado/{estado}")
    fun obtenerAvisoPorEstado(@PathVariable estado: String): List<Aviso> = avisosService.obtenerAvisoPorEstado(estado)

    @PostMapping
    fun crearAviso(@RequestBody aviso: Aviso): String {
        val filas = avisosService.crearAviso(aviso)
        return if (filas > 0) "Aviso creado correctamente"
        else "Error al crear aviso"
    }

    @PutMapping("/{id}/atender")
    fun atenderAviso(@PathVariable id: Long): String {
        val filas = avisosService.marcarAvisoAtendido(id)
        return if (filas > 0) "Aviso atendido correctamente"
        else "No se encontró el aviso"
    }
    @PutMapping("/{id}/actualizar")
    fun actualizarAviso(@PathVariable id: Long, @RequestBody aviso: Aviso): String {
        val filas = avisosService.actualizarAviso(id,aviso.getTitulo(),aviso.getContenido(),aviso.getCategoriaId())
        return if (filas > 0) "Aviso actualizado correctamente y marcado como ATENDIDO"
        else "No se encontró el aviso"
    }


    @DeleteMapping("{id}")
    fun eliminarAviso(@PathVariable id: Long): String {
        val filas = avisosService.eliminarAviso(id)
        return if (filas > 0) " Aviso eliminado correctamente"
        else "El aviso se eliminó"
    }
}
