package com.example.actividad.Notificaciones

import java.time.LocalDateTime

data class Notificacion(
    val id: Long? = null,
    val mensaje: String,
    val fecha: LocalDateTime? = null
)