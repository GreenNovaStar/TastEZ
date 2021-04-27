import 'dart:convert';
import 'package:tastez/Middleware/APIParsing/RecipeElement.dart';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  List<RecipeElement> recipes;
  Recipe({this.recipes,});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    recipes: List<RecipeElement>.from(json["recipes"].map((x) => RecipeElement.fromJson(x))),
    // recipes: List<RecipeElement>.from(json[""].map((x) => RecipeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
  };
}