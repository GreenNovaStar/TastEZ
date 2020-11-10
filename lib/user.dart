import 'pantry.list.dart';
import 'prefs.dart';
import 'recipe.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'favorites.dart';

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
  Favorites favorites;

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
    favorites = json['favorites'] != null ? new Favorites.fromJson(json['favorites']) : null;
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
      data['favorites'] = this.favorites.toJson();
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
      'favorites' : favorites.toJson(),
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

  Future<void> savePref(List<String> data, String pantryCat) async {
    final Future<Database> database = openDatabase(join(await getDatabasesPath(), 'users.db'),);
    final Database db = await database;

    switch (pantryCat) {
      case "dairy": {
        for (int i = 0; i < this.pantry.dairy.length; i++) {
          if (i >= data.length) this.pantry.dairy[i] = "";
          else this.pantry.dairy[i] = data[i];
        }
      }
      break;
      /*case "flour": {
        for (int i = 0; i < this.pantry.flour.length; i++) {
          if (i >= data.length) this.pantry.flour[i] = "";
          else this.pantry.flour[i] = data[i];
        }
      }
      break;*/
      case "fruit": {
        for (int i = 0; i < this.pantry.fruit.length; i++) {
          if (i >= data.length) this.pantry.fruit[i] = "";
          else this.pantry.fruit[i] = data[i];
        }
      }
      break;
      case "meat": {
        for (int i = 0; i < this.pantry.meat.length; i++) {
          if (i >= data.length) this.pantry.meat[i] = "";
          else this.pantry.meat[i] = data[i];
        }
      }
      break;
      case "herbs": {
        for (int i = 0; i < this.pantry.herbs.length; i++) {
          if (i >= data.length) this.pantry.herbs[i] = "";
          else this.pantry.herbs[i] = data[i];
        }
      }
      break;
      case "nuts": {
        for (int i = 0; i < this.pantry.nuts.length; i++) {
          if (i >= data.length) this.pantry.nuts[i] = "";
          else this.pantry.nuts[i] = data[i];
        }
      }
      break;
      case "seafood": {
        for (int i = 0; i < this.pantry.seafood.length; i++) {
          if (i >= data.length) this.pantry.seafood[i] = "";
          else this.pantry.seafood[i] = data[i];
        }
      }
      break;
      case "veget": {
        for (int i = 0; i < this.pantry.veget.length; i++) {
          if (i >= data.length) this.pantry.veget[i] = "";
          else this.pantry.veget[i] = data[i];
        }
      }
      break;
    }
    await db.update(
      'users',
      this.toMap(),
      where: "id = ?",
      whereArgs: [this.id],
    );
    final List<Map<String,dynamic>> maps = await db.query('users');
    print(data);
    print(maps);
  }

  void addPantryItem(String input, String pantryCat) {
    switch(pantryCat) {
      case "dairy": {
        if (!this.prefs.dairyCustom.contains(input) && !this.pantry.dairy.contains(input)) {
          this.prefs.dairyCustom.add(input);
          print(this.prefs.dairyCustom);
          this.savePref(this.pantry.dairy + this.prefs.dairyCustom, pantryCat);
        }
      }
      break;
      /*case "flour": {
        if (!this.prefs.flourCustom.contains(input) && !this.pantry.flour.contains(input)) {
          this.prefs.flourCustom.add(input);
          this.savePref(this.pantry.flour + this.prefs.flourCustom, pantryCat);
        }}
      break;*/
      case "fruit": {
        if (!this.prefs.fruitCustom.contains(input) && !this.pantry.fruit.contains(input)) {
          this.prefs.fruitCustom.add(input);
          this.savePref(this.pantry.fruit + this.prefs.fruitCustom, pantryCat);
        }}
      break;
      case "meat": {
        if (!this.prefs.meatCustom.contains(input) && !this.pantry.meat.contains(input)) {
          this.prefs.meatCustom.add(input);
          this.savePref(this.pantry.meat + this.prefs.meatCustom, pantryCat);
        }}
      break;
      case "herbs": {
        if (!this.prefs.herbsCustom.contains(input) && !this.pantry.herbs.contains(input)) {
          this.prefs.herbsCustom.add(input);
          this.savePref(this.pantry.herbs + this.prefs.herbsCustom, pantryCat);
        }}
      break;
      case "nuts": {
        if (!this.prefs.nutsCustom.contains(input) && !this.pantry.nuts.contains(input)) {
          this.prefs.nutsCustom.add(input);
          this.savePref(this.pantry.nuts + this.prefs.nutsCustom, pantryCat);
        }}
      break;
      case "seafood": {
        if (!this.prefs.seafoodCustom.contains(input) && !this.pantry.seafood.contains(input)) {
          this.prefs.seafoodCustom.add(input);
          this.savePref(this.pantry.seafood + this.prefs.seafoodCustom, pantryCat);
        }}
      break;
      case "veget": {
        if (!this.prefs.vegetCustom.contains(input) && !this.pantry.veget.contains(input)) {
          this.prefs.vegetCustom.add(input);
          this.savePref(this.pantry.veget + this.prefs.vegetCustom, pantryCat);
        }}
      break;
    }
  }

  Future<Recipe> getHomeSuggestion() async {
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    Recipe response = new Recipe();
    /*if (this.id == 0) {
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
      if (spoonResp.statusCode == 200) {
          response = Recipe.fromJson(spoonResp.data);}
    }
    else {*/
      String wholePantry = "";
      print(this.pantry.dairy[0]);
      if (this.pantry.dairy[0] != "") {
        for (int i = 0; i < this.pantry.dairy.length; i++) {
          wholePantry += this.pantry.dairy[i];
          if (i != this.pantry.dairy.length) wholePantry += ",+";
        }}
      /*if (this.pantry.flour[0] != "") {
        for (int i = 0; i < this.pantry.flour.length; i++) {
          wholePantry += this.pantry.flour[i];
          if (this.pantry.flour[i+1] != null) wholePantry += ",+";
        }}*/
      if (this.pantry.fruit[0] != "") {
        for(int i = 0; i < this.pantry.fruit.length; i++) {
          wholePantry += this.pantry.fruit[i];
          if (i != this.pantry.fruit.length) wholePantry += ",+";
        }}
      if (this.pantry.meat[0] != "") {
        for(int i = 0; i < this.pantry.meat.length; i++) {
          wholePantry += this.pantry.meat[i];
          if (this.pantry.meat[i+1] != null) wholePantry += ",+";
        }}
      if (this.pantry.herbs[0] != "") {
        for (int i = 0; i < this.pantry.herbs.length; i++) {
          wholePantry += this.pantry.herbs[i];
          if (this.pantry.herbs[i+1] != null) wholePantry += ",+";
        }}
      if (this.pantry.nuts[0] != "") {
        for (int i = 0; i < this.pantry.nuts.length; i++) {
          wholePantry += this.pantry.nuts[i];
          if (this.pantry.nuts[i+1] != null) wholePantry += ",+";
        }}
      if (this.pantry.seafood[0] != "") {
        for (int i = 0; i < this.pantry.seafood.length; i++) {
          wholePantry += this.pantry.seafood[i];
          if (this.pantry.seafood[i+1] != null) wholePantry += ",+";
        }}
      if (this.pantry.veget[0] != "") {
        for (int i = 0; i < this.pantry.veget.length; i++) {
          wholePantry += this.pantry.veget[i];
          if (this.pantry.veget[i+1] != null) wholePantry += ",+";
        }}

      //custom pantry ingredients
      if (this.prefs.dairyCustom[0] != "") {
        for (int i = 0; i < this.prefs.dairyCustom.length; i++) {
          wholePantry += this.prefs.dairyCustom[i];
          if (this.prefs.dairyCustom[i+1] != null) wholePantry += ",+";
        }}
      /*if (this.prefs.flourCustom[0] != "") {
        for (int i = 0; i < this.prefs.flourCustom.length; i++) {
          wholePantry += this.prefs.flourCustom[i];
          if (this.prefs.flourCustom[i+1] != null) wholePantry += ",+";
        }}*/
      if (this.prefs.fruitCustom[0] != "") {
        for(int i = 0; i < this.prefs.fruitCustom.length; i++) {
          wholePantry += this.prefs.fruitCustom[i];
          if (this.prefs.fruitCustom[i+1] != null) wholePantry += ",+";
        }}
      if (this.prefs.meatCustom[0] != "") {
        for(int i = 0; i < this.prefs.meatCustom.length; i++) {
          wholePantry += this.prefs.meatCustom[i];
          if (this.prefs.meatCustom[i+1] != null) wholePantry += ",+";
        }}
      if (this.prefs.herbsCustom[0] != "") {
        for (int i = 0; i < this.prefs.herbsCustom.length; i++) {
          wholePantry += this.prefs.herbsCustom[i];
          if (this.prefs.herbsCustom[i+1] != null) wholePantry += ",+";
        }}
      if (this.prefs.nutsCustom[0] != "") {
        for (int i = 0; i < this.prefs.nutsCustom.length; i++) {
          wholePantry += this.prefs.nutsCustom[i];
          if (this.prefs.nutsCustom[i+1] != null) wholePantry += ",+";
        }}
      if (this.prefs.seafoodCustom[0] != "") {
        for (int i = 0; i < this.prefs.seafoodCustom.length; i++) {
          wholePantry += this.prefs.seafoodCustom[i];
          if (this.prefs.seafoodCustom[i+1] != null) wholePantry += ",+";
        }}
      if (this.prefs.vegetCustom[0] != "") {
        for (int i = 0; i < this.prefs.vegetCustom.length; i++) {
          wholePantry += this.prefs.vegetCustom[i];
          if (this.prefs.vegetCustom[i+1] != null) wholePantry += ",+";
        }}

      print(wholePantry);
      if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number=" + _suggestCount.toString(),
            queryParameters: {"tags": "dinner"});
      }
      else if (time.hour > 11 && time.hour <= 17) {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString(),
            queryParameters: {"tags": "lunch"});
      }
      else {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString(),
            queryParameters: {"tags": "breakfast"});
      }
      print("/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString());
    //}
    if (spoonResp.statusCode == 200) {response = Recipe.fromJson(spoonResp.data);}
    return response;
  }}