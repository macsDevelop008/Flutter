import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: CustomButton(),
        ),
      ),
    );
  }
}

class TestClassAssert {
  final int numTest;
  final String stringTest;

  TestClassAssert(this.stringTest, this.numTest)
      : assert(numTest < 1, 'Numero ingresado invalido'),
        assert(stringTest != 'pablito', 'Nombre ingresado invalido');

  void _testMetodo(int numero) {}
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      //InkeWell -> permite ejecutar eventos pero agregando el efecto "clic"
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(0.5),
          child: Text('Hola mundo'),
        ),
      ),
    );
  }
}
