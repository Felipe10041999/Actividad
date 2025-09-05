package com.example.actividad.login

class Login(
    private val email: String,
    private val contrasena: String
)
{
    fun getEmail(): String{return this.email}
    fun getContrasena(): String{return this.contrasena}
}

