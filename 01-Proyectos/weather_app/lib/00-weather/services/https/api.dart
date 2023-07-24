import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/models.dart';

enum RoutesApi { current, historyDays, historyCurrentDay }

class Api {
  static Api? instantiate;
  final String _url = 'api.weatherbit.io';
  final String _apiKey = '14a8d8e465444710ac072a577e867c13';
  int _timeOut = 0;

  //Rutas
  final Map<RoutesApi, String> _routes = {
    RoutesApi.current: '/v2.0/current',
    RoutesApi.historyDays: '/v2.0/forecast/daily',
    RoutesApi.historyCurrentDay: '/v2.0/history/hourly'
  };

  static Future<Api> getInstance() async {
    if (instantiate != null) {
      return instantiate!;
    } else {
      instantiate = Api();
      return instantiate!;
    }
  }

  Future<Map<String, dynamic>?> currentPlace(
      {required BasicPlaceModel dataModel}) async {
    try {
      var queryParameters = {
        'lat': dataModel.lat,
        'lon': dataModel.lon,
        'key': _apiKey
      };

      final response = await http
          .get(Uri.https(_url, _routes[RoutesApi.current]!, queryParameters));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final resultJson = jsonDecode(response.body);
        return ({
          'temp': resultJson['data'][0]['temp'],
          'clouds': resultJson['data'][0]['clouds'],
          'city_name': resultJson['data'][0]['city_name'],
          'icon_code': resultJson['data'][0]['weather']['code']
        });
      }
      return null;
    } catch (e) {
      // ignore: avoid_print
      print('Error currentPlace: $e');
      return null;
    }
  }

  Future<DataWeatherHistoryDaysModel?> historyDays(
      {required BasicPlaceModel dataModel}) async {
    try {
      var queryParameters = {
        'lat': dataModel.lat,
        'lon': dataModel.lon,
        'key': _apiKey
      };
      final response = await http.get(
          Uri.https(_url, _routes[RoutesApi.historyDays]!, queryParameters));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final resultJson = jsonDecode(response.body);
        return DataWeatherHistoryDaysModel.fromJson(resultJson['data']);
      }
      return null;
    } catch (e) {
      // ignore: avoid_print
      print('Error historyDays: $e');
      return null;
    }
  }

  Future<DataWeatherHistoryHoursDayModel?> historyHours(
      {required BasicPlaceModel dataModel}) async {
    DateTime now = DateTime.now();
    String startDate = now.toString().split(' ')[0];
    DateTime tomorrow = new DateTime.now().add(Duration(days: 1));
    String endDate = tomorrow.toString().split(' ')[0];
    var queryParameters = {
      'lat': dataModel.lat,
      'lon': dataModel.lon,
      'start_date': startDate,
      'end_date': endDate,
      'tz': 'local',
      'key': _apiKey
    };
    try {
      final response = await http.get(Uri.https(
          _url, _routes[RoutesApi.historyCurrentDay]!, queryParameters));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final resultJson = jsonDecode(response.body);
        return DataWeatherHistoryHoursDayModel.fromJson(resultJson['data']);
      }
      return null;
    } catch (e) {
      // ignore: avoid_print
      print('Error historyHours: $e');
      return null;
    }
  }
}
