import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class DataWeatherDrawerModel {
  final String _placeName;
  final Widget _customIcon;
  final String _degrees;

  DataWeatherDrawerModel(this._placeName, this._customIcon, this._degrees);

  factory DataWeatherDrawerModel.fromJson(Map<String, dynamic> data) {
    var customIcon = formatCustomIconWeather(data['icon_code'].toString(),
        isIcon: true, width: 50);
    return DataWeatherDrawerModel(
        data['city_name'].toString(), customIcon, data['temp'].toString());
  }

  String get placeName => _placeName;
  Widget get customIcon => _customIcon;
  String get degrees => _degrees;
}
