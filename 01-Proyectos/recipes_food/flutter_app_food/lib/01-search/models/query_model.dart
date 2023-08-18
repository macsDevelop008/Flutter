class QueryModel {
  final String? _keyWord;
  final List<String>? _diet;
  final List<String>? _health;
  final List<String>? _cuisineType;
  final List<String>? _mealType;
  final List<String>? _dishType;
  final String? _calories;

  QueryModel(
      {required String? keyWord,
      List<String>? diet,
      List<String>? health,
      List<String>? cuisineType,
      List<String>? mealType,
      List<String>? dishType,
      String? calories})
      : _calories = calories,
        _dishType = dishType,
        _mealType = mealType,
        _cuisineType = cuisineType,
        _health = health,
        _diet = diet,
        _keyWord = keyWord;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {'q': _keyWord};

    if (_diet != null) {
      result['diet'] = _diet;
    }
    if (_health != null) {
      result['health'] = _health;
    }
    if (_cuisineType != null) {
      result['cuisineType'] = _cuisineType;
    }
    if (_mealType != null) {
      result['mealType'] = _mealType;
    }
    if (_dishType != null) {
      result['dishType'] = _dishType;
    }
    if (_calories != null) {
      result['calories'] = _calories;
    }

    return result;
  }
}
