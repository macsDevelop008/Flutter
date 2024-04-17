import 'dart:io';

import 'package:cobros_app/bloc/pagar/pagar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '250.55 USD',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          BlocBuilder<PagarBloc, PagarState>(
            builder: (BuildContext context, state) {
              return _BtnPay(
                isActive: state.tarjetaActiva,
              );
            },
          )
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  final bool isActive;

  const _BtnPay({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? buildBotonTarjeta(context)
        : buildAppleAndGooglePay(context);
  }

  Widget buildBotonTarjeta(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 50,
      minWidth: 170,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.solidCreditCard,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Pagar',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 50,
      minWidth: 150,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
            Platform.isAndroid
                ? FontAwesomeIcons.google
                : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Pay',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
