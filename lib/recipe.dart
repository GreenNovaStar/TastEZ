// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

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
  List<dynamic> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<dynamic> occasions;
  String instructions;
  List<AnalyzedInstruction> analyzedInstructions;
  dynamic originalId;
  String spoonacularSourceUrl;
  int preparationMinutes;
  int cookingMinutes;

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
    pricePerServing: json["pricePerServing"].toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
    dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    diets: List<String>.from(json["diets"].map((x) => x)),
    occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
    instructions: json["instructions"],
    analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
    preparationMinutes: json["preparationMinutes"] == null ? null : json["preparationMinutes"],
    cookingMinutes: json["cookingMinutes"] == null ? null : json["cookingMinutes"],
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
    "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
    "dishTypes": List<dynamic>.from(dishTypes.map((x) => x)),
    "diets": List<dynamic>.from(diets.map((x) => x)),
    "occasions": List<dynamic>.from(occasions.map((x) => x)),
    "instructions": instructions,
    "analyzedInstructions": List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
    "originalId": originalId,
    "spoonacularSourceUrl": spoonacularSourceUrl,
    "preparationMinutes": preparationMinutes == null ? null : preparationMinutes,
    "cookingMinutes": cookingMinutes == null ? null : cookingMinutes,
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