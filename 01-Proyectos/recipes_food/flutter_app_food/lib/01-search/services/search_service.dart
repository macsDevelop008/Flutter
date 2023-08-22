import 'package:flutter/material.dart';
import 'package:flutter_app_food/01-search/models/models.dart';
import 'package:flutter_app_food/01-search/services/api_service.dart';
import 'package:flutter_app_food/02-recipe_result/screens/recipe_result_screen.dart';

class SearchService extends ChangeNotifier {
  //! ATRIBUTOS --------------------

  //*DATOS PARA LLENAR LISTAS
  //Opciones listado dieta
  final List<DietModel> _listDiets = [
    DietModel(1, 'equilibrado', 'balanced'),
    DietModel(2, 'alto contenido de fibra', 'high fiber'),
    DietModel(3, 'alto en proteína', 'high protein'),
    DietModel(4, 'baja en carbohidratos', 'low-carb'),
    DietModel(5, 'bajo en grasa', 'low fat'),
    DietModel(6, 'bajo en sodi', 'low-sodium'),
  ];

  //Opciones listado salud
  final List<HealthModel> _listHealth = [
    HealthModel(1, 'alcohol-coctel', 'alcohol-cocktail'),
    HealthModel(2, 'sin alcohol', 'alcohol-free'),
    HealthModel(3, 'sin apio', 'celery-free'),
    HealthModel(4, 'libre de crustáceos', 'crustacean-free'),
    HealthModel(5, 'libre de lácteos', 'dairy-free'),
    HealthModel(6, 'sin huevo', 'egg-free'),
    HealthModel(7, 'libre de pescado', 'fish-free'),
    HealthModel(8, 'sin gluten', 'gluten-free'),
    HealthModel(9, 'apto para riñones', 'kidney-friendly'),
    HealthModel(10, 'comestible según la ley judía', 'kosher'),
    HealthModel(11, 'bajo en potasio', 'low-potassium'),
    HealthModel(12, 'bajo nivel de azúcar', 'low-sugar'),
    HealthModel(13, 'mediterráneo', 'mediterranean'),
    HealthModel(14, 'libre de moluscos', 'mollusk-free'),
    HealthModel(15, 'sin mostaza', 'mustard-free'),
    HealthModel(16, 'sin aceite añadido', 'no-oil-added'),
    HealthModel(17, 'sin maní', 'peanut-free'),
    HealthModel(18, 'vegano', 'vegan'),
    HealthModel(19, 'sin carne roja', 'red-meat-free'),
    HealthModel(20, 'sin trigo', 'wheat-free'),
  ];

  //Opciones listado tipo cocina
  final List<DropdownMenuItem<Object>> _listTypeCuisine = [
    DropdownMenuItem(
      value: 0,
      child: Text(
        "Seleccione una opcion",
        style: TextStyle(color: Colors.black.withOpacity(0.3)),
      ),
    ),
    const DropdownMenuItem(
      value: "amaerican",
      child: Text("americano"),
    ),
    const DropdownMenuItem(
      value: "asian",
      child: Text("asiático"),
    ),
    const DropdownMenuItem(
      value: "british",
      child: Text("británico"),
    ),
    const DropdownMenuItem(
      value: "caribbean",
      child: Text("caribe"),
    ),
    const DropdownMenuItem(
      value: "central europe",
      child: Text("europa Central"),
    ),
    const DropdownMenuItem(
      value: "chinese",
      child: Text("chino"),
    ),
    const DropdownMenuItem(
      value: "eastern europe",
      child: Text("europa del Este"),
    ),
    const DropdownMenuItem(
      value: "french",
      child: Text("francés"),
    ),
    const DropdownMenuItem(
      value: "indian",
      child: Text("indio"),
    ),
    const DropdownMenuItem(
      value: "italian",
      child: Text("italiano"),
    ),
    const DropdownMenuItem(
      value: "italian",
      child: Text("italiano"),
    ),
    const DropdownMenuItem(
      value: "japanese",
      child: Text("japonés"),
    ),
    const DropdownMenuItem(
      value: "mediterranean",
      child: Text("mediterráneo"),
    ),
    const DropdownMenuItem(
      value: "mexican",
      child: Text("mexicano"),
    ),
    const DropdownMenuItem(
      value: "nordic",
      child: Text("nórdico"),
    ),
    const DropdownMenuItem(
      value: "south american",
      child: Text("sudamericano"),
    ),
    const DropdownMenuItem(
      value: "south east asian",
      child: Text("sudeste Asiatico"),
    ),
  ];

  //Opciones listado tipo cocina
  final List<DropdownMenuItem<Object>> _listTypeFood = [
    DropdownMenuItem(
      value: 0,
      child: Text(
        "Seleccione una opcion",
        style: TextStyle(color: Colors.black.withOpacity(0.3)),
      ),
    ),
    const DropdownMenuItem(
      value: "breakfast",
      child: Text("desayuno"),
    ),
    const DropdownMenuItem(
      value: "dinner",
      child: Text("cena"),
    ),
    const DropdownMenuItem(
      value: "lunch",
      child: Text("almuerzo"),
    ),
    const DropdownMenuItem(
      value: "snack",
      child: Text("bocadillo"),
    ),
    const DropdownMenuItem(
      value: "teatime",
      child: Text("la hora del té"),
    ),
  ];

