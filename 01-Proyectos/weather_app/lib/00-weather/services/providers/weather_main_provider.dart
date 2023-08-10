import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/00-weather/models/models.dart';
import 'package:weather_app/00-weather/screens/weather_screen.dart';
import 'package:weather_app/00-weather/services/services.dart';

class WeatherMainProvider with ChangeNotifier {
  List<DataWeatherCarouselModel>? _casourselData; //Listado data carrusel
  List<DataWeatherDrawerModel>? _drawerData; //Listado data lateral
  String _currentPlaceName = "Sin Data"; //Nombre lugar actual
  int _currentPage = 0; //Primer elemento del carrusel de información
  DataWeatherHistoryHoursDayModel? _currentDataHours; //Data por hora
  DataWeatherHistoryDaysModel? _currentDataDays; //Data días
  bool _isLoadingData = false; //Si está cambiando la data del carrusel
  bool _thereAreInternet = false; //Si hay o no conexion a internet

  /*bool get thereAreInternet => _thereAreInternet;
  setThereAreInternet(value) {
    _thereAreInternet = value;
    notifyListeners();
  }*/

  //Verifica la conexion a internet
  /*Future<bool> internetCheck() async {
    try {
      bool result = await InternetConnectionChecker().hasConnection;
      setThereAreInternet(result);
      return result;
    } catch (e) {
      print('Error internetCheck: $e');
      setThereAreInternet(false);
      return false;
    }
  }*/

  //Initial data
  Future<void> initialData(BuildContext context) async {
    //await internetCheck();
    //if (!_thereAreInternet) return;
    await _dataBDDefault();
    await _calculatedCarouselData();
    await _calculatedDrawerData();
    _currentDataHours = await _horizontalHoursData();
    _currentDataDays = await _verticalDaysData();
    _currentPlaceName = _casourselData![_currentPage].namePlace;
    //Evento
    // ignore: use_build_context_synchronously
    //Navigator.pushNamed(context, WeatherScreen.route);
  }

  //Primer dato a la DB por defecto
  Future<void> _dataBDDefault() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool('default_initial_data') == null) {
        //Datos por defecto
        await LocalDatabase.db.database;
        //Bototá
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('4.597796', '-74.075999'));
        //Tokyo
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('35.748362', '139.960065'));
        //Seoul
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('37.587222', '126.980534'));
        //El Cairo
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('30.055213', '31.242722'));
        //Moscú
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('55.795498', '37.675885'));
        //Sídney
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('-33.859865', '151.182734'));
        //Reikiavik
        await LocalDatabase.db
            .insertPlace(BasicPlaceModel('64.137538', '-21.910767'));

        //Verificador evitar ingreso repetido datos por defecto
        await prefs.setBool('default_initial_data', true);
      }
      //await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      print('Error en _dataBDDefault: $e');
    }
  }

  //calcular data carrusel
  Future<void> _calculatedCarouselData() async {
    try {
      var api = await Api.getInstance();
      _casourselData = await api.carouselData();
    } catch (e) {
      print("Error _calculatedCarouselData: $e");
    }
  }

  //calcular data drawer
  Future<void> _calculatedDrawerData() async {
    try {
      var api = await Api.getInstance();
      _drawerData = await api.drawerData();
    } catch (e) {
      print('Error _calculatedDrawerData: $e');
    }
  }

  //Dar/modificar si está cambiando la data del carrusel
  bool get isLoadingData => _isLoadingData;
  set isLoadingData(bool value) {
    _isLoadingData = value;
    notifyListeners();
  }

  //Dar data carrusel
  List<DataWeatherCarouselModel>? get carouselData {
    return _casourselData;
  }

  //Dar data horizontal
  DataWeatherHistoryHoursDayModel? get currentDataHours => _currentDataHours;

  //Dar data vertical
  DataWeatherHistoryDaysModel? get currentDataDays => _currentDataDays;

  //Dar data lateral
  List<DataWeatherDrawerModel>? get drawerData => _drawerData;

  //Actual index carrusel
  int get currentPage => _currentPage;
  //Modificar actual index carrusel
  modifyCurrentPage(int index) async {
    isLoadingData = true;
    _currentDataHours = null;
    _currentDataDays = null;
    _currentPage = index;
    //Recalcular listado horizontal
    _currentDataHours = await _horizontalHoursData();
    //Recalcular listado vertical
    _currentDataDays = await _verticalDaysData();
    //Titulo actual
    _currentPlaceName = _casourselData![_currentPage].namePlace;
    _isLoadingData = false;
    notifyListeners();
  }

  //Titulo actual
  String get currentPlaceName => _currentPlaceName;

  //Calcular data horizontal segun index carrusel
  Future<DataWeatherHistoryHoursDayModel?> _horizontalHoursData() async {
    try {
      var api = await Api.getInstance();
      var currentDataCarousel = _casourselData![_currentPage];
      var result = api.historyHours(
          dataModel: BasicPlaceModel(
              currentDataCarousel.lat, currentDataCarousel.lon));
      return result;
    } catch (e) {
      print('Error _horizontalHoursData: $e');
      return null;
    }
  }

  //Calcular data vertical segun index carrusel
  Future<DataWeatherHistoryDaysModel?> _verticalDaysData() async {
    try {
      var api = await Api.getInstance();
      var currentDataCarousel = _casourselData![_currentPage];
      var result = api.historyDays(
          dataModel: BasicPlaceModel(
              currentDataCarousel.lat, currentDataCarousel.lon));
      return result;
    } catch (e) {
      print('Error _verticalDaysData: $e');
      return null;
    }
  }

  //Confirma si es valida o no la data
  Future<bool> verifyNewData(BasicPlaceModel data) async {
    try {
      var api = await Api.getInstance();
      var resultApi = await api.currentPlace(dataModel: data);
      return resultApi != null;
    } catch (e) {
      print('Error verifyNewData: $e');
      return false;
    }
  }

  //Verifica si ya existe el lugar o no
  Future<bool> verifyExist(BasicPlaceModel data) async {
    try {
      await LocalDatabase.db.database;
      var result = await LocalDatabase.db.checkExist(data: data);
      return result;
    } catch (e) {
      print('Error verifyExist: $e');
      return false;
    }
  }

  //insertar nuevo lugar
  Future<void> insertNewPlace(BasicPlaceModel data) async {
    await LocalDatabase.db.database;
    await LocalDatabase.db.insertPlace(data);
    //Volver a cargar listado del drawer
    await _calculatedDrawerData();
    //Volver a cargar listado del carrusel
    await _calculatedCarouselData();

    notifyListeners();
  }
}
