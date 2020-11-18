import 'pantry.list.dart';
import 'recipe.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tastez/favorites.dart';
import 'prefs.dart';

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
  final int _suggestCount = 10;

  User(this.id, this.uuid, this.name, this.email, this.prefs, this.pantry, this.favorites);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
    prefs = json['prefs'] != null ? new Prefs.fromJson(json['prefs']) : null;
    pantry = json['pantry'] != null ? new Pantry.fromJson(json['pantry']) : null;
    favorites = List<Favorites>.from(json['favorites'].map((x) => Favorites.fromJson(x)));
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
      'favorites' : favorites,
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

  Future<Recipe> getHomeSuggestion() async {
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    Recipe response = new Recipe();
    String wholePantry = "";
    if (wholePantry == "") {
      print(wholePantry);
      if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + _suggestCount.toString(),
            queryParameters: {"tags": "dinner"});
      }
      else if (time.hour > 11 && time.hour <= 17) {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + _suggestCount.toString(),
            queryParameters: {"tags": "lunch"});
      }
      else {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + _suggestCount.toString(),
            queryParameters: {"tags": "breakfast"});
      }
      if (spoonResp.statusCode == 200) { response = Recipe.fromJson(spoonResp.data);}
    }
    else {
      if (this.pantry.bakedGoods[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.specialty[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.toppings[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.cannedGoods[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.grainsNuts[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.refrigerator[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.freezer[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.snacks[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.produce[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
        }}
      if (this.pantry.misc[0] != "") {
        for (int i = 0; i < this.pantry.meats.length; i++) {
          wholePantry += this.pantry.meats[i].toString();
          if (i != this.pantry.meats.length) wholePantry += ",+";
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
  }}