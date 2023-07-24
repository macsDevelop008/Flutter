import '../widgets/widgets.dart';

//Toda la información lista y armada
class DataWeatherTargetModel {
  final String _namePlace;
  final List<MainWeatherImageDataWidget> _carruselData;
  final List<MainWeatherHorizontalDataWidget> _horizontalData;
  final List<MainWeatherVerticalDataWidget> _verticalData;

  DataWeatherTargetModel(this._namePlace, this._horizontalData,
      this._verticalData, this._carruselData);

  String get namePlace => _namePlace;

  List<MainWeatherImageDataWidget> get carruselData => _carruselData;

  List<MainWeatherHorizontalDataWidget> get horizontalData => _horizontalData;

  List<MainWeatherVerticalDataWidget> get verticalData => _verticalData;
}
