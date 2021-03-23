import 'package:tastez/Middleware/Json%20Parsing/WineCategory.dart';
import 'package:tastez/Middleware/Json%20Parsing/Wines.dart';

List<WineCategory> wines= [
  //Favorite Wines
  WineCategory(
      image: "",
      categoryName: "Favorites",
      wine: []
  ),
  //All Wines
  //todo: need to add pictures for each wine
  WineCategory(
      image: "",
      categoryName: "All",
      wine: [
        //C
        Wines(
            image: "",
            name: "Cabernet Sauvignon",
            description: "Cabernet Sauvignon is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and cholent.",
            foodPairings: [
              "Stew",
              "Steak",
              "Chili",
              "Jjigae",
              "Cholent",
            ]
        ),
        Wines(
            image: "",
            name: "Champagne",
            description: "It goes especially well with quiche, french, ceviche, souffle, and coq au vin.",
            foodPairings: [
              "Quiche",
              "French",
              "Ceviche",
              "Souffle",
              "Coq Au Vin",
            ]
        ),
        Wines(
            image: "",
            name: "Chardonnay",
            description: "Chardonnay is a dry white wine which is bold and full bodied. It goes especially well with crab, clams, salad, shrimp, and salmon.",
            foodPairings: [
              "Crab",
              "Clams",
              "Salad",
              "Shrimp",
              "Salmon",
            ]
        ),
        Wines(
            image: "",
            name: "Cava",
            description: "It goes especially well with chili, crabcakes, and grilled cheese sandwich.",
            foodPairings: [
              "Chili",
              "Crabcakes",
              "Grilled Cheese Sandwich",
            ]
        ),
        Wines(
            image: "",
            name: "Gewurztraminer",
            description: "Gewurztraminer is a white wine which is aromatic and vibrant. It goes especially well with pho, thai, sushi, asian, and jjigae.",
            foodPairings: [
              "Pho",
              "Thai",
              "Sushi",
              "Asian",
              "Jjigae",
            ]
        ),
        //M
        Wines(
            image: "",
            name: "Malbec",
            description: "Malbec is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and burger.",
            foodPairings: [
              "Stew",
              "Steak",
              "Chili",
              "Jjigae",
              "Burger",
            ]
        ),
        Wines(
            image: "",
            name: "Merlot",
            description: "Merlot is a dry red wine which is smooth and medium bodied. It goes especially well with tuna, steak, burger, prime rib, and beef ribs.",
            foodPairings: [
              "Tuna",
              "Steak",
              "Burger",
              "Prime Rib",
              "Beef Ribs",
            ]
        ),
        //2 moscato, one for dessert and one for white wine
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              "Turnover",
              "Onion Tart",
              "Chocolate Souffle",
              "Vanilla Ricotta Souffle",
            ]
        ),
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              "Turnover",
              "Onion Tart",
              "Chocolate Souffle",
              "Vanilla Ricotta Souffle",
            ]
        ),
        //N
        Wines(
            image: "",
            name: "Nebbiolo",
            description: "Nebbiolo is a dry red wine which is bold and full bodied. It goes especially well with baked ziti.",
            foodPairings: [
              "Baked Ziti",
            ]
        ),
        //P
        Wines(
            image: "",
            name: "Pinot Grigio",
            description: "Pinot Grigio is a dry white wine which is crisp and light bodied. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              "Cod",
              "Sole",
              "Crab",
              "Tuna",
              "Hake",
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Gris",
            description: "It goes especially well with rundown, fish tea, caribbean, ropa vieja, and jerk chicken.",
            foodPairings: [
              "Rundown",
              "Fish Tea",
              "Caribbean",
              "Ropa Vieja",
              "Jerk Chicken",
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Noir",
            description: "Pinot Noir is a dry red wine which is light and fruity. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              "Cod",
              "Sole",
              "Crab",
              "Tuna",
              "Hake",
            ]
        ),
        Wines(
            image: "",
            name: "Port",
            description: "It goes especially well with turnover, hand pies, onion tart, pastry pillows, and souffle dessert.",
            foodPairings: [
              "Turnover",
              "Hand pies",
              "Onion Tart",
              "Pastry Pillows",
              "Souffle Dessert",
            ]
        ),
        //R
        Wines(
            image: "",
            name: "Riesling",
            description: "Riesling is a white wine which is crisp and light bodied. It goes especially well with pho, crab, thai, clams, and chole.",
            foodPairings: [
              "Pho",
              "Crab",
              "Thai",
              "Clams",
              "Chole",
            ]
        ),
        //S
        Wines(
            image: "",
            name: "Sangiovese",
            description: "Sangiovese is a dry red wine which is smooth and medium bodied. It goes especially well with steak, pizza, lasagne, italian, and cioppino",
            foodPairings: [
              "Steak",
              "Pizza",
              "Lasagne",
              "Italian",
              "Cioppino",
            ]
        ),
        Wines(
            image: "",
            name: "Sauvignon Blanc",
            description: "Sauvignon Blanc is a dry white wine which is smooth and medium bodied. It goes especially well with gumbo, salad, sushi, cajun, and shrimp.",
            foodPairings: [
              "Gumbo",
              "Salad",
              "Sushi",
              "Cajun",
              "Shrimp",
            ]
        ),
        Wines(
            image: "",
            name: "Sekt",
            description: "It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              "Cod",
              "Sole",
              "Crab",
              "Tuna",
              "Hake",
            ]
        ),
        Wines(
            image: "",
            name: "Sherry",
            description: "It goes especially well with turnover, gazpacho, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              "Turnover",
              "Gazpacho",
              "Onion Tart",
              "Chocolate Souffle",
              "Vanilla Ricotta Souffle",
            ]
        ),
        Wines(
            image: "",
            name: "Sparkling Rose",
            description: "It goes especially well with chole, tacos, curry, sushi, and nachos.",
            foodPairings: [
              "Chole",
              "Tacos",
              "Curry",
              "Sushi",
              "Nachos",
            ]
        ),
        Wines(
            image: "",
            name: "Syrah",
            description: "Shiraz is a dry red wine which is bold and full bodied. It goes especially well with chili, pizza, brisket, goulash, and rib tips.",
            foodPairings: [
              "Chili",
              "Pizza",
              "Brisket",
              "Goulash",
              "Rib Tips",
            ]
        ),
        //Z
        Wines(
            image: "",
            name: "Zinfandel",
            description: "Zinfandel is a dry red wine which is bold and full bodied. It goes especially well with burger, brisket, cioppino, meatloaf, and rib tips.",
            foodPairings: [
              "Burger",
              "Brisket",
              "Cioppino",
              "Meatloaf",
              "Rib Tips",
            ]
        ),







      ]
  ),
  // White Wines
  WineCategory(
      image: "assets/Wine/WhiteWine/WhiteWineCategory.jpg",
      categoryName: "White Wine",
      wine: [
        Wines(
            image: "",
            name: "Chardonnay",
            description: "Chardonnay is a dry white wine which is bold and full bodied. It goes especially well with crab, clams, salad, shrimp, and salmon.",
            foodPairings: [
              "Crab",
              "Clams",
              "Salad",
              "Shrimp",
              "Salmon",
            ]

        ),
        Wines(
            image: "",
            name: "Riesling",
            description: "Riesling is a white wine which is crisp and light bodied. It goes especially well with pho, crab, thai, clams, and chole.",
            foodPairings: [
              "Pho",
              "Crab",
              "Thai",
              "Clams",
              "Chole",
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Grigio",
            description: "Pinot Grigio is a dry white wine which is crisp and light bodied. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              "Cod",
              "Sole",
              "Crab",
              "Tuna",
              "Hake",
            ]
        ),
        Wines(
            image: "",
            name: "Sauvignon Blanc",
            description: "Sauvignon Blanc is a dry white wine which is smooth and medium bodied. It goes especially well with gumbo, salad, sushi, cajun, and shrimp.",
            foodPairings: [
              "Gumbo",
              "Salad",
              "Sushi",
              "Cajun",
              "Shrimp",
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Gris",
            description: "It goes especially well with rundown, fish tea, caribbean, ropa vieja, and jerk chicken.",
            foodPairings: [
              "Rundown",
              "Fish Tea",
              "Caribbean",
              "Ropa Vieja",
              "Jerk Chicken",
            ]
        ),
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              "Turnover",
              "Onion Tart",
              "Chocolate Souffle",
              "Vanilla Ricotta Souffle",
            ]
        ),
        Wines(
            image: "",
            name: "Gewurztraminer",
            description: "Gewurztraminer is a white wine which is aromatic and vibrant. It goes especially well with pho, thai, sushi, asian, and jjigae.",
            foodPairings: [
              "pho",
              "thai",
              "sushi",
              "asian",
              "jjigae",
            ]
        ),
      ]
  ),
  //Red Wines
  WineCategory(
      image: "assets/Wine/RedWine/RedWineCategory.jpg",
      categoryName: "Red Wine",
      wine: [
        Wines(
            image: "",
            name: "Cabernet Sauvignon",
            description: "Cabernet Sauvignon is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and cholent.",
            foodPairings: [
              "Stew",
              "Steak",
              "Chili",
              "Jjigae",
              "Cholent",
            ]
        ),
        Wines(
            image: "",
            name: "Merlot",
            description: "Merlot is a dry red wine which is smooth and medium bodied. It goes especially well with tuna, steak, burger, prime rib, and beef ribs.",
            foodPairings: [
              "Suna",
              "Steak",
              "Burger",
              "Prime Rib",
              "Beef Ribs",
            ]
        ),
        Wines(
            image: "",
            name: "Syrah",
            description: "Shiraz is a dry red wine which is bold and full bodied. It goes especially well with chili, pizza, brisket, goulash, and rib tips.",
            foodPairings: [
              "Chili",
              "Pizza",
              "Brisket",
              "Goulash",
              "Rib Tips",
            ]
        ),
        Wines(
            image: "",
            name: "Zinfandel",
            description: "Zinfandel is a dry red wine which is bold and full bodied. It goes especially well with burger, brisket, cioppino, meatloaf, and rib tips.",
            foodPairings: [
              "Burger",
              "Brisket",
              "Cioppino",
              "Meatloaf",
              "Rib Tips",
            ]
        ),
        Wines(
            image: "",
            name: "Malbec",
            description: "Malbec is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and burger.",
            foodPairings: [
              "Stew",
              "Steak",
              "Chili",
              "Jjigae",
              "Burger",
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Noir",
            description: "Pinot Noir is a dry red wine which is light and fruity. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              "Cod",
              "Sole",
              "Crab",
              "Tuna",
              "Hake",
            ]
        ),
        Wines(
            image: "",
            name: "Sangiovese",
            description: "Sangiovese is a dry red wine which is smooth and medium bodied. It goes especially well with steak, pizza, lasagne, italian, and cioppino",
            foodPairings: [
              "Steak",
              "Pizza",
              "Lasagne",
              "Italian",
              "Cioppino",
            ]
        ),
        Wines(
            image: "",
            name: "Nebbiolo",
            description: "Nebbiolo is a dry red wine which is bold and full bodied. It goes especially well with baked ziti.",
            foodPairings: [
              "Baked Ziti",
            ]
        ),
      ]),
  //Sparkling Wines
  WineCategory(
      image: "assets/Wine/SparklingWine/SparklingWineCategory_2.jpg",
      categoryName: "Sparkling Wine",
      wine: [
        Wines(
            image: "",
            name: "Champagne",
            description: "It goes especially well with quiche, french, ceviche, souffle, and coq au vin.",
            foodPairings: [
              "Quiche",
              "French",
              "Ceviche",
              "Souffle",
              "Coq Au Vin",
            ]
        ),
        Wines(
            image: "",
            name: "Cava",
            description: "It goes especially well with chili, crabcakes, and grilled cheese sandwich.",
            foodPairings: [
              "Chili",
              "Crabcakes",
              "Grilled Cheese Sandwich",
            ]
        ),
        Wines(
            image: "",
            name: "Sekt",
            description: "It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              "Cod",
              "Sole",
              "Crab",
              "Tuna",
              "Hake",
            ]
        ),
        Wines(
            image: "",
            name: "Sparkling Rose",
            description: "It goes especially well with chole, tacos, curry, sushi, and nachos.",
            foodPairings: [
              "Chole",
              "Tacos",
              "Curry",
              "Sushi",
              "Nachos",
            ]
        ),
      ]
  ),
  // Desset Wines
  WineCategory(
      image: "assets/Wine/DessertWine/DessertWineCategory_2.jpg",
      categoryName: "Dessert Wine",
      wine: [
        Wines(
            image: "",
            name: "Sherry",
            description: "It goes especially well with turnover, gazpacho, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              "Turnover",
              "Gazpacho",
              "Onion Tart",
              "Chocolate Souffle",
              "Vanilla Ricotta Souffle",
            ]
        ),
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              "Turnover",
              "Onion Tart",
              "Chocolate Souffle",
              "Vanilla Ricotta Souffle",
            ]
        ),
        Wines(
            image: "",
            name: "Port",
            description: "It goes especially well with turnover, hand pies, onion tart, pastry pillows, and souffle dessert.",
            foodPairings: [
              "Turnover",
              "Hand pies",
              "Onion Tart",
              "Pastry Pillows",
              "Souffle Dessert",
            ]
        ),
      ]),
];

Wines testWine = new Wines(
    image: "",
    name: "Test Wine",
    description: "This is a temp description",
    foodPairings: []
);