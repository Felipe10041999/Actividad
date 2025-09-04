package com.example.actividad.Comunidad

class Comunidad(
    private val id: Long = 0,
    private val nombre: String,
    private val direccion: String,
){
    fun getId():Long{return this.id}
    fun getNombre():String{return this.nombre}
    fun getdireccion():String{return this.direccion}
}
