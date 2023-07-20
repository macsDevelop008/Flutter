import 'package:bloc/bloc.dart';
import 'package:cobros_app/models/tarjeta_credito.dart';
import 'package:meta/meta.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(PagarInitial()) {
    on<OnSeleccionarTarjeta>((event, emit) {
      emit(PagarTarjeta(tarjetaCredito: event.tarjeta));
    });
    on<OnDesactivarTarjeta>((event, emit) {
      emit(DesactivarTarjeta());
    });
  }
}
