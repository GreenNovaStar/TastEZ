import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tastez/pantry.list.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:tastez/Middleware/API Parsing/Recipe.dart';
import 'package:tastez/Middleware/API Parsing/RecipeElement.dart';
import 'package:tastez/Middleware/API Parsing/WinePairing/WinePairing.dart';
import 'package:tastez/Middleware/Pages/Favorites.dart';
import 'package:tastez/Middleware/Pages/ShoppingListElement.dart';
import 'package:tastez/prefs.dart';

const String defaultRecipeData = '''
{
  "recipes": [{
    "id": 716429,
    "title": "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
    "image": "https://spoonacular.com/recipeImages/716429-556x370.jpg",
    "imageType": "jpg",
    "servings": 2,
    "readyInMinutes": 45,
    "license": "CC BY-SA 3.0",
    "sourceName": "Full Belly Sisters",
    "sourceUrl": "http://fullbellysisters.blogspot.com/2012/06/pasta-with-garlic-scallions-cauliflower.html",
    "spoonacularSourceUrl": "https://spoonacular.com/pasta-with-garlic-scallions-cauliflower-breadcrumbs-716429",
    "aggregateLikes": 209,
    "healthScore": 19.0,
    "spoonacularScore": 83.0,
    "pricePerServing": 163.15,
    "analyzedInstructions": [],
    "cheap": false,
    "creditsText": "Full Belly Sisters",
    "cuisines": [],
    "dairyFree": false,
    "diets": [],
    "gaps": "no",
    "glutenFree": false,
    "instructions": "",
    "ketogenic": false,
    "lowFodmap": false,
    "occasions": [],
    "sustainable": false,
    "vegan": false,
    "vegetarian": false,
    "veryHealthy": false,
    "veryPopular": false,
    "whole30": false,
    "weightWatcherSmartPoints": 17,
    "dishTypes": [
      "lunch",
      "main course",
      "main dish",
      "dinner"
    ],
    "extendedIngredients": [{
      "aisle": "Milk, Eggs, Other Dairy",
      "amount": 1.0,
      "consitency": "solid",
      "id": 1001,
      "image": "butter-sliced.jpg",
      "measures": {
        "metric": {
          "amount": 1.0,
          "unitLong": "Tbsp",
          "unitShort": "Tbsp"
        },
        "us": {
          "amount": 1.0,
          "unitLong": "Tbsp",
          "unitShort": "Tbsp"
        }
      },
      "meta": [],
      "name": "butter",
      "original": "1 tbsp butter",
      "originalName": "butter",
      "unit": "tbsp"
    },
      {
        "aisle": "Produce",
        "amount": 2.0,
        "consitency": "solid",
        "id": 10011135,
        "image": "cauliflower.jpg",
        "measures": {
          "metric": {
            "amount": 473.176,
            "unitLong": "milliliters",
            "unitShort": "ml"
          },
          "us": {
            "amount": 2.0,
            "unitLong": "cups",
            "unitShort": "cups"
          }
        },
        "meta": [
          "frozen",
          "thawed",
          "cut into bite-sized pieces"
        ],
        "name": "cauliflower florets",
        "original": "about 2 cups frozen cauliflower florets, thawed, cut into bite-sized pieces",
        "originalName": "about frozen cauliflower florets, thawed, cut into bite-sized pieces",
        "unit": "cups"
      },
      {
        "aisle": "Cheese",
        "amount": 2.0,
        "consitency": "solid",
        "id": 1041009,
        "image": "cheddar-cheese.png",
        "measures": {
          "metric": {
            "amount": 2.0,
            "unitLong": "Tbsps",
            "unitShort": "Tbsps"
          },
          "us": {
            "amount": 2.0,
            "unitLong": "Tbsps",
            "unitShort": "Tbsps"
          }
        },
        "meta": [
          "grated",
          "(I used romano)"
        ],
        "name": "cheese",
        "original": "2 tbsp grated cheese (I used romano)",
        "originalName": "grated cheese (I used romano)",
        "unit": "tbsp"
      },
      {
        "aisle": "Oil, Vinegar, Salad Dressing",
        "amount": 1.0,
        "consitency": "liquid",
        "id": 1034053,
        "image": "olive-oil.jpg",
        "measures": {
          "metric": {
            "amount": 1.0,
            "unitLong": "Tbsp",
            "unitShort": "Tbsp"
          },
          "us": {
            "amount": 1.0,
            "unitLong": "Tbsp",
            "unitShort": "Tbsp"
          }
        },
        "meta": [],
        "name": "extra virgin olive oil",
        "original": "1-2 tbsp extra virgin olive oil",
        "originalName": "extra virgin olive oil",
        "unit": "tbsp"
      },
      {
        "aisle": "Produce",
        "amount": 5.0,
        "consitency": "solid",
        "id": 11215,
        "image": "garlic.jpg",
        "measures": {
          "metric": {
            "amount": 5.0,
            "unitLong": "cloves",
            "unitShort": "cloves"
          },
          "us": {
            "amount": 5.0,
            "unitLong": "cloves",
            "unitShort": "cloves"
          }
        },
        "meta": [],
        "name": "garlic",
        "original": "5-6 cloves garlic",
        "originalName": "garlic",
        "unit": "cloves"
      },
      {
        "aisle": "Pasta and Rice",
        "amount": 6.0,
        "consitency": "solid",
        "id": 20420,
        "image": "fusilli.jpg",
        "measures": {
          "metric": {
            "amount": 170.097,
            "unitLong": "grams",
            "unitShort": "g"
          },
          "us": {
            "amount": 6.0,
            "unitLong": "ounces",
            "unitShort": "oz"
          }
        },
        "meta": [
          "(I used linguine)"
        ],
        "name": "pasta",
        "original": "6-8 ounces pasta (I used linguine)",
        "originalName": "pasta (I used linguine)",
        "unit": "ounces"
      },
      {
        "aisle": "Spices and Seasonings",
        "amount": 2.0,
        "consitency": "solid",
        "id": 1032009,
        "image": "red-pepper-flakes.jpg",
        "measures": {
          "metric": {
            "amount": 2.0,
            "unitLong": "pinches",
            "unitShort": "pinches"
          },
          "us": {
            "amount": 2.0,
            "unitLong": "pinches",
            "unitShort": "pinches"
          }
        },
        "meta": [
          "red"
        ],
        "name": "red pepper flakes",
        "original": "couple of pinches red pepper flakes, optional",
        "originalName": "couple of red pepper flakes, optional",
        "unit": "pinches"
      },
      {
        "aisle": "Spices and Seasonings",
        "amount": 2.0,
        "consitency": "solid",
        "id": 1102047,
        "image": "salt-and-pepper.jpg",
        "measures": {
          "metric": {
            "amount": 2.0,
            "unitLong": "servings",
            "unitShort": "servings"
          },
          "us": {
            "amount": 2.0,
            "unitLong": "servings",
            "unitShort": "servings"
          }
        },
        "meta": [
          "to taste"
        ],
        "name": "salt and pepper",
        "original": "salt and pepper, to taste",
        "originalName": "salt and pepper, to taste",
        "unit": "servings"
      },
      {
        "aisle": "Produce",
        "amount": 3.0,
        "consitency": "solid",
        "id": 11291,
        "image": "spring-onions.jpg",
        "measures": {
          "metric": {
            "amount": 3.0,
            "unitLong": "",
            "unitShort": ""
          },
          "us": {
            "amount": 3.0,
            "unitLong": "",
            "unitShort": ""
          }
        },
        "meta": [
          "white",
          "green",
          "separated",
          "chopped"
        ],
        "name": "scallions",
        "original": "3 scallions, chopped, white and green parts separated",
        "originalName": "scallions, chopped, white and green parts separated",
        "unit": ""
      },
      {
        "aisle": "Alcoholic Beverages",
        "amount": 2.0,
        "consitency": "liquid",
        "id": 14106,
        "image": "white-wine.jpg",
        "measures": {
          "metric": {
            "amount": 2.0,
            "unitLong": "Tbsps",
            "unitShort": "Tbsps"
          },
          "us": {
            "amount": 2.0,
            "unitLong": "Tbsps",
            "unitShort": "Tbsps"
          }
        },
        "meta": [
          "white"
        ],
        "name": "white wine",
        "original": "2-3 tbsp white wine",
        "originalName": "white wine",
        "unit": "tbsp"
      },
      {
        "aisle": "Pasta and Rice",
        "amount": 0.25,
        "consitency": "solid",
        "id": 99025,
        "image": "breadcrumbs.jpg",
        "measures": {
          "metric": {
            "amount": 59.147,
            "unitLong": "milliliters",
            "unitShort": "ml"
          },
          "us": {
            "amount": 0.25,
            "unitLong": "cups",
            "unitShort": "cups"
          }
        },
        "meta": [
          "whole wheat",
          "(I used panko)"
        ],
        "name": "whole wheat bread crumbs",
        "original": "1/4 cup whole wheat bread crumbs (I used panko)",
        "originalName": "whole wheat bread crumbs (I used panko)",
        "unit": "cup"
      }
    ],
    "summary": "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs might be a good recipe to expand your main course repertoire. One portion of this dish contains approximately <b>19g of protein </b>,  <b>20g of fat </b>, and a total of  <b>584 calories </b>. For  <b>1.63 per serving </b>, this recipe  <b>covers 23% </b> of your daily requirements of vitamins and minerals. This recipe serves 2. It is brought to you by fullbellysisters.blogspot.com. 209 people were glad they tried this recipe. A mixture of scallions, salt and pepper, white wine, and a handful of other ingredients are all it takes to make this recipe so scrumptious. From preparation to the plate, this recipe takes approximately  <b>45 minutes </b>. All things considered, we decided this recipe  <b>deserves a spoonacular score of 83% </b>. This score is awesome. If you like this recipe, take a look at these similar recipes: <a href=\"https://spoonacular.com/recipes/cauliflower-gratin-with-garlic-breadcrumbs-318375\">Cauliflower Gratin with Garlic Breadcrumbs</a>, < href=\"https://spoonacular.com/recipes/pasta-with-cauliflower-sausage-breadcrumbs-30437\">Pasta With Cauliflower, Sausage, & Breadcrumbs</a>, and <a href=\"https://spoonacular.com/recipes/pasta-with-roasted-cauliflower-parsley-and-breadcrumbs-30738\">Pasta With Roasted Cauliflower, Parsley, And Breadcrumbs</a>.",
    "winePairing": {
      "pairedWines": [
        "chardonnay",
        "gruener veltliner",
        "sauvignon blanc"
      ],
      "pairingText": "Chardonnay, Gruener Veltliner, and Sauvignon Blanc are great choices for Pasta. Sauvignon Blanc and Gruner Veltliner both have herby notes that complement salads with enough acid to match tart vinaigrettes, while a Chardonnay can be a good pick for creamy salad dressings. The Buddha Kat Winery Chardonnay with a 4 out of 5 star rating seems like a good match. It costs about 25 dollars per bottle.",
      "productMatches": [{
        "id": 469199,
        "title": "Buddha Kat Winery Chardonnay",
        "description": "We barrel ferment our Chardonnay and age it in a mix of Oak and Stainless. Giving this light bodied wine modest oak character, a delicate floral aroma, and a warming finish.",
        "price": "25.0",
        "imageUrl": "https://spoonacular.com/productImages/469199-312x231.jpg",
        "averageRating": 0.8,
        "ratingCount": 1.0,
        "score": 0.55,
        "link": "https://www.amazon.com/2015-Buddha-Kat-Winery-Chardonnay/dp/B00OSAVVM4?tag=spoonacular-20"
      }]
    }
  }]
}
''';

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
  final int _suggestCount = 1;

  User({this.id, this.uuid, this.name, this.email, this.prefs, this.pantry, this.favorites, this.shopping, this.previousSearches});

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

      spoonResp = await spoon.get("/recipes/random?number=" + _suggestCount.toString(),queryParameters: {"tags": "dinner"});
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
