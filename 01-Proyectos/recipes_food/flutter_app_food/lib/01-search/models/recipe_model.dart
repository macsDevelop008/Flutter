import 'dart:convert';

class RecipeModel {
  final String image;
  final String name;
  final String source; //Fuente
  final String url; //Receta
  final String calories;

  RecipeModel(this.image, this.name, this.source, this.url, this.calories);

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    var image = json['image'];
    var name = json['label'];
    var source = json['source'];
    var url = json['url'];
    var calories = json['calories'].toString();
    var caloriesFormat = calories.split('.');
    return RecipeModel(image, name, source, url, caloriesFormat[0]);
  }
}
