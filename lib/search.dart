import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dio/dio.dart';

class Search extends StatelessWidget {

  final BaseOptions options = new BaseOptions(
    baseUrl: "https://rapidapi.p.rapidapi.com",
    connectTimeout:5000,
    receiveTimeout:3000,
    headers: {
      "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "x-rapidapi-key": "0b83fa3f6emshf35335a21f7c826p178545jsnf157389bedd5",
      "useQueryString": true,
    },
    contentType: "application/json",
  );

  void basicSearch(query) async {
    String query;
    final Dio spoon = new Dio(options);
    Response spoonResp = await spoon.get("/recipes/complexSearch", queryParameters: {"query": query});
  }

  void advancedSearch() async {
    Dio spoonDio = new Dio();
    Response spoonResp = await spoonDio.get("/recipes/complexSearch", queryParameters: {"query": "potato"});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
    );
  }
}