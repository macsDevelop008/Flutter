import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  //Se pasa el estado inicial del bloc, se puede cambiar al que se necesite
  //en este caso es "PokemonInitialState"
  PokemonBloc() : super(const PokemonInitialState()) {
    //Evento al que apuntamos "ChangeCityEvent".
    //event -> contiene la data de los componentes o atributos del evento
    //ChangeCityEvent en este caso.
    //emit -> permite emitir el estado.
    //state -> permite acceder a los atributos del estado padre.
    on<ChangeCityEvent>((event, emit) {
      //Dentro podemos crear la logica que queramos
      if (state.esLegendario) {
        print("hola");
      }

      //Emitimos el estado, usamos el state para enviar los valores que no
      //se cambiarán ni llegarán por parametro
      //Del vent tomamos el valor llegado por parametro
      emit(PokemonChangeCityState(
          newCiudadActual: event.newCity,
          currentEsLegendario: state.esLegendario,
          currentEdad: state.edad));
    });

    on<ChangeAgeEvent>((event, emit) {
      emit(PokemonChangeEdadState(
          currentCiudadActual: state.ciudadActual, newEdad: event.newAge));
    });
  }
}
