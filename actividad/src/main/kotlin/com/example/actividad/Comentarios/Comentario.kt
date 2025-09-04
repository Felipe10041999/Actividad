package com.example.actividad.comentario

import java.time.LocalDateTime

class Comentario(
    private val id: Long = 0,
    private val contenido: String,
    private val usuarioId: Long,
    private val avisoId: Long,
    private val comunidadId: Long,
    private val fechaCreacion: LocalDateTime = LocalDateTime.now()
){
    fun getId():Long{return this.id}
    fun getContenido():String{return this.contenido}
    fun getUsuarioId():Long{return this.usuarioId}
    fun getAvisoId():Long{return this.avisoId}
    fun getComunidadid():Long{return this.comunidadId}
}