package com.example.actividad.historial

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/historial")
class HistorialController {

    @Autowired
    lateinit var historialService: HistorialService

    // Obtener todo el historial
    @GetMapping
    fun obtenerHistorial(): List<HistorialEvento> {
        return historialService.obtenerHistorial()
    }

    // Obtener historial por comunidad
    @GetMapping("/comunidad/{comunidadId}")
    fun obtenerPorComunidad(@PathVariable comunidadId: Long): List<HistorialEvento> {
        return historialService.obtenerHistorialPorComunidad(comunidadId)
    }

    // Obtener historial por usuario
    @GetMapping("/usuario/{usuarioId}")
    fun obtenerPorUsuario(@PathVariable usuarioId: Long): List<HistorialEvento> {
        return historialService.obtenerHistorialPorUsuario(usuarioId)
    }
}
