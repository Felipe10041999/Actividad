package com.example.actividad.aviso
import java.sql.Timestamp
import java.time.LocalDateTime

class Aviso(
    private val id: Long = 0,
    private val titulo: String,
    private val contenido: String,
    private val estado: String = "ACTIVO",
    private val categoriaId: Long,
    private val usuarioId: Long,
    private val comunidadId: Long,
){
    fun getId(): Long{return this.id}
    fun getTitulo(): String{return this.titulo}
    fun getContenido(): String{return this.contenido}
    fun getEstado(): String{return this.estado}
    fun getCategoriaId(): Long{return this.categoriaId}
    fun getUsuarioId(): Long{return this.usuarioId}
    fun getComunidadId(): Long{return this.comunidadId}
}