  //Opciones listado tipo de plato
  final List<DropdownMenuItem<Object>> _listTypePlate = [
    DropdownMenuItem(
      value: 0,
      child: Text(
        "Seleccione una opcion",
        style: TextStyle(color: Colors.black.withOpacity(0.3)),
      ),
    ),
    const DropdownMenuItem(
      value: "bread",
      child: Text("pan"),
    ),
    const DropdownMenuItem(
      value: "cereals",
      child: Text("cereales"),
    ),
    const DropdownMenuItem(
      value: "condiments and sauces",
      child: Text("condimentos y salsas"),
    ),
    const DropdownMenuItem(
      value: "desserts",
      child: Text("postres"),
    ),
    const DropdownMenuItem(
      value: "drinks",
      child: Text("bebidas"),
    ),
    const DropdownMenuItem(
      value: "main course",
      child: Text("plato principal"),
    ),
    const DropdownMenuItem(
      value: "pancake",
      child: Text("tortita"),
    ),
    const DropdownMenuItem(
      value: "preserve",
      child: Text("preservar"),
    ),
    const DropdownMenuItem(
      value: "salad",
      child: Text("ensalada"),
    ),
    const DropdownMenuItem(
      value: "sandwiches",
      child: Text("sándwiches"),
    ),
    const DropdownMenuItem(
      value: "side dish",
      child: Text("guarnición"),
    ),
    const DropdownMenuItem(
      value: "soup",
      child: Text("sopa"),
    ),
    const DropdownMenuItem(
      value: "starter",
      child: Text("inicio"),
    ),
    const DropdownMenuItem(
      value: "sweets",
      child: Text("dulces"),
    ),
  ];

  //*DATOS PARA CALCULOS
  List<RecipeModel>? _dataResult;
  final TextEditingController _keyWordController = TextEditingController();
  late String _keyword = '';

  final TextEditingController _numIngredientsController =
      TextEditingController();
  late String _numIngredients = '';

  late List<DietModel> _selectedDiets = [];
  late List<HealthModel> _selectedHealth = [];
  late Object? _selectedTypeCuisine = 0;
  late Object? _selectedTypePlate = 0;

  final TextEditingController _numCaloriesController = TextEditingController();
  late String _numCalories = '';

  //! METODOS ------------------------

  List<DietModel> get listDiets => _listDiets;
  List<HealthModel> get listHealth => _listHealth;
  List<DropdownMenuItem<Object>> get listTypeCuisine => _listTypeCuisine;
  List<DropdownMenuItem<Object>> get listTypeFood => _listTypeFood;
  List<DropdownMenuItem<Object>> get listTypePlate => _listTypePlate;
  List<RecipeModel>? get dataResult => _dataResult;

  // ignore: unnecessary_getters_setters
  TextEditingController get keyWordController => _keyWordController;
  TextEditingController get numIngredientsController =>
      _numIngredientsController;
  TextEditingController get numCaloriesController => _numCaloriesController;

  // ignore: unnecessary_getters_setters
  String get keyword => _keyword;
  set keyword(String value) {
    _keyword = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  String get numIngredients => _numIngredients;
  set numIngredients(String value) {
    _numIngredients = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  List<DietModel> get selectedDiets => _selectedDiets;
  set selectedDiets(List<DietModel> value) {
    _selectedDiets = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  List<HealthModel> get selectedHealth => _selectedHealth;
  set selectedHealth(List<HealthModel> value) {
    _selectedHealth = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  Object? get selectedTypeCuisine => _selectedTypeCuisine;
  set selectedTypeCuisine(Object? value) {
    _selectedTypeCuisine = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  /*List<DropdownMenuItem<Object>> get selectedTypeFood => _selectedTypeFood;
  set selectedTypeFood(List<DropdownMenuItem<Object>> value) {
    _selectedTypeFood = value;
    notifyListeners();
  }*/

  // ignore: unnecessary_getters_setters
  Object? get selectedTypePlate => _selectedTypePlate;
  set selectedTypePlate(Object? value) {
    _selectedTypePlate = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  String get numCalories => _numCalories;
  set numCalories(String value) {
    _numCalories = value;
    notifyListeners();
  }

  //Ejecuta el calculo resultante de la consulta
  Future<List<RecipeModel>?> caculateData(QueryModel queryModel) async {
    var api = await Api.getInstance();
    _dataResult = await api.recipeResult(queryModel.toMap());
    //notifyListeners();
    return _dataResult;
    /*
    QueryModel(
                    keyWord: 'pollo',
                    calories: '100-500',
                    health: ['alcohol-free', 'celery-free'])
     */
  }

  void removeAllValues(BuildContext context) {
    hideKeyboard(context);
    _keyWordController.clear();
    _keyword = '';
    _numIngredientsController.clear();
    _numIngredients = '';
    _selectedDiets = [];
    _selectedHealth = [];
    _selectedTypeCuisine = 0;
    _selectedTypePlate = 0;
    _numCaloriesController.clear();
    _numCalories = '';
    notifyListeners();
  }

  void clearKeyWord() {
    _keyword = '';
    _keyWordController.clear();
    notifyListeners();
  }

  void clearNumIngredients() {
    _numIngredients = '';
    _numIngredientsController.clear();
    notifyListeners();
  }

  void clearDiet() {
    _selectedDiets = [];
    notifyListeners();
  }

  void clearHealt() {
    _selectedHealth = [];

    notifyListeners();
  }

  void clearNumCalories() {
    _numCalories = '';
    _numCaloriesController.clear();
    notifyListeners();
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void changePageToResults(BuildContext context) {
    hideKeyboard(context);
    Navigator.pushNamed(context, RecipeResultScreen.route);
  }
}
