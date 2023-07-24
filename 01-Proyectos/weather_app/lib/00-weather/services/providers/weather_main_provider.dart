import 'package:flutter/material.dart';
import 'package:weather_app/00-weather/models/models.dart';

class WeatherMainProvider with ChangeNotifier {
  DataWeatherTargetModel? _currentDataPage;

  DataWeatherTargetModel? get currentDataPage => _currentDataPage;

  setCurrentDataPage(BasicPlaceModel basicPlaceMode) async {
    //Data carrusel
    //Titulo
    //Data horizontal
    //Data vertical
    notifyListeners();
  }
}
