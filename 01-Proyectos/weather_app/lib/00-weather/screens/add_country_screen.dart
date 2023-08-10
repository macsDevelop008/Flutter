import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/00-weather/models/models.dart';
import 'package:weather_app/00-weather/services/providers/weather_main_provider.dart';
import 'package:weather_app/00-weather/ui/modal_add_weather.dart';

class AddCountryScreen extends StatefulWidget {
  static const String route = 'add_country_screen';
  const AddCountryScreen({super.key});

  @override
  State<AddCountryScreen> createState() => _AddCountryScreenState();
}

class _AddCountryScreenState extends State<AddCountryScreen> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 247, 252),
        appBar: AppBar(
          title: FadeInDown(
            child: const Text(
              'Agregar Coordenadas',
              style: TextStyle(color: Colors.black),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 244, 247, 252),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  width: size.width * 0.92,
                  height: size.height * 0.38,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 236, 255),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Latitud
                      _partForm(
                          size, latController, 'Latitud', 'Ingresar latitud'),
                      //Longitud
                      _partForm(
                          size, lonController, 'Longitud', 'Ingresar longitud'),
                    ],
                  ),
                ),
                _ButtonWidget(
                    latController: latController,
                    lonController: lonController,
                    size: size)
              ],
            ),
          ),
        ));
  }

  Widget _partForm(Size size, TextEditingController? controller, String title,
      String subTitle) {
    return FadeInRight(
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: size.width * 0.8,
        height: size.height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width * 0.8,
              height: size.height * 0.065,
              color: Colors.transparent,
              child: Text(
                '$title:',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.8,
              height: size.height * 0.065,
              color: Colors.transparent,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(labelText: subTitle),
                keyboardType: TextInputType.number,
                //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    super.key,
    required this.latController,
    required this.lonController,
    required this.size,
  });

  final TextEditingController latController;
  final TextEditingController lonController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherMainProvider>(context);
    return FadeInUp(
      child: TextButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();
            //print('lat: ${latController.text}');
            //print('lon: ${lonController.text}');
            var model = BasicPlaceModel(latController.text, lonController.text);
            //Load
            openLoadingCustom(context);
            //Verificar por medio de la API si es valida la data para almacenar
            if (await data.verifyNewData(
                BasicPlaceModel(latController.text, lonController.text))) {
              //Verificar si la data no existe ya
              if (await data.verifyExist(
                  BasicPlaceModel(latController.text, lonController.text))) {
                //Cerar load
                // ignore: use_build_context_synchronously
                closeLoadingCustom(context);
                //Modal ya existe la data
                // ignore: use_build_context_synchronously
                dialogAddWeather(context, false, 'Los datos ya existen.');
              } else {
                //Almacenar
                await data.insertNewPlace(model);
                //Limpiar textfiels
                latController.clear();
                lonController.clear();
                //Cerar load
                // ignore: use_build_context_synchronously
                closeLoadingCustom(context);
                //Modal check
                // ignore: use_build_context_synchronously
                dialogAddWeather(context, true, 'Lugar almacenado.');
              }
            } else {
              //Cerar load
              // ignore: use_build_context_synchronously
              closeLoadingCustom(context);
              //Error data modal
              // ignore: use_build_context_synchronously
              dialogAddWeather(context, false, 'Datos inválidos.');
            }
          },
          child: Container(
            width: size.width * 0.35,
            height: size.height * 0.05,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 222, 236, 255),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(79, 0, 0, 0),
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      spreadRadius: 0.5)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Agregar'),
                SizedBox(
                  width: size.width * 0.02,
                ),
                const Icon(Icons.add)
              ],
            ),
          )),
    );
  }
}
