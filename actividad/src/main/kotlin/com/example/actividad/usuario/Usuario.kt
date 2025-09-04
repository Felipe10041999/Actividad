package com.example.actividad.usuario

class Usuario(
    private var id: Int? = null,
    private var nombre: String,
    private var email: String,
    private var password: String,
    private var rol: String
) {
    fun getId(): Int? = this.id
    fun getNombre(): String = this.nombre
    fun getEmail(): String = this.email
    fun getPassword(): String = this.password
    fun getRol(): String = this.rol
}
