package com.example.actividad.aviso

data class Aviso(
    val id: Long,
    val titulo: String,
    val descripcion: String,
    val categoriaId: String,
    val estado: String,
    val usuarioId: Long
)