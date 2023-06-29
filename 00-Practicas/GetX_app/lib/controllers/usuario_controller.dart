import 'package:get/get.dart';
import 'package:singleton_app/models/usuario.dart';

class UsuarioController extends GetxController {
  //GetX usa caracteristicas reactivas, entonces en los controladores
  //se declaran las variables de esta forma con var y .obs al final
  //esto hace que las variables sean de tipo observable como el patron de Diseño

  //bool existeUsuario = false;
  var existeUsuario = false.obs;
  //Usuario usuario = Usuario();
  var usuario = Usuario().obs;

  //Forma 1
  void cargarUsuario(Usuario pUsuario) {
    this.usuario.value = pUsuario;
    this.existeUsuario.value = true;
  }

  void cambiarEdad(int edad) {
    this.usuario.update((val) {
      val!.edad = edad;
    });
  }
}
