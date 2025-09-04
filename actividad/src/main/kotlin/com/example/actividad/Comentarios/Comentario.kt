package com.example.actividad.comentario

import java.time.LocalDateTime

data class Comentario(
    val id: Long = 0,
    val contenido: String,
    val usuarioId: Long?,
    val avisoId: Long,
    val comunidadId: Long?, // NUEVO CAMPO
    val fechaCreacion: LocalDateTime = LocalDateTime.now()
)