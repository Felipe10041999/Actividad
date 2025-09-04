package com.example.actividad.usuario

class Usuario(
    private val id: Long,
    private val nombre: String,
    private val email: String,
    private val contrasena: String,
    private val direccion: String,
    private val comunidadId: Long,
    private val rol: String
){
    fun getId():Long{return this.id}
    fun getNombre():String{return this.nombre}
    fun getEmail():String{return this.email}
    fun getContrasena():String{return this.contrasena}
    fun getDireccion():String{return this.direccion}
    fun getComunidadid():Long{return this.comunidadId}
    fun getRol():String{return this.rol}

}
