import 'package:flutter/material.dart';
import '../helpers/helpers.dart';

class DataWeatherCarouselModel {
  String _namePlace;
  String _temp;
  Widget _customIcon;
  String _clouds;
  String _lat;
  String _lon;

  DataWeatherCarouselModel(this._namePlace, this._temp, this._customIcon,
      this._clouds, this._lat, this._lon);

  factory DataWeatherCarouselModel.fromJson(Map<String, dynamic> data) {
    var customIcon = formatCustomIconWeather(data['icon_code'].toString());
    return DataWeatherCarouselModel(
      data['city_name'].toString(),
      data['temp'].toString(),
      customIcon,
      data['clouds'].toString(),
      data['lat'].toString(),
      data['lon'].toString(),
    );
  }

  String get namePlace => _namePlace;
  String get temp => _temp;
  Widget get customIcon => _customIcon;
  String get clouds => _clouds;
  String get lat => _lat;
  String get lon => _lon;
}
