//Administra los estados del usuario_state

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario.dart';

//Importacion especial, ya que usuario_cubit usará directamente el usuario_state
part 'usuario_state.dart';

//En Cubit<> ponemos el tipo de información que va ha manejar int, double, etc
//en este casi son de tipo UsuarioState.
//Por meido de esta clase cambiará la UI de manera condicional
class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void selecccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    //Verificamos que el estado sea en donde existe un usuario
    if (currentState is UsuarioActivo) {
      //usamos el copyWith creado del modelo Usuario y cambiamos el atributo
      final newUser = currentState.usuario.copyWith(edad: 26);
      //Ahora debemos emitir el estado, esto se deve hacer cada vez que mofici-
      //camos algo relacionado al manejador de estados
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    //Regresa al estado inicial
    emit(UsuarioInitial());
  }
}
