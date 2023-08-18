class DietModel {
  final int _id;
  final String _valueEs;
  final String _valueEn;

  DietModel(this._id, this._valueEs, this._valueEn);

  int get id => _id;
  String get valueEs => _valueEs;
  String get valueEn => _valueEn;
}
