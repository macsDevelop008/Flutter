import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/user/user_bloc.dart';
import 'package:singleton_app/models/usuario.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                //Ejecutando un evento, muy parecido al provider, el "listen"
                //funcional igual que en el provider y va falso porque estamos
                //dentro de una funcion
                BlocProvider.of<UserBloc>(context, listen: false).add(
                    ActivateUser(
                        Usuario(nombre: 'Miguel', edad: 25, profesiones: [])));
              },
              color: Colors.blue[200],
              child: Text('Establecer Usuario'),
            ),
            MaterialButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(ChangeUserAge(26));
              },
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
