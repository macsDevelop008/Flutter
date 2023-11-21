part of 'pokemon_bloc.dart';

//En la clase padre se declaran todos los atributos
sealed class PokemonState extends Equatable {
  //Se pueden declarar nulas o como se necesiten
  final bool esLegendario;
  final String ciudadActual;
  final int edad;
  final bool esUnHuevo;

  //Se puede poner required si se desea o valores por defecto, como se requiera
  const PokemonState(
      {required this.esLegendario,
      required this.ciudadActual,
      required this.edad,
      required this.esUnHuevo});

  @override
  List<Object> get props => [esLegendario, ciudadActual, edad];
}

final class PokemonInitialState extends PokemonState {
  //Pueden solicitarse como parametro los atributos
  //const PokemonInitialState(super.esLegendario, super.ciudadActual, super.edad);

  //Pueden declararse directamente
  const PokemonInitialState()
      : super(
            esLegendario: false,
            ciudadActual: "Ibagué",
            edad: 1,
            esUnHuevo: false);
}

final class PokemonChangeCityState extends PokemonState {
  //parametro solicitado como nuevo
  final String newCiudadActual;
  //parametros que solicitan su valor actual
  final bool currentEsLegendario;
  final int currentEdad;

  const PokemonChangeCityState(
      {required this.newCiudadActual,
      required this.currentEsLegendario,
      required this.currentEdad})
      : super(
            esLegendario: currentEsLegendario,
            ciudadActual: newCiudadActual,
            edad: currentEdad,
            //Este atributo no se pide por parametro, toma este valor por
            //deseicion del desarrollador
            esUnHuevo: false);
}

final class PokemonChangeEdadState extends PokemonState {
  final String currentCiudadActual;
  final int newEdad;

  const PokemonChangeEdadState(
      {required this.currentCiudadActual, required this.newEdad})
      : super(
            esLegendario: false, //Valor por desicion del desarrollador
            ciudadActual: currentCiudadActual, //Valor actual
            edad: newEdad, //Nuevo valor
            esUnHuevo: true //Valor por desicion del desarrollador
            );
}
