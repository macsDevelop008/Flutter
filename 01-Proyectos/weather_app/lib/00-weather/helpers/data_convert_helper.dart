import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ui/ui.dart';

String formatDay(String dataString) {
  String result = '';
  var date = DateTime.parse(dataString);
  var format = DateFormat('EEEE').format(date).toUpperCase();
  switch (format) {
    case 'MONDAY':
      result = 'LUN';
      break;
    case 'TUESDAY':
      result = 'MAR';
      break;
    case 'WEDNESDAY':
      result = 'MIE';
      break;
    case 'THURSDAY':
      result = 'JUE';
      break;
    case 'FRIDAY':
      result = 'VIE';
      break;
    case 'SATURDAY':
      result = 'SAB';
      break;
    case 'SUNDAY':
      result = 'DOM';
      break;
  }
  return result;
}

Widget formatCustomIconWeather(String code,
    {double width = 200, bool isIcon = false}) {
  Widget result = aloneCloud();

  //Rayo
  if (code == '200' ||
      code == '201' ||
      code == '202' ||
      code == '230' ||
      code == '231' ||
      code == '232' ||
      code == '233') {
    result = (!isIcon) ? rayCloud(width: width) : iconRayCloud(width: width);
  }

  //Lluvia
  if (code == '300' ||
      code == '301' ||
      code == '302' ||
      code == '500' ||
      code == '501' ||
      code == '502' ||
      code == '511' ||
      code == '520' ||
      code == '521' ||
      code == '522') {
    return (!isIcon) ? rainCloud(width: width) : iconRainCloud(width: width);
  }

  //Nieve
  if (code == '600' ||
      code == '601' ||
      code == '602' ||
      code == '610' ||
      code == '611' ||
      code == '612' ||
      code == '621' ||
      code == '622' ||
      code == '623') {
    return (!isIcon) ? rainCloud(width: width) : iconRainCloud(width: width);
  }

  //Sin sol
  if (code == '700' ||
      code == '711' ||
      code == '721' ||
      code == '731' ||
      code == '741' ||
      code == '751' ||
      code == '804') {
    return (!isIcon) ? aloneCloud(width: width) : iconAloneCloud(width: width);
  }

  //Sol
  if (code == '800' || code == '801' || code == '802' || code == '803') {
    if (width == 200) {
      return sunCloud(width: 141);
    }
    return (!isIcon) ? sunCloud(width: width) : iconSunCloud(width: width);
  }

  return result;
}

List<dynamic> getElementsCount(List<dynamic> data, int getItems) {
  List<dynamic> result = [];
  for (var i = 0; i < getItems; i++) {
    result.add(data[i]);
  }
  return result;
}
