import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:tastez/Middleware/APIParsing/Recipe.dart';
import 'package:tastez/Middleware/APIParsing/RecipeElement.dart';
import 'package:tastez/Middleware/APIParsing/WinePairing/WinePairing.dart';
import 'package:tastez/Middleware/Pages/Favorites.dart';
import 'package:tastez/Middleware/Pages/ShoppingListElement.dart';
import 'package:tastez/pantry.list.dart';
import 'package:tastez/prefs.dart';

class UserDatabase {
  List<User> users;

  UserDatabase({this.users});

  UserDatabase.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<User>();
      json['users'].forEach((v) {
        users.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int id;
  String uuid;
  String name;
  String email;
  Prefs prefs;
  Pantry pantry;
  List<Favorites> favorites;
  List<ShoppingListElement> shopping;
  List<String> previousSearches;
  List<String> searchFilter;
  Set<String> webViewFavorites;

  final DateTime time = new DateTime.now();
  final BaseOptions _options = new BaseOptions(
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
  final int _suggestCount = 5;

  User({this.id, this.uuid, this.name, this.email, this.prefs, this.pantry, this.favorites, this.shopping, this.previousSearches, this.searchFilter, this.webViewFavorites});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
    prefs = json['prefs'] != null ? new Prefs.fromJson(json['prefs']) : null;
    pantry = json['pantry'] != null ? new Pantry.fromJson(json['pantry']) : null;
    //favorites = List<Favorites>.from(json['favorites'].map((x) => Favorites.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.prefs != null) {
      data['prefs'] = this.prefs.toJson();
    }
    if (this.pantry != null) {
      data['pantry'] = this.pantry.toJson();
    }
    if (this.favorites != null) {
      data['favorites'] = List<dynamic>.from(favorites.map((x) => x.toJson()));
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'uuid': uuid,
      'name' : name,
      'email' : email,
      'prefs' : prefs.toJson(),
      'pantry' : pantry.toJson(),
    };
  }

  initUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> database = openDatabase(join(await getDatabasesPath(), 'users.db'),);
    Database db = await database;
    await db.insert(
      'users',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addPantryItem(List<String> input, String pantryCat) async {
    final Future<Database> database = openDatabase(join(await getDatabasesPath(), 'users.db'),);
    final Database db = await database;
    print(input.length);
    for (int i = 0; i < input.length; i++) {
      switch (pantryCat) {
        case "bakedGoods" : {
          if (!this.pantry.bakedGoods.contains(input[i])) {
            this.pantry.bakedGoods.add(input[i]);
            this.pantry.bakedGoods.sort();
          }
        } break;
        case "specialty" : {
          if (!this.pantry.specialty.contains(input[i])) {
            this.pantry.specialty.add(input[i]);
            this.pantry.specialty.sort();
          }
        } break;
        case "toppings" : {
          if (!this.pantry.toppings.contains(input[i])) {
            this.pantry.toppings.add(input[i]);
            this.pantry.toppings.sort();
          }
        } break;
        case "cannedGoods" : {
          if (!this.pantry.cannedGoods.contains(input[i])) {
            this.pantry.cannedGoods.add(input[i]);
            this.pantry.cannedGoods.sort();
          }
        } break;
        case "grainsNuts" : {
          if (!this.pantry.grainsNuts.contains(input[i])) {
            this.pantry.grainsNuts.add(input[i]);
            this.pantry.grainsNuts.sort();
          }
        } break;
        case "refrigerator" : {
          if (!this.pantry.refrigerator.contains(input[i])) {
            this.pantry.refrigerator.add(input[i]);
            this.pantry.refrigerator.sort();
          }
        } break;
        case "freezer" : {
          if (!this.pantry.freezer.contains(input[i])) {
            this.pantry.freezer.add(input[i]);
            this.pantry.freezer.sort();
          }
        } break;
        case "snacks" : {
          if (!this.pantry.snacks.contains(input[i])) {
            this.pantry.snacks.add(input[i]);
            this.pantry.snacks.sort();
          }
        } break;
        case "produce" : {
          if (!(this.pantry.produce.contains(input[i]))) {
            this.pantry.produce.add(input[i]);
            print(this.pantry.produce);
            this.pantry.produce.sort();
          }
        } break;
        case "misc" : {
          if (!this.pantry.misc.contains(input[i])) {
            this.pantry.misc.add(input[i]);
            this.pantry.misc.sort();
          }
        } break;
        case "dairy": {
          if (!this.pantry.dairy.contains(input[i])) {
            this.pantry.dairy.add(input[i]);
            this.pantry.dairy.sort();
          }
        } break;
        case "meats" : {
          if (!this.pantry.meats.contains(input[i])) {
            this.pantry.meats.add(input[i]);
            this.pantry.meats.sort();
          }
        } break;
      }
    }
    await db.update(
      'users',
      this.toMap(),
      where: "id = ?",
      whereArgs: [this.id],
    );
  }

  Future<Recipe> getDefaultRecipe() async {
    String jsonText = await rootBundle.loadString("assets/exampleRecipe.json");
    Map<String,dynamic> data = json.decode(jsonText);
    Response decoy = new Response(data: data);
    Recipe res = Recipe.fromJson(decoy.data);
    print("DEFAULT RECIPE: " + res.toString());
    return res;
  }

  Future<String> getJson() {
    return rootBundle.loadString('exampleRecipe.json');
  }

  Future<Recipe> getRecipeByID_2(int id) async {
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    // Recipe response = new Recipe();
    Recipe response;
    RecipeElement tempResponse = new RecipeElement();
    print("Inside getRecipeByID function");
    // WinePairing winePairing = new WinePairing();
    // Recipe response = new Recipe();
    // int id = 541613;
    // spoonResp = await spoon.get("/recipes/716429/information?includeNutrition=false");
    spoonResp = await spoon.get("/recipes/$id/information?includeNutrition=false");
    if (spoonResp.statusCode == 200) {
    //   // print(spoonResp.data.length); //prints 36
    //   // print(spoonResp.data['winePairing'].length);
    //   print(spoonResp.data['winePairing']['pairedWines'].toString()); //prints the paired wines
    //   print(spoonResp.data['winePairing']['pairingText'].toString()); //prints the pairing Text
    //   print(spoonResp.data['winePairing']['productMatches'].toString()); //prints the product matches
    //   if(spoonResp.data['winePairing']['pairedWines'].length > 0){
    //     print("[1] - ${spoonResp.data['winePairing']['pairedWines'].toString()}");
    //     // winePairing.pairedWines = WinePairing.fromJson(spoonResp.data["winePairing"]) as List<String>;
    //     print(winePairing.pairedWines.toString());
    //   }
    //   if(spoonResp.data['winePairing']['pairingText'] != null){
    //     print("[2] - ${spoonResp.data['winePairing']['pairingText'].toString()}");
    //     // winePairing.pairingText = WinePairing.fromJson(spoonResp.data["pairingText"]) as String;
    //     print(winePairing.pairingText.toString());
    //   }
    //   if(spoonResp.data['winePairing']['productMatches'].length > 0){
    //     print("[3] - ${spoonResp.data['winePairing']['productMatches'].toString()}");
    //     //winePairing.productMatches = WinePairing.fromJson(spoonResp.data["productMatches"]) as List<ProductMatches>;
    //     print(winePairing.productMatches.toString());
    //   }

      print("Inside spoonResp 200, in getRecipeByID");
      tempResponse = RecipeElement.fromJson(spoonResp.data);
      print("tempResponse Recipe title is: ${tempResponse.title}");
      print("tempResponse Recipe id is: ${tempResponse.id}");

      // response.recipes.add(tempResponse);
      // response.recipes[0] = tempResponse;
      List<RecipeElement> responses = List.empty(growable: true);
      responses.add(tempResponse);
      response = new Recipe(recipes: responses);

      print("Recipe title is: ${response.recipes[0].title}");
      print("Recipe id is: ${response.recipes[0].id}");
    }
    //response.recipes[0].winePairing = winePairing;
    return response;
  }

  Future<RecipeElement> getRecipeByID(int id) async {
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    RecipeElement response = new RecipeElement();
    spoonResp = await spoon.get("/recipes/$id/information?includeNutrition=false");
    if (spoonResp.statusCode == 200) {

      print("Inside spoonResp 200, in getRecipeByID");
      response = RecipeElement.fromJson(spoonResp.data);

      print("Recipe title is: ${response.title}");
      print("Recipe id is: ${response.id}");
      // print("Recipe id is: ${response.winePairing.pairingText}");
    }
    //response.recipes[0].winePairing = winePairing;
    return response;
  }

  Future<Recipe> getHomeSuggestion() async {
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    Recipe response = new Recipe();
    String wholePantry = "";
    if (wholePantry == "") {
      print(wholePantry);
      // if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
      //   spoonResp = await spoon.get(
      //       "/recipes/random?number=" + _suggestCount.toString(),
      //       queryParameters: {"tags": "dinner"});
      //   print("It's dinnertime");
      // }
      // else if (time.hour > 11 && time.hour <= 17) {
      //   spoonResp = await spoon.get(
      //       "/recipes/random?number=" + _suggestCount.toString(),
      //       queryParameters: {"tags": "lunch"});
      //   print("It's lunchtime");
      // }
      // else {
      //   spoonResp = await spoon.get(
      //       "/recipes/random?number=" + _suggestCount.toString(),
      //       queryParameters: {"tags": "breakfast"});
      //   print("It's breakfasttime");
      // }

      //get recipes based on dinner

      // spoonResp = await spoon.get("/recipes/random?number=" + _suggestCount.toString(),queryParameters: {"tags": "dinner, main course"});
      spoonResp = await spoon.get("/recipes/random?number=" + _suggestCount.toString()+"&tags=dinner,maincourse");
      // spoonResp = await spoon.get("/recipes/random?number=" + _suggestCount.toString()+"&tags=dinner");

      if (spoonResp.statusCode == 200) {
        print("in the status code 200 if statement");
        // print("spoonresponse data ${spoonResp.data['recipes']['winePairing']['pairedWines'].toString()}");
        // testWinePairing(spoonResp.data);
        // if(spoonResp.data['winePairing']['pairedWines'].length > 0)
        //   print(spoonResp.data['winePairing']['pairedWines'].toString()); //prints the paired wines
        // if(spoonResp.data['winePairing']['pairingText'] != null)
        //   print(spoonResp.data['winePairing']['pairingText'].toString()); //prints the pairing Text
        // if(spoonResp.data['winePairing']['productMatches'].length > 0)
        //   print(spoonResp.data['winePairing']['productMatches'].toString()); //prints the product matches
        response = Recipe.fromJson(spoonResp.data);
        // print("After parsing json: ${response.recipes[0].winePairing.pairingText.toString()}");
        print("spoonresp.data.length = ${spoonResp.data.length}");
      }
    }
    else {
      if (this.pantry.bakedGoods[0] != "") {
        for (int i = 0; i < this.pantry.bakedGoods.length; i++) {
          wholePantry += this.pantry.bakedGoods[i].toString().trim();
          if (i != this.pantry.bakedGoods.length) wholePantry += ",+";
        }}
      if (this.pantry.specialty[0] != "") {
        for (int i = 0; i < this.pantry.specialty.length; i++) {
          wholePantry += this.pantry.specialty[i].toString().trim();
          if (i != this.pantry.specialty.length) wholePantry += ",+";
        }}
      if (this.pantry.toppings[0] != "") {
        for (int i = 0; i < this.pantry.toppings.length; i++) {
          wholePantry += this.pantry.toppings[i].trim().toString();
          if (i != this.pantry.toppings.length) wholePantry += ",+";
        }}
      if (this.pantry.cannedGoods[0] != "") {
        for (int i = 0; i < this.pantry.cannedGoods.length; i++) {
          wholePantry += this.pantry.cannedGoods[i].toString();
          if (i != this.pantry.cannedGoods.length) wholePantry += ",+";
        }}
      if (this.pantry.grainsNuts[0] != "") {
        for (int i = 0; i < this.pantry.grainsNuts.length; i++) {
          wholePantry += this.pantry.grainsNuts[i].toString();
          if (i != this.pantry.grainsNuts.length) wholePantry += ",+";
        }}
      if (this.pantry.refrigerator[0] != "") {
        for (int i = 0; i < this.pantry.refrigerator.length; i++) {
          wholePantry += this.pantry.refrigerator[i].toString();
          if (i != this.pantry.refrigerator.length) wholePantry += ",+";
        }}
      if (this.pantry.freezer[0] != "") {
        for (int i = 0; i < this.pantry.freezer.length; i++) {
          wholePantry += this.pantry.freezer[i].toString();
          if (i != this.pantry.freezer.length) wholePantry += ",+";
        }}
      if (this.pantry.snacks[0] != "") {
        for (int i = 0; i < this.pantry.snacks.length; i++) {
          wholePantry += this.pantry.snacks[i].toString();
          if (i != this.pantry.snacks.length) wholePantry += ",+";
        }}
      if (this.pantry.produce[0] != "") {
        for (int i = 0; i < this.pantry.produce.length; i++) {
          wholePantry += this.pantry.produce[i].toString();
          if (i != this.pantry.produce.length) wholePantry += ",+";
        }}
      if (this.pantry.misc[0] != "") {
        for (int i = 0; i < this.pantry.misc.length; i++) {
          wholePantry += this.pantry.misc[i].toString();
          if (i != this.pantry.misc.length) wholePantry += ",+";
        }}
      if (this.pantry.dairy[0] != "") {
        for (int i = 0; i < this.pantry.dairy.length; i++) {
          wholePantry += this.pantry.dairy[i].toString();
          if (i != this.pantry.dairy.length) wholePantry += ",+";
        }}
      if (this.pantry.meats[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ignorePantry=true&ingredients=" + wholePantry + "&number=" + _suggestCount.toString(),
            queryParameters: {"tags": "dinner"});
      }
      else if (time.hour > 11 && time.hour <= 17) {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ignorePantry=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString(),
            queryParameters: {"tags": "lunch"});
      }
      else {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ignorePantry=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString(),
            queryParameters: {"tags": "breakfast"});
      }
      if (spoonResp.statusCode == 200) {

        for (int i = 0; i < spoonResp.data.length; i++) {
          response.recipes[i] = RecipeElement.fromJson(spoonResp.data.elementAt(i));
        }
      }
    }
    return response;
  }

