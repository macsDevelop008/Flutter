import 'package:flutter/material.dart';

import '../../01-search/models/models.dart';
import '../../01-search/services/api_service.dart';

class RecipeResultService extends ChangeNotifier {
  void backToSearch(BuildContext context) {
    Navigator.pop(context);
  }

  Future<List<RecipeModel>?> caculateData(QueryModel queryModel) async {
    var api = await Api.getInstance();
    var result = await api.recipeResult(queryModel.toMap());
    return result;
  }
}
