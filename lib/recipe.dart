// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'missing.ingredients.dart';
import 'user.dart';
import 'suggestions.dart';
import 'favorites.dart';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  List<RecipeElement> recipes;
  Recipe({this.recipes,});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    recipes: List<RecipeElement>.from(json["recipes"].map((x) => RecipeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
  };
}

class RecipeElement {
  RecipeElement({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
    this.preparationMinutes,
    this.cookingMinutes,
    this.calories,
  });

  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  int aggregateLikes;
  double spoonacularScore;
  double healthScore;
  String creditsText;
  String license;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredient> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  String instructions;
  List<AnalyzedInstruction> analyzedInstructions;
  dynamic originalId;
  String spoonacularSourceUrl;
  int preparationMinutes;
  int cookingMinutes;
  int calories;

  factory RecipeElement.fromJson(Map<String, dynamic> json) => RecipeElement(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    lowFodmap: json["lowFodmap"],
    aggregateLikes: json["aggregateLikes"],
    spoonacularScore: json["spoonacularScore"],
    healthScore: json["healthScore"],
    creditsText: json["creditsText"],
    license: json["license"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"] == null ? null : json["pricePerServing"].toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    cuisines: List<String>.from(json["cuisines"].map((x) => x)),
    dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    diets: List<String>.from(json["diets"].map((x) => x)),
    occasions: List<String>.from(json["occasions"].map((x) => x)),
    instructions: json["instructions"],
    analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
    preparationMinutes: json["preparationMinutes"] == null ? null : json["preparationMinutes"],
    cookingMinutes: json["cookingMinutes"] == null ? null : json["cookingMinutes"],
    calories: json["calories"] == null ? null : json["calories"],
  );

  Map<String, dynamic> toJson() => {
    "vegetarian": vegetarian,
    "vegan": vegan,
    "glutenFree": glutenFree,
    "dairyFree": dairyFree,
    "veryHealthy": veryHealthy,
    "cheap": cheap,
    "veryPopular": veryPopular,
    "sustainable": sustainable,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "gaps": gaps,
    "lowFodmap": lowFodmap,
    "aggregateLikes": aggregateLikes,
    "spoonacularScore": spoonacularScore,
    "healthScore": healthScore,
    "creditsText": creditsText,
    "license": license,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients": List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
    "image": image,
    "imageType": imageType,
    "summary": summary,
    "cuisines": List<String>.from(cuisines.map((x) => x)),
    "dishTypes": List<String>.from(dishTypes.map((x) => x)),
    "diets": List<String>.from(diets.map((x) => x)),
    "occasions": List<String>.from(occasions.map((x) => x)),
    "instructions": instructions,
    "analyzedInstructions": List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
    "originalId": originalId,
    "spoonacularSourceUrl": spoonacularSourceUrl,
    "preparationMinutes": preparationMinutes == null ? null : preparationMinutes,
    "cookingMinutes": cookingMinutes == null ? null : cookingMinutes,
    "calories": calories == null ? null : calories,
  };
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String name;
  List<Step> steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
    ingredients: List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
    length: json["length"] == null ? null : Length.fromJson(json["length"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
    "length": length == null ? null : length.toJson(),
  };
}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  int id;
  String name;
  String localizedName;
  String image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"],
    name: json["name"],
    localizedName: json["localizedName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "localizedName": localizedName,
    "image": image,
  };
}

class Length {
  Length({
    this.number,
    this.unit,
  });

  int number;
  String unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    number: json["number"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "unit": unit,
  };
}

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.original,
    this.originalString,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.metaInformation,
    this.measures,
  });

  int id;
  String aisle;
  String image;
  Consistency consistency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  List<String> metaInformation;
  Measures measures;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    id: json["id"],
    aisle: json["aisle"],
    image: json["image"],
    consistency: consistencyValues.map[json["consistency"]],
    name: json["name"],
    original: json["original"],
    originalString: json["originalString"],
    originalName: json["originalName"],
    amount: json["amount"].toDouble(),
    unit: json["unit"],
    meta: List<String>.from(json["meta"].map((x) => x)),
    metaInformation: List<String>.from(json["metaInformation"].map((x) => x)),
    measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consistency": consistencyValues.reverse[consistency],
    "name": name,
    "original": original,
    "originalString": originalString,
    "originalName": originalName,
    "amount": amount,
    "unit": unit,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "metaInformation": List<dynamic>.from(metaInformation.map((x) => x)),
    "measures": measures.toJson(),
  };
}

enum Consistency { SOLID, LIQUID }

final consistencyValues = EnumValues({
  "liquid": Consistency.LIQUID,
  "solid": Consistency.SOLID
});

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric us;
  Metric metric;

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
    "metric": metric.toJson(),
  };
}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  double amount;
  String unitShort;
  String unitLong;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"].toDouble(),
    unitShort: json["unitShort"],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitShort,
    "unitLong": unitLong,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

/*---------Attempt to create a Recipe UI----------*/

