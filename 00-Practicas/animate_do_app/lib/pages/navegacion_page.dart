import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: _BotonFlotante(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bone), label: 'Bones'),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: BounceInDown(
                        from: 10,
                        animate: (numero > 0) ? true : false,
                        child: Bounce(
                          controller: (controller) =>
                              Provider.of<_NotificationModel>(context)
                                  .bounceController = controller,
                          from: 10,
                          child: Container(
                            alignment: Alignment.center,
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle),
                            child: Text(
                              '$numero',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 9),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dog), label: 'My Dog'),
        ]);
  }
}

class _BotonFlotante extends StatelessWidget {
  const _BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int numero =
            Provider.of<_NotificationModel>(context, listen: false).numero;
        numero++;
        Provider.of<_NotificationModel>(context, listen: false).numero = numero;

        if (numero >= 2) {
          final controller =
              Provider.of<_NotificationModel>(context, listen: false)
                  .bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  late int _numero = 0;
  late AnimationController _bounceController;

  int get numero => this._numero;
  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController a) {
    this._bounceController = a;
    //notifyListeners();
  }
}
