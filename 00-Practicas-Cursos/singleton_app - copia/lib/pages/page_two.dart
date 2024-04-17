import 'package:flutter/material.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAgina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              color: Colors.blue[200],
              child: Text('Establecer Usuario'),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue[200],
              child: Text('Cambiar Edad'),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue[200],
              child: Text('Añadir Profesion'),
            ),
          ],
        ),
      ),
    );
  }
}
