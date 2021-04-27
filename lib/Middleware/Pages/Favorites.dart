

import 'package:tastez/Middleware/APIParsing/RecipeElement.dart';

class Favorites {
  RecipeElement recipe;
  bool isFavorite;

  Favorites({this.recipe, this.isFavorite});

  Favorites.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipe'] = recipe.toJson();
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}