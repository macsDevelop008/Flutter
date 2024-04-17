import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../bloc/pagar/pagar_bloc.dart';
import '../models/tarjeta_credito.dart';
import '../widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  /*final tarjeta = TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Fernando Herrera');*/
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagarBloc, PagarState>(
      builder: (BuildContext context, state) {
        final tarjeta = state.tarjeta!;
        return Scaffold(
            appBar: AppBar(
              title: Text('Pagar'),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  /*BlocProvider.of<PagarBloc>(context, listen: false)
                      .add(OnDesactivarTarjeta());*/
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                Container(),
                Hero(
                  tag: tarjeta.cardNumber,
                  child: CreditCardWidget(
                    cardNumber: tarjeta.cardNumberHidden,
                    expiryDate: tarjeta.expiracyDate,
                    cardHolderName: tarjeta.cardHolderName,
                    cvvCode: tarjeta.cvv,
                    showBackView: false,
                    onCreditCardWidgetChange: (CreditCardBrand) {},
                  ),
                ),
                Positioned(bottom: 0, child: TotalPayButton())
              ],
            ));
      },
    );
  }
}
