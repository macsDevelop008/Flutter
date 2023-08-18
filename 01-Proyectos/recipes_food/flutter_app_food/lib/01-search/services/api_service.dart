import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_app_food/01-search/models/recipe_model.dart';
import 'package:dio/dio.dart';

class Api {
  static Api? instantiate;
  final Dio _dio = Dio();
  final String _url = 'https://api.edamam.com';
  final String _appId = 'ae60db49';
  final String _appKey = '87c32696c65146d0f6dc2ae40640b031';
  final String _route = '/api/recipes/v2';

  static Future<Api> getInstance() async {
    if (instantiate != null) {
      return instantiate!;
    }

    instantiate = Api();
    return instantiate!;
  }

  Future<List<RecipeModel>?> recipeResult(
      Map<String, dynamic> queryParam) async {
    try {
      /*var queryParamater = {
        'type': 'public',
        'app_id': 'ae60db49',
        'app_key': '87c32696c65146d0f6dc2ae40640b031',
        'q': q,
        'diet': ['high-protein', 'low-carb'],
        'health': ['alcohol-cocktail', 'alcohol-free'],
        'cuisineType': ['American'],
        'mealType': ['Breakfast'],
        'dishType': ['Bread'],
        'calories': '10'
      };*/
      queryParam['type'] = 'public';
      queryParam['app_id'] = _appId;
      queryParam['app_key'] = _appKey;
      // ignore: avoid_print
      print(queryParam);
      final response =
          await _dio.get('$_url$_route', queryParameters: queryParam);
      // ignore: avoid_print
      print(response.statusCode);
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        //print(response.data['hits'][0]['recipe']['label']);
        //print(response.data['hits'][0]['recipe']);
        var formatDataJson =
            jsonDecode(jsonEncode(response.data['hits'])) as List;

        List<RecipeModel> result = [];
        for (var i = 0; i < formatDataJson.length; i++) {
          result.add(RecipeModel.fromJson(formatDataJson[i]['recipe']));
        }
        //print(result.length);
        return result;
      } else {
        // ignore: avoid_print
        print('Vacio');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
