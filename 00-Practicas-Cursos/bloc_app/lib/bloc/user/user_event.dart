part of 'user_bloc.dart';

//Aquí están todos los eventos o acciones

@immutable
abstract class UserEvent {}

//Primer evento para crear el usuario
class ActivateUser extends UserEvent {
  final Usuario user;

  ActivateUser(this.user);
}

//Crear evento para modificar la edad del usuario
class ChangeUserAge extends UserEvent {
  final int age;

  ChangeUserAge(this.age);
}
