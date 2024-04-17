import 'package:cobros_app/bloc/pagar/pagar_bloc.dart';
import 'package:cobros_app/pages/home_page.dart';
import 'package:cobros_app/pages/pago_completo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PagarBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'pago_completo': (_) => PagoCompletoPage(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
