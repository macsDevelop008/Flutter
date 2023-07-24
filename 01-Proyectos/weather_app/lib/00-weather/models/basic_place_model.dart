class BasicPlaceModel {
  String _lat;
  String _lon;

  BasicPlaceModel(this._lat, this._lon);

  factory BasicPlaceModel.fromJson(Map<String, dynamic> data) {
    return BasicPlaceModel(data['lat'], data['lon']);
  }

  Map<String, dynamic> toJson() => {'lat': _lat, 'lon': _lon};

  String get lat => _lat;
  String get lon => _lon;
}
