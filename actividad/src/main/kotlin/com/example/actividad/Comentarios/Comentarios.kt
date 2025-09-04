package Comentarios

data class Comentarios (
    private var id: Int?= null,
    private var contenido : String,
    private var aviso_id : Int,
    private var usuario_id : Int,
){
    //GETERS
    fun getId(): Int?{return this.id }
    fun getContenido(): String{return this.contenido }
    fun getAviso(): Int{return this.aviso_id }
    fun getUsuario(): Int{return this.usuario_id }
}