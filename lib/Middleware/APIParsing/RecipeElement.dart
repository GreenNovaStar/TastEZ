import 'package:tastez/GUI/Pages/winePairing.dart';
import 'package:tastez/Middleware/API%20Parsing/AnalyzedInstruction/Analyzed%20Instruction.dart';
import 'package:tastez/Middleware/API%20Parsing/ExtendedIngredients/ExtendedIngredient.dart';
import 'package:tastez/Middleware/API%20Parsing/WinePairing/WinePairing.dart';
import 'package:tastez/Middleware/API%20Parsing/WinePairing/WinePairingFromCuisines.dart';

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
    this.winePairing,
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
  WinePairing winePairing;
  // List<WinePairing> winePairing;
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
    // winePairing: (json['winePairing'] != null) ? WinePairing.fromJson(json["winePairing"]) : new WinePairing(pairedWines: List.empty(), pairingText: "json['winepairing'] == null", productMatches: List.empty()),
    // winePairing: json["winePairing"] == null ? null : WinePairing.fromJson(json["winePairing"]),
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
    // "winePairing": winePairing == null ? null : winePairing.toJson(),
    // "winePairing": List<dynamic>.from(winePairing.map((x) => x.toJson())),
    "instructions": instructions,
    "analyzedInstructions": List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
    "originalId": originalId,
    "spoonacularSourceUrl": spoonacularSourceUrl,
    "preparationMinutes": preparationMinutes == null ? null : preparationMinutes,
    "cookingMinutes": cookingMinutes == null ? null : cookingMinutes,
    "calories": calories == null ? null : calories,
  };

  bool getWinePairing() {
    bool hasValidPairing = false;
    for (int i = 0; i < this.cuisines.length; i++) {
      print(this.cuisines.elementAt(i));
      for (int j = 0; j < winePairingCuisines.length; j++) {
        if (this.cuisines.elementAt(i) == winePairingCuisines.elementAt(j).name && winePairingCuisines.elementAt(j).hasWines) {
          this.winePairing = winePairingCuisines.elementAt(j).winePairing;
          hasValidPairing = true;
          index = j;
        }
      }
    }
    return hasValidPairing;
  }
}