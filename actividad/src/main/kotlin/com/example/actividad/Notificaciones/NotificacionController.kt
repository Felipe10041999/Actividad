package com.example.actividad.Notificaciones

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/notificaciones")
class NotificacionController(
    @Autowired private val notificacionService: NotificacionService) {

    // Endpoint para crear una notificación
    @PostMapping
    fun crearNotificacion(@RequestBody request: Notificacion): String {
        notificacionService.crearNotificacion(request.mensaje)
        return "Notificación creada"
    }

    // Endpoint para listar notificaciones
    @GetMapping
    fun listarNotificaciones(): List<String> {
        return notificacionService.listarNotificaciones()
    }
}