  Future<Recipe> getRandomRecipe() async {
    Map<String, dynamic> headers = {
      "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "x-rapidapi-key": "0b83fa3f6emshf35335a21f7c826p178545jsnf157389bedd5",
      "useQueryString": true,
    };

    Uri returnUri = Uri.https('rapidapi.p.rapidapi.com', '/recipes/random?number=1');
    final response = await http.get(returnUri, headers: headers);
    // final response = await http.get(
    //   'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
    //   headers: {HttpHeaders.authorizationHeader: "0b83fa3f6emshf35335a21f7c826p178545jsnf157389bedd5"},
    // );
    final responseJson = jsonDecode(response.body);
    print(responseJson['recipe']['id']);

    return Recipe.fromJson(responseJson);
  }

  int getSuggestCount(){
    return _suggestCount;
  }

  void testWinePairing(data) {
    print("\n\n");
    print("inside testWinePairing method");

    var decodedJson = json.decode(data);
    print("${decodedJson.runtimeType} : $decodedJson");

    // if(data['vegetarian'] != null) {
    //   print("vegetarian data: ${data["vegetarian"].toString()}");
    // }else{
    //   print("vegetarian is null");
    // }
    //
    // if(data['vegan'] != null) {
    //   print("vegan data: " + data["vegan"].toString());
    // }else{
    //   print("vegan is null");
    // }
    //
    // if(data['glutenFree'] != null) {
    //   print("glutenFree data: " + data["glutenFree"].toString());
    // }else{
    //   print("glutenFree is null");
    // }
    //
    // if(data['dairyFree'] != null) {
    //   print("dairyFree data: " + data["dairyFree"].toString());
    // }else{
    //   print("dairyFree is null");
    // }
    //
    // if(data['veryHealthy'] != null) {
    //   print("veryHealthy data: " + data["veryHealthy"].toString());
    // }else{
    //   print("veryHealthy is null");
    // }
    //
    // if(data['cheap'] != null) {
    //   print("cheap data: " + data["cheap"].toString());
    // }else{
    //   print("cheap is null");
    // }
    //
    // if(data['veryPopular'] != null) {
    //   print("veryPopular data: " + data["veryPopular"].toString());
    // }else{
    //   print("veryPopular is null");
    // }
    //
    // if(data['sustainable'] != null) {
    //   print("sustainable data: " + data["sustainable"].toString());
    // }else{
    //   print("sustainable is null");
    // }
    //
    // if(data['weightWatcherSmartPoints'] != null) {
    //   print("weightWatcherSmartPoints data: " + data["weightWatcherSmartPoints"].toString());
    // }else{
    //   print("weightWatcherSmartPoints is null");
    // }
    //
    // if(data['gaps'] != null) {
    //   print("gaps data: " + data["gaps"].toString());
    // }else{
    //   print("gaps is null");
    // }
    //
    // if(data['lowFodmap'] != null) {
    //   print("lowFodmap data: " + data["lowFodmap"].toString());
    // }else{
    //   print("lowFodmap is null");
    // }
    //
    // if(data['aggregateLikes'] != null) {
    //   print("aggregateLikes data: " + data["aggregateLikes"].toString());
    // }else{
    //   print("aggregateLikes is null");
    // }
    //
    // if(data['spoonacularScore'] != null) {
    //   print("spoonacularScore data: " + data["spoonacularScore"].toString());
    // }else{
    //   print("spoonacularScore is null");
    // }
    //
    // if(data['healthScore'] != null) {
    //   print("healthScore data: " + data["healthScore"].toString());
    // }else{
    //   print("healthScore is null");
    // }
    //
    // if(data['creditsText'] != null) {
    //   print("creditsText data: " + data["creditsText"].toString());
    // }else{
    //   print("creditsText is null");
    // }
    //
    // if(data['license'] != null) {
    //   print("license data: " + data["license"].toString());
    // }else{
    //   print("license is null");
    // }
    //
    // if(data['sourceName'] != null) {
    //   print("sourceName data: " + data["sourceName"].toString());
    // }else{
    //   print("sourceName is null");
    // }
    //
    // if(data['pricePerServing'] != null) {
    //   print("pricePerServing data: " + data["pricePerServing"].toString());
    // }else{
    //   print("pricePerServing is null");
    // }
    //
    // if(data['extendedIngredients'] != null) {
    //   print("extendedIngredients data: " + data["extendedIngredients"].toString());
    // }else{
    //   print("extendedIngredients is null");
    // }
    //
    // if(data['id'] != null) {
    //   print("id data: " + data["id"].toString());
    // }else{
    //   print("id is null");
    // }
    //
    // if(data['title'] != null) {
    //   print("title data: " + data["title"].toString());
    // }else{
    //   print("title is null");
    // }


    print("\n\n");
  }
}
