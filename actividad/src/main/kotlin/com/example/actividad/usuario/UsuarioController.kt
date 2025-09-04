package com.example.actividad.usuario

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/usuarios")
class UsuarioController {

    @Autowired
    lateinit var usuarioService: UsuarioService

    @GetMapping
    fun listarUsuarios(): List<Usuario> = usuarioService.obtenerUsuarios()

    @GetMapping("/{id}")
    fun obtenerUsuarioPorId(@PathVariable id: Long): Usuario? = usuarioService.obtenerUsuarioPorId(id)

    @PostMapping
    fun crearUsuario(@RequestBody usuario: Usuario): String {
        val filas = usuarioService.crearUsuario(usuario)
        return if (filas > 0) "Usuario creado correctamente" else "Error al crear usuario"
    }

    @PutMapping("/{id}")
    fun actualizarUsuario(@PathVariable id: Long, @RequestBody usuario: Usuario): String {
        val filas = usuarioService.actualizarUsuario(id, usuario)
        return if (filas > 0) "Usuario actualizado correctamente" else "Usuario no encontrado"
    }

    @DeleteMapping("/{id}")
    fun eliminarUsuario(@PathVariable id: Long): String {
        val filas = usuarioService.eliminarUsuario(id)
        return if (filas > 0) "Usuario eliminado correctamente" else "Usuario no encontrado o error"
    }
}
