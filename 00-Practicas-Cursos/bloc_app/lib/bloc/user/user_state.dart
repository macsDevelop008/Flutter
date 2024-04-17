part of 'user_bloc.dart';

//Se encarga de informar como está el estado de la app, ejemplo,
//el usuario está logueado?
//cuantos productos tiene?
//cuanto es el monto del carrito de compras? etc

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user});
}

//Estado inicial de la aplicacion
class UserInitialState extends UserState {
  //Aquí inicializamos el estado de los atributos padre
  const UserInitialState() : super(existUser: false, user: null);
}

//Nuevo estado
class UserSetState extends UserState {
  final Usuario newUser;

  //Cambiamos los atributos a través del contructor heredado,
  //ya que el padre es el que maneja los atributos como tal
  //y los hijos como esta clase, reciben los nuevos valores de esos
  //atrobutos para despues pasarlos al padre
  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}
