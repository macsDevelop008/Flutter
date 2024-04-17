//Contiene los multiples estados de usuario

//Le decimos que será una parte del usuario_cubit
part of 'usuario_cubit.dart';

//Immutable, es decir que una vez creada su instancía estas no se pueden
//modificar
@immutable
abstract class UsuarioState {}

//Estado inicial, la idea es que la app tome todas las propiedades INICIALMENTE,
//que tiene este estado inicial
class UsuarioInitial extends UsuarioState {
  //por ejemplo, inicialmente no existirá un usuario
  final bool existeUsuario = false;
}

//Estado que significa que ya hay un usuario almacenado
//Se debe extender de "UsuarioState" para que el usuario_cubit
//lo pueda recibir y utilizar
class UsuarioActivo extends UsuarioState {
  //En este estado ya tendria un usuario y su información en el objeto

  final bool existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
