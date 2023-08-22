class QueryModel {
  final String? _keyWord;
  final String? _numIngredients;
  final List<String>? _diet;
  final List<String>? _health;
  final String? _cuisineType;
  final List<String>? _mealType;
  final String? _dishType;
  final String? _calories;

  QueryModel(
      {required String? keyWord,
      String? numIngredients,
      List<String>? diet,
      List<String>? health,
      String? cuisineType,
      List<String>? mealType,
      String? dishType,
      String? calories})
      : _calories = calories,
        _numIngredients = numIngredients,
        _dishType = dishType,
        _mealType = mealType,
        _cuisineType = cuisineType,
        _health = health,
        _diet = diet,
        _keyWord = keyWord;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {'q': _keyWord};

    if (_numIngredients != null) {
      result['ingr'] = _numIngredients;
    }
    if (_calories != null) {
      result['calories'] = _calories;
    }
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
