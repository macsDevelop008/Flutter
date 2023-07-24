import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class WeatherScreen extends StatelessWidget {
  static const String route = 'weather_screen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 252),
      appBar: _appBar(),
      drawer: _drawer(context),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CarouselMainWeatherImageView(),
                DataIconsHorizontalView(),
                DataIconsVerticalVertical()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 60,
      title: const Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text(
              //TODO: Cambiar segun la data actual
              'currentPlace',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 35),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.list),
            color: Colors.black,
            iconSize: 35,
          );
        },
      ),
      //actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list_outlined))],
    );
  }

  Widget _drawer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 239, 244, 252),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Listado
                _listDrawer(size),
                //Acciones
                _actions(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _actions(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25, left: 15),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 18),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 247, 252),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 222, 236, 255),
                      offset: Offset(2, 0),
                      blurRadius: 5,
                      spreadRadius: 1)
                ]),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () {},
            ),
          ),
        ),
        //Switch
        //Switch(value: true, thumbIcon: _thumbIcon(), onChanged: (value) {})
      ],
    );
  }

  Container _listDrawer(Size size) {
    return Container(
      width: 310,
      height: size.height * 0.91,
      margin: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 222, 236, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), bottomLeft: Radius.circular(18))),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return MainWeatherDrawerItem(
            customIcon: SvgPicture.asset(
              'assets/image/svg/Icon/Icono_Nube_Sol.svg',
              width: 50,
            ),
            dregress: '32',
            place: 'TOKYO',
          );
        },
      ),
    );
  }
}
