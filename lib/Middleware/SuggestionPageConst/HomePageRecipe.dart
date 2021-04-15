import 'package:tastez/Middleware/API%20Parsing/ExtendedIngredients/Consistency.dart';
import 'package:tastez/Middleware/API%20Parsing/ExtendedIngredients/ExtendedIngredient.dart';
import 'package:tastez/Middleware/API%20Parsing/RecipeElement.dart';

List<RecipeElement> homePageRecipe = [
  //
  RecipeElement(
    vegetarian: false,
    vegan: false,
    glutenFree: true,
    dairyFree: false,
    veryHealthy: false,
    cheap: false,
    veryPopular: false,
    sustainable: false,
    weightWatcherSmartPoints: 10,
    gaps: "GAPS_FULL",
    lowFodmap: true,
    preparationMinutes: 5,
    cookingMinutes: 15,
    aggregateLikes: 0,
    spoonacularScore: 88.2,
    healthScore: 0,
    creditsText: "Jo Cooks",
    sourceName: "Jo Cooks",
    pricePerServing: 30.61,
    extendedIngredients: [
      ExtendedIngredient(
        id: 20023232,
        aisle: "Meat",
        image: "ribeye-raw.jpg",
        consistency: Consistency.SOLID,
        name: "rib-eye steaks",
        original:"2 rib-eye steaks (around 8 oz each)",
        originalString:"2 rib-eye steaks (around 8 oz each)",
        originalName:"rib-eye steaks (around 8 oz each)",
        amount:2,
        unit: "",
        meta: [
          "(around 8 oz each)",
        ]
      ),
    ],
  )
];