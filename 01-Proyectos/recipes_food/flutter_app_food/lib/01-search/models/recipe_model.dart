class RecipeModel {
  final String _image;
  final String _name;
  final String _source; //Fuente
  final String _url; //Receta
  final String _calories;

  RecipeModel(this._image, this._name, this._source, this._url, this._calories);

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    var image = json['image'];
    var name = json['label'];
    var source = json['source'];
    var url = json['url'];
    var calories = json['calories'].toString();
    var caloriesFormat = calories.split('.');
    return RecipeModel(image, name, source, url, caloriesFormat[0]);
  }

  String get image => _image;
  String get name => _name;
  String get source => _source; //Fuente
  String get url => _url; //Receta
  String get calories => _calories;
}
