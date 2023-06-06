import 'package:animate_do/animate_do.dart';
import 'package:emergency_layout/widgets/fat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  static final items = <ItemBoton>[
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
  ];

  List<Widget> itemMap = items
      .map((item) => FadeInLeft(
            child: FatButton(
              icon: item.icon,
              titulo: item.texto,
              onPress: () {
                print("Función");
              },
              color1: item.color1,
              color2: item.color2,
            ),
          ))
      .toList();

  EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 80,
                ),
                ...itemMap
              ],
            ),
          ),
          _Cabecera()
        ],
      ),
    );
  }
}

class _Cabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
            icon: FontAwesomeIcons.plus,
            titulo: 'Asistencia Médica',
            subTitulo: 'Haz solicitado'),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                child: FaIcon(FontAwesomeIcons.ellipsis, color: Colors.white)))
      ],
    );
  }
}

class _FatButtonFinal extends StatelessWidget {
  const _FatButtonFinal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.carCrash,
      titulo: 'Motor Acidente',
      onPress: () {
        print('Metodo 1');
      },
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subTitulo: 'Has solicitado',
      titulo: 'Asistencia Médica',
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}
