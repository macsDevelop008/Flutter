import 'dart:convert';

import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class DataWeatherHistoryHoursDayModel {
  List<DataWeatherHourDayModel> _listDataWeatherHours;

  DataWeatherHistoryHoursDayModel(this._listDataWeatherHours);

  factory DataWeatherHistoryHoursDayModel.fromJson(List<dynamic> data) {
    List<DataWeatherHourDayModel> result = [];
    var finalElements = getElementsCount(data, 12);
    for (var element in finalElements) {
      result.add(
          DataWeatherHourDayModel.fromJson(jsonDecode(jsonEncode(element))));
    }
    return DataWeatherHistoryHoursDayModel(result);
  }

  List<DataWeatherHourDayModel> get listDataWeatherHours =>
      _listDataWeatherHours;
}

class DataWeatherHourDayModel {
  String _time;
  String _percentage;
  Widget _customIcon;

  DataWeatherHourDayModel(this._time, this._percentage, this._customIcon);

  factory DataWeatherHourDayModel.fromJson(Map<String, dynamic> data) {
    //print(data['clouds']);
    var time = data['datetime'].toString().split(':');
    var timeResult = '${time[1]}:00';

    var customIcon = formatCustomIconWeather(data['weather']['code'].toString(),
        width: 48, isIcon: true);
    return DataWeatherHourDayModel(
        timeResult, data['clouds'].toString(), customIcon);
  }

  String get time => _time;
  String get percentage => _percentage;
  Widget get customIcon => _customIcon;
}