Widget recipePage(User currUser, RecipeElement recipe) {
  return RecipePage(user: currUser, recipe: recipe);
}

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key key,
    @required this.user,
    @required this.recipe,
  }):super(key:key);

  final User user;
  final RecipeElement recipe;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override

  Widget build(BuildContext context) {
    /*This is just a reference to my first format
    Widget infoSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text( // Cook Time Section
                  "Cook Time: ",
                  softWrap: true,
                ),
                Text(
                  "Calories: ",
                ),
                Text(
                  "Servings: ",
                ),
              ],
            ),
          ),
          Text(
            "probably like 20 min",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "2000 Calories",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "6",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ], // children
      ),
    );*/

    /*----------Recipe Information Widget----------*/
    Widget collapseInfo = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:10.0),
          Column(
            /*added list tiles for each individual Section (cook time,
                calories, servings, etc) Copy and paste a list Tile if you need
                more sections*/
            children: <Widget>[
              ListTile( // Cook Time Section
                title: Text(
                  "Cook Time: " + widget.recipe.readyInMinutes.toString() + " minutes",
                ),
              ),
              ListTile(
                title: (widget.recipe.calories != null) ? Text("Calories: " + widget.recipe.calories.toString()) : Text("Calories: Creator didn't define a calorie count"),
              ),
              ListTile(
                title: Text(
                  "Servings: " + widget.recipe.servings.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    /*----------Recipe Ingredients Widget----------*/
    Widget collapseIngredients = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:20.0),
          //Expansion Tile starts here
          ExpansionTile(
            //Title for the expansion Tile
            title: Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[

              /*added list tiles for each individual Section (cook time,
                calories, servings, etc) Copy and paste a list Tile if you need
                more sections*/
              //children: <Widget>[
              //usedIngredients(widget.recipe)
              missingIngredient(widget.user, widget.recipe),
              //],

            ],
          ),
        ],
      ),
    );

    /*----------Recipe Directions Widget----------*/
    Widget collapseDirections = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:10.0),
          //Expansion Tile starts here
          ExpansionTile(
            //Title for the expansion title
            title: Text(
              'Instructions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              //Recipe description displayed as normal text
              Text(
                widget.recipe.instructions.replaceAll(". ", "\n\n"), //added this to make it look neater
                style: TextStyle(
                  fontSize: 16.0,
                ),
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );

    /*----------Recipe Wine Pairing Widget----------*/
    Widget collapseWinePairing = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:10.0),
          //Expansion Tile starts here
          ExpansionTile(
            //Title for Expansion Tile
            title: Text(
              'Wine Pairing',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              /*Drop down information is in a list tile format with only text*/
              Text(widget.recipe.id.toString()),
            ],
          ),
        ],
      ),
    );

    /*----------Credit to Spoonacular----------*/
    /*Giving credit to Spoonacular for the recipes*/
    Widget creditSpoonacular = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                //TastEZ in a title format
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'TastEZ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                //Disclaimer that we don't own the recipes
                Text(
                  "Recipes provided by Spoonacular. \n"
                      "TastEZ does not claim ownership of Recipes. ",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ], // children
      ),
    );

    /*----------MaterialApp----------*/
    /*Builds the GUI, first displaying the page's Title then Image.
    At the bottom of the MaterialApp, each widget is listed in the order that
    will be displayed.*/

    print("${widget.recipe.image.toString()} check to see if image.tostring is null");
    return MaterialApp(
      title: 'Recipe Page',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //Top bar of the page (Title and color)
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.recipe.title),
          backgroundColor: Colors.orange,
        ),
        //Building Body of app page
        body: ListView(
          children: [
            (widget.recipe.image.toString() != "" && widget.recipe.image.toString() != "null") ?
            Image.network(widget.recipe.image.toString(),
              width: 600,
              height: 240,
              fit: BoxFit.cover,) :
            Card(child:
            ListTile(leading: SizedBox(height: 40, child: Image.asset('assets/TastEZ_logo.png')),
              title: Text("No Image Provided"),
            )),
            //Image of Recipe
            //Individual Widgets in order displayed
            collapseInfo,
            collapseIngredients,
            collapseDirections,
            collapseWinePairing,
            //infoSection,
            creditSpoonacular,
          ],
        ),

        //this is for when the user wants to favorite the recipe within the recipe page
        //currently it doesnt update the previous page.
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState((){
              int indexOfFavoritedItem = inFavoriteList(widget.user.favorites, widget.recipe.title.toString());
              if(indexOfFavoritedItem != -1){ //if item is in the favorite list,
                if(widget.user.favorites[indexOfFavoritedItem].isFavorite){ //check if the item is favorited
                  widget.user.favorites[indexOfFavoritedItem].isFavorite = false; //then unfavorite it
                  widget.user.favorites.removeAt(indexOfFavoritedItem); //then remove the item from the favorites array
                }else{
                  //nothing should really happen here
                  print('testing to see if something happens here');
                }
              }else{ //since item is not in the favorites list, add it to the favorites list
                widget.user.favorites.add(Favorites(recipe: widget.recipe, isFavorite: true)); //then set it to be favorited
              }
            });

          },
          child: (widget.user.favorites.length != null) ?
          ((inFavoriteList(widget.user.favorites, widget.recipe.title.toString())) != -1 ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded)) :
          Icon(Icons.favorite_border_rounded),
        ),

      ),
    );
  } // Widget Build

/*Sample code from online. This code is not in use*/
/*Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    } // _buildButtonColumn*/

} // MyApp

Widget printDebug(){
  print("this is a debug call");
}