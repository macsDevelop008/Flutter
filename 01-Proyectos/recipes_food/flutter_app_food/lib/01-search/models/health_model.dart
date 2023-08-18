class HealthModel {
  final int _id;
  final String _valueEs;
  final String _valueEn;

  HealthModel(this._id, this._valueEs, this._valueEn);

  int get id => _id;
  String get valueEs => _valueEs;
  String get valueEn => _valueEn;
}
