package com.example.actividad.usuario

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/usuarios")
class UsuarioController {

    @Autowired
    lateinit var usuarioservicio: UsuarioServicio

    @GetMapping
    fun obtenerUsuarios(): List<Usuario> {
        return usuarioservicio.obtenerUsuarios()
    }

    @PostMapping
    fun crearUsuario(@RequestBody usuario: Usuario): String {
        val resultado = usuarioservicio.agregarUsuario(usuario)
        return if (resultado > 0) {
            "Usuario creado correctamente"
        } else {
            "Error al crear el usuario"
        }
    }

    @PutMapping("/{id}")
    fun actualizarUsuario(@PathVariable id: Int, @RequestBody usuario: Usuario): String {
        val resultado = usuarioservicio.actualizarUsuario(id, usuario)
        return if (resultado > 0) {
            "Usuario actualizado correctamente"
        } else {
            "No se encontró el usuario con id $id"
        }
    }

    @DeleteMapping("/{id}")
    fun eliminarUsuario(@PathVariable id: Int): String {
        val resultado = usuarioservicio.eliminarUsuario(id)
        return if (resultado > 0) {
            "Usuario eliminado correctamente"
        } else {
            "No se encontró el usuario con id $id"
        }
    }
}