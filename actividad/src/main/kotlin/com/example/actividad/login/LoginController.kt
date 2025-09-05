package com.example.actividad.login

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController

@RestController
class LoginController {
    @Autowired
    lateinit var loginService: LoginService
    @PostMapping("/login")

    fun login(@RequestBody login: Login): String {
        val usuario = loginService.validarCredenciales(login.getEmail(), login.getContrasena())
        return if (usuario != null) {
            "Login exitoso. Bienvenido"
        } else {
            "Credenciales inválidas"
        }
    }

}