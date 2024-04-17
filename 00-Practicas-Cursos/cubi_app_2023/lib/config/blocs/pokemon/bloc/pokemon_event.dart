part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class ChangeCityEvent extends PokemonEvent {
  final String newCity;

  const ChangeCityEvent(this.newCity);
}

class ChangeAgeEvent extends PokemonEvent {
  final int newAge;

  const ChangeAgeEvent(this.newAge);
}
