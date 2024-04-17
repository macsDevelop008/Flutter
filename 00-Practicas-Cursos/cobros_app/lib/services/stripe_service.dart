import 'dart:ffi';

import 'package:flutter/material.dart';

class StripeService {
  //Singleton
  StripeService._privateContructor();
  static final StripeService _intance = StripeService._privateContructor();
  factory StripeService() => _intance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  String _secretKey =
      'sk_test_51NRKS8AMLUTfV27dORoQM4eZwB6xmwxhre49VeC8sbjL0YRlBpFIHjAfDaPU71VKIE6u16syb8Bxt29vbV4Wx8PH00nJWLa1AL';

  //Inicializacion
  void init() {}

  //Metodos de pago
  Future pagarConTarjetaExiste(
      {required String amount, required String currency}) async {}
  Future pagarConTarjetaNueva() async {}
  Future pagarAppleGooglePay() async {}

  //Flujo del pago
  Future _crearPaymentIntent() async {}
  Future _realizarPago() async {}
}
