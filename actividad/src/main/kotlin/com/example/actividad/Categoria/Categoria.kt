package com.example.actividad.Categoria

class Categoria(
    private val id: Long = 0,
    private val nombre: String,
    private val descripcion: String
){
    fun getId():Long{return this.id}
    fun getnombre():String{return this.nombre}
    fun getdescripcion():String{return this.descripcion}
}