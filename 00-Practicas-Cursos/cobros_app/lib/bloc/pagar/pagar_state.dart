part of 'pagar_bloc.dart';

@immutable
abstract class PagarState {
  final double montoPagar;
  final String moneda;
  final bool tarjetaActiva;
  final TarjetaCredito? tarjeta;

  PagarState(
      {this.montoPagar = 200.56,
      this.moneda = 'USD',
      this.tarjetaActiva = false,
      this.tarjeta});
}

class PagarInitial extends PagarState {}

class PagarTarjeta extends PagarState {
  final TarjetaCredito tarjetaCredito;
  PagarTarjeta({required this.tarjetaCredito})
      : super(tarjetaActiva: true, tarjeta: tarjetaCredito);
}

class DesactivarTarjeta extends PagarState {
  DesactivarTarjeta() : super(tarjetaActiva: false);
}
