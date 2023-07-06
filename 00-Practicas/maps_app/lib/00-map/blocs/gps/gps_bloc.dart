import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? _gpsServiceSubscription;
  GpsBloc() : super(GpsInitial()) {
    on<GpsOnEvent>((event, emit) {
      emit(GpsOn(event.isGpsEnabled, state.isGpsPermissionGranted));
    });
    on<GpsPermissionEvent>((event, emit) {
      emit(GpsPermission(state.isGpsEnabled, event.isGpsPermissionGranted));
    });
    //Se incializa junto con las construccion del bloc
    _init();
  }

  //Solo se ejecuta la primera vez, los liteners quedan llamandose a lo largo
  //de la aplicacion
  Future<void> _init() async {
    final isEnabled = await _checkGpsStatus();
    final isGranted = await _isPermissionGranted();

    //Llama los metodos async al tiempo
    /*final gpsInitStatus =
        await Future.wait([_checkGpsStatus(), _isPermissionGranted()]);
    print(gpsInitStatus[0]);
    print(gpsInitStatus[1]);*/
    //Para llamar un evento FUERA del constructor del bloc, no usamos "emit"
    //usamos "add" y el atributo "state" se puede usar sin problema.
    //Para saber si tiene encendida la ubicación
    add(GpsOnEvent(isGpsEnabled: isEnabled));
    //Para saber si ya se tiene permisos para usar el gps
    add(GpsPermissionEvent(isGpsPermissionGranted: isGranted));
  }

  Future<bool> _isPermissionGranted() async {
    //Retorna un true si ya fue otorgado el permiso a la ubicacion,
    // si no un false
    final _isGranted = await Permission.location.isGranted;
    return _isGranted;
  }

  Future<bool> _checkGpsStatus() async {
    //True o false, segun si la ubicacion está habilidata o no, pero solo se
    //ejecuta 1 vez, no es un listener. Es decir solo es el estado inicial.
    final isEnable = await Geolocator.isLocationServiceEnabled();

    //Permite estár escuchando el estado constantemente enviando un 0 para
    //false y 1 para true, es el estado recurrente o actualizado.
    _gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      print('estado del servicio gps: $event');
      final isEnableListener = event.index == 1;
      //Evento cambio de estado
      add(GpsOnEvent(isGpsEnabled: isEnableListener));
    });
    return isEnable;
  }

  //Permiso de uso de posicion
  Future<void> askGpsAccess() async {
    //Retorna el estado del permiso
    final status = await Permission.location.request();
    //Solo si se dio el pemriso requerido permite avanzar
    if (status == PermissionStatus.granted) {
      //Llama el evento para cambiar el estado
      add(GpsPermissionEvent(isGpsPermissionGranted: true));
    } else {
      add(GpsPermissionEvent(isGpsPermissionGranted: false));
      //Abre las opciones del telefono para que lo haga manualmente
      openAppSettings();
    }
  }

  //Se ejecuta cuando se cierra el Bloc
  @override
  Future<void> close() {
    //Cerrar los listeners, en este caso el del gps
    _gpsServiceSubscription?.cancel();
    return super.close();
  }
}
