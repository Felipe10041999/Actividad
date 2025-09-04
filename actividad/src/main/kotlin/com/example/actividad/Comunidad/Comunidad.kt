package com.example.actividad.Comunidad

import java.time.LocalDateTime

data class Comunidad(
    val id: Long = 0,
    val nombre: String,
    val direccion: String,
    val fechaCreacion: LocalDateTime = LocalDateTime.now()
)
