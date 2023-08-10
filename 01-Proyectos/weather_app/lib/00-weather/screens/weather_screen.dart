import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/00-weather/screens/add_country_screen.dart';
import '../services/services.dart';
import '../ui/ui.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class WeatherScreen extends StatelessWidget {
  static const String route = 'weather_screen';
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<WeatherMainProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 252),
      body: (info.carouselData == null || info.carouselData!.isEmpty)
          ? const Center(
              child: Text('No hay información'),
            )
          : _bodyMain(context),
    );
  }

  Scaffold _bodyMain(BuildContext context) {
    var data = Provider.of<WeatherMainProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 252),
      appBar: _appBar(data, context),
      drawer: _drawer(context, data),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CarouselMainWeatherImageView(),
                const DataIconsHorizontalView(),
                const DataIconsVerticalVertical()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(WeatherMainProvider data, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: size.height * 0.08,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              child: (!data.isLoadingData)
                  ? FadeInDown(
                      child: Text(
                        data.currentPlaceName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 35),
                      ),
                    )
                  : const SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 3,
                      ),
                    ),
            ),
            const SizedBox(
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

  Widget _drawer(BuildContext context, WeatherMainProvider data) {
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
                _listDrawer(size, data),
                //Acciones
                _actions(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _actions(BuildContext context) {
    return FadeInRight(
      child: Column(
        children: [
          //Cerrar
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
          //Agregar
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 18),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 244, 247, 252),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 222, 236, 255),
                        offset: Offset(2, 0),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ]),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AddCountryScreen.route);
                },
              ),
            ),
          ),
          //Switch
          //Switch(value: true, thumbIcon: _thumbIcon(), onChanged: (value) {})
        ],
      ),
    );
  }

  Container _listDrawer(Size size, WeatherMainProvider data) {
    var listData = data.drawerData!;
    return Container(
      width: size.width * 0.75,
      height: size.height * 0.91,
      margin: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 222, 236, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), bottomLeft: Radius.circular(18))),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return MainWeatherDrawerItem(
            customIcon: listData[index].customIcon,
            dregress: listData[index].degrees,
            place: listData[index].placeName,
          );
        },
      ),
    );
  }
}
