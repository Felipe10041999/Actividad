package com.example.actividad.historial

import java.time.LocalDateTime

data class HistorialEvento(
    val id: Long = 0,
    val usuarioId: Long?,
    val comunidadId: Long?,
    val tipoEvento: String,
    val descripcion: String,
    val fecha: LocalDateTime = LocalDateTime.now()
)