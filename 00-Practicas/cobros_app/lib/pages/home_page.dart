import 'package:cobros_app/bloc/pagar/pagar_bloc.dart';
import 'package:cobros_app/data/tarjetas.dart';
import 'package:cobros_app/helpers/alertas.dart';
import 'package:cobros_app/helpers/navegar_fade_in.dart';
import 'package:cobros_app/pages/tarjeta_page.dart';
import 'package:cobros_app/widgets/total_pay_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pagarBloc = BlocProvider.of<PagarBloc>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  //mostrarLoading(context);
                  //mostrarAlerta(context, 'titulo', 'mensaje');
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: PageController(viewportFraction: 0.9),
                itemCount: tarjetas.length,
                itemBuilder: (BuildContext context, int index) {
                  final tarjeta = tarjetas[index];
                  return GestureDetector(
                    onTap: () {
                      //BlocProvider.of<PagarBloc>(context, listen: false)
                      pagarBloc.add(OnSeleccionarTarjeta(tarjeta: tarjeta));
                      Navigator.push(
                          context, navegarMapaFadeIn(context, TarjetaPage()));
                    },
                    child: Hero(
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
                  );
                },
              ),
            ),
            Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
