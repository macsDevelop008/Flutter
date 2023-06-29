import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

//El tiene la información del estado actual y procesa los eventos
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    //Aquí se crea el manejo del evento "ActivateUser"
    //event -> toda la data que tiene la info de los componentes
    //o atributos o parametros
    //emit -> es la que se utiliza para emitir un estado de manera condicional
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.user));
    });

    //Implementar evento para el cambio de edad
    on<ChangeUserAge>((event, emit) {
      //Podemos usar state ya que viene implicito en el Bloc
      if (!state.existUser) return;
      //El usuario no está null gracias a la validacion de la linea anterior
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });
  }
}
