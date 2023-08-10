import 'dart:convert';

import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

//Data de los 16 días - historico
class DataWeatherHistoryDaysModel {
  List<DataWeatherHistoryDayModel> _listDataHistoryDays;

  DataWeatherHistoryDaysModel(this._listDataHistoryDays);

  factory DataWeatherHistoryDaysModel.fromJson(List<dynamic> data) {
    List<DataWeatherHistoryDayModel> list = [];

    for (var element in data) {
      list.add(
          DataWeatherHistoryDayModel.fromJson(jsonDecode(jsonEncode(element))));
    }
    return DataWeatherHistoryDaysModel(list);
  }

  List<DataWeatherHistoryDayModel> get listDataHistoryDays =>
      _listDataHistoryDays;
}

//Data de un día individual
class DataWeatherHistoryDayModel {
  String _day;
  String _from;
  String _to;
  Widget _codeCustomIcon;
  String _clouds;

  DataWeatherHistoryDayModel(
      this._day, this._from, this._to, this._codeCustomIcon, this._clouds);

  factory DataWeatherHistoryDayModel.fromJson(Map<String, dynamic> data) {
    String day = formatDay(data['datetime'].toString());

    Widget customIcon = formatCustomIconWeather(
        data['weather']['code'].toString(),
        width: 43,
        isIcon: true);

    return DataWeatherHistoryDayModel(day, data['app_min_temp'].toString(),
        data['app_max_temp'].toString(), customIcon, data['clouds'].toString());
  }

  String get day => _day;
  String get from => _from;
  String get to => _to;
  Widget get customIcon => _codeCustomIcon;
  String get clouds => _clouds;
}
