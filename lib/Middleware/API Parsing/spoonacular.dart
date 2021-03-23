import 'package:dio/dio.dart';

class Spoonacular {
  static BaseOptions getBaseOptions() {
    return new BaseOptions(
      baseUrl: "https://rapidapi.p.rapidapi.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
        "x-rapidapi-key": "0b83fa3f6emshf35335a21f7c826p178545jsnf157389bedd5",
        "useQueryString": true,
      },
      contentType: "application/json",
    );
  }
}

