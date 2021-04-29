import 'package:tastez/Middleware/Json%20Parsing/FoodPairings.dart';
import 'package:tastez/Middleware/Json%20Parsing/WineCategory.dart';
import 'package:tastez/Middleware/Json%20Parsing/Wines.dart';

List<WineCategory> wines= [
  //Favorite Wines
  WineCategory(
      image: "assets/Wine/TastEZ_favorites.png",
      categoryName: "Favorites",
      wine: []
  ),
  //All Wines
  //todo: need to add pictures for each wine
  WineCategory(
      image: "assets/Wine/TastEZ_all.png",
      categoryName: "All",
      wine: [
        //C
        Wines(
            image: "assets/Wine/RedWine/CabernetSauvignon.jpeg",
            name: "Cabernet Sauvignon",
            description: "Cabernet Sauvignon is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and cholent.",
            foodPairings: [
              FoodPairings(
                name: "Stew",
                image: "assets/Food/stew.jpg",
              ),
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name: "Jjigae",
                image: "assets/Food/jjigae.png",
              ),
              FoodPairings(
                name: "Cholent",
                image: "assets/Food/cholent.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/SparklingWine/Champagne.png",
            name: "Champagne",
            description: "It goes especially well with quiche, french, ceviche, souffle, and coq au vin.",
            foodPairings: [
              FoodPairings(
                name:  "Quiche",
                image: "assets/Food/quiche.jpg",
              ),
              FoodPairings(
                name:"French",
                image: "assets/Food/french_terrine.jpg",
              ),
              FoodPairings(
                name:"Ceviche",
                image: "assets/Food/ceviche.jpg",
              ),
              FoodPairings(
                name:"Souffle",
                image: "assets/Food/souffle.jpg",
              ),
              FoodPairings(
                name:"Coq Au Vin",
                image: "assets/Food/coqauvin.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/chardonnay.png",
            name: "Chardonnay",
            description: "Chardonnay is a dry white wine which is bold and full bodied. It goes especially well with crab, clams, salad, shrimp, and salmon.",
            foodPairings: [
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Clams",
                image: "assets/Food/clams.jpg",
              ),
              FoodPairings(
                name: "Salad",
                image: "assets/Food/salad.jpg",
              ),
              FoodPairings(
                name: "Shrimp",
                image: "assets/Food/shrimp.jpg",
              ),
              FoodPairings(
                name: "Salmon",
                image: "assets/Food/salmon.jpg",
              ),
            ]

        ),
        Wines(
            image: "assets/Wine/SparklingWine/cava.png",
            name: "Cava",
            description: "It goes especially well with chili, crabcakes, and grilled cheese sandwich.",
            foodPairings: [
              FoodPairings(
                name:"Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name:"Crabcakes",
                image: "assets/Food/crabcakes.jpg",
              ),
              FoodPairings(
                name:"Grilled Cheese Sandwich",
                image: "assets/Food/grilledcheese.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/gewurztraminer.png",
            name: "Gewurztraminer",
            description: "Gewurztraminer is a white wine which is aromatic and vibrant. It goes especially well with pho, thai, sushi, asian, and jjigae.",
            foodPairings: [
              FoodPairings(
                name: "Pho",
                image: "assets/Food/pho.jpg",
              ),
              FoodPairings(
                name: "Thai",
                image: "assets/Food/thai.jpg",
              ),
              FoodPairings(
                name: "Sushi",
                image: "assets/Food/sushi.jpg",
              ),FoodPairings(
                name: "Asian",
                image: "assets/Food/asian.jpg",
              ),
              FoodPairings(
                name: "Jjigae",
                image: "assets/Food/jjigae.png",
              ),
            ]
        ),
        //M
        Wines(
            image: "assets/Wine/RedWine/Malbec.png",
            name: "Malbec",
            description: "Malbec is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and burger.",
            foodPairings: [
              FoodPairings(
                name: "Stew",
                image: "assets/Food/stew.jpg",
              ),
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name: "Jjigae",
                image: "assets/Food/jjigae.png",
              ),
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Merlot.jpg",
            name: "Merlot",
            description: "Merlot is a dry red wine which is smooth and medium bodied. It goes especially well with tuna, steak, burger, prime rib, and beef ribs.",
            foodPairings: [
              FoodPairings(
                name: "Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
              FoodPairings(
                name: "Prime Rib",
                image: "assets/Food/primerib.jpg",
              ),
              FoodPairings(
                name: "Beef Ribs",
                image: "assets/Food/beefribs.jpg",
              ),
            ]
        ),
        //2 moscato, one for dessert and one for white wine
        Wines(
            image: "assets/Wine/WhiteWine/moscato.png",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "assets/Food/chocosouffle.jpg",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "assets/Food/Vanilla ricotta souffle.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/moscato.png",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "assets/Food/chocosouffle.jpg",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "assets/Food/Vanilla ricotta souffle.png",
              ),
            ]
        ),
        //N
        Wines(
            image: "assets/Wine/RedWine/Nebbiolo.jpg",
            name: "Nebbiolo",
            description: "Nebbiolo is a dry red wine which is bold and full bodied. It goes especially well with baked ziti.",
            foodPairings: [
              FoodPairings(
                name: "Baked Ziti",
                image: "assets/Food/bakedziti.jpg",
              ),
            ]
        ),
        //P
        Wines(
            image: "assets/Wine/WhiteWine/pinot_grigio.png",
            name: "Pinot Grigio",
            description: "Pinot Grigio is a dry white wine which is crisp and light bodied. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name: "Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name: "Sole",
                image: "assets/Food/sole.jpg",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name: "Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/pinot_gris.png",
            name: "Pinot Gris",
            description: "It goes especially well with rundown, fish tea, caribbean, ropa vieja, and jerk chicken.",
            foodPairings: [
              FoodPairings(
                name: "Rundown",
                image: "assets/Food/Rundown.jpg",
              ),
              FoodPairings(
                name: "Fish Tea",
                image: "assets/Food/fish_tea.png",
              ),
              FoodPairings(
                name: "Caribbean",
                image: "assets/Food/Caribbean.jpg",
              ),
              FoodPairings(
                name: "Ropa Vieja",
                image: "assets/Food/ropa_vieja.png",
              ),
              FoodPairings(
                name: "Jerk Chicken",
                image: "assets/Food/jerk_chicken.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/pinot noir.png",
            name: "Pinot Noir",
            description: "Pinot Noir is a dry red wine which is light and fruity. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name: "Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name: "Sole",
                image: "assets/Food/sole.jpg",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name: "Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/DessertWine/port.jpeg",
            name: "Port",
            description: "It goes especially well with turnover, hand pies, onion tart, pastry pillows, and souffle dessert.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Hand pies",
                image: "assets/Food/handpies.jpg",
              ),
              FoodPairings(
                name: "Pastry Pillows",
                image: "assets/Food/pastrypillows.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Souffle Dessert",
                image: "assets/Food/souffle.jpg",
              ),
            ]
        ),
        //R
        Wines(
            image: "assets/Wine/WhiteWine/riesling.png",
            name: "Riesling",
            description: "Riesling is a white wine which is crisp and light bodied. It goes especially well with pho, crab, thai, clams, and chole.",
            foodPairings: [
              FoodPairings(
                name: "Pho",
                image: "assets/Food/pho.jpg",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Thai",
                image: "assets/Food/thai.jpg",
              ),
              FoodPairings(
                name: "Clams",
                image: "assets/Food/clams.jpg",
              ),
              FoodPairings(
                name: "Chole",
                image: "assets/Food/chole.jpg",
              ),
            ]
        ),
        //S
        Wines(
            image: "assets/Wine/RedWine/Sangiovese.jpg",
            name: "Sangiovese",
            description: "Sangiovese is a dry red wine which is smooth and medium bodied. It goes especially well with steak, pizza, lasagne, italian, and cioppino",
            foodPairings: [
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Pizza",
                image: "assets/Food/pizza.jpg",
              ),
              FoodPairings(
                name: "Lasagne",
                image: "assets/Food/lasagne.jpg",
              ),
              FoodPairings(
                name: "Italian",
                image: "assets/Food/italian.jpg",
              ),
              FoodPairings(
                name: "Cioppino",
                image: "assets/Food/cioppino.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/sauvignon_blanc.png",
            name: "Sauvignon Blanc",
            description: "Sauvignon Blanc is a dry white wine which is smooth and medium bodied. It goes especially well with gumbo, salad, sushi, cajun, and shrimp.",
            foodPairings: [
              FoodPairings(
                name: "Gumbo",
                image: "assets/Food/gumbo.jpeg",
              ),
              FoodPairings(
                name: "Salad",
                image: "assets/Food/salad.jpg",
              ),
              FoodPairings(
                name: "Sushi",
                image: "assets/Food/sushi.jpg",
              ),
              FoodPairings(
                name: "Cajun",
                image: "assets/Food/cajun.jpg",
              ),
              FoodPairings(
                name: "Shrimp",
                image: "assets/Food/shrimp.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/SparklingWine/sekt.jpg",
            name: "Sekt",
            description: "It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name:"Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name:"Sole",
                image: "assets/Food/sole.jpg",
              ),
              FoodPairings(
                name:"Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name:"Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name:"Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/DessertWine/Sherry.png",
            name: "Sherry",
            description: "It goes especially well with turnover, gazpacho, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Gazpacho",
                image: "assets/Food/gazpacho.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "assets/Food/chocosouffle.jpg",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "assets/Food/Vanilla ricotta souffle.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/SparklingWine/Sparkling rose.jpeg",
            name: "Sparkling Rose",
            description: "It goes especially well with chole, tacos, curry, sushi, and nachos.",
            foodPairings: [
              FoodPairings(
                name: "Chole",
                image: "assets/Food/chole.jpg",
              ),
              FoodPairings(
                name:"Tacos",
                image: "assets/Food/tacos.jpg",
              ),
              FoodPairings(
                name:"Curry",
                image: "assets/Food/curry.jpg",
              ),
              FoodPairings(
                name:"Sushi",
                image: "assets/Food/sushi.jpg",
              ),
              FoodPairings(
                name:"Nachos",
                image: "assets/Food/nachos.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Syrah.png",
            name: "Syrah",
            description: "Shiraz is a dry red wine which is bold and full bodied. It goes especially well with chili, pizza, brisket, goulash, and rib tips.",
            foodPairings: [
              FoodPairings(
                name: "Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name: "Pizza",
                image: "assets/Food/pizza.jpg",
              ),
              FoodPairings(
                name: "Brisket",
                image: "assets/Food/brisket.jpg",
              ),
              FoodPairings(
                name: "Goulash",
                image: "assets/Food/goulash.jpg",
              ),
              FoodPairings(
                name: "Rib Tips",
                image: "assets/Food/ribtips.jpg",
              ),
            ]
        ),
        //Z
        Wines(
            image: "assets/Wine/RedWine/Zinfandel.png",
            name: "Zinfandel",
            description: "Zinfandel is a dry red wine which is bold and full bodied. It goes especially well with burger, brisket, cioppino, meatloaf, and rib tips.",
            foodPairings: [
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
              FoodPairings(
                name: "Brisket",
                image: "assets/Food/brisket.jpg",
              ),
              FoodPairings(
                name: "Cioppino",
                image: "assets/Food/cioppino.png",
              ),
              FoodPairings(
                name: "Meatloaf",
                image: "assets/Food/meatloaf.jpg",
              ),
              FoodPairings(
                name: "Rib Tips",
                image: "assets/Food/ribtips.jpg",
              ),
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
            image: "assets/Wine/WhiteWine/chardonnay.png",
            name: "Chardonnay",
            description: "Chardonnay is a dry white wine which is bold and full bodied. It goes especially well with crab, clams, salad, shrimp, and salmon.",
            foodPairings: [
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Clams",
                image: "assets/Food/clams.jpg",
              ),
              FoodPairings(
                name: "Salad",
                image: "assets/Food/salad.jpg",
              ),
              FoodPairings(
                name: "Shrimp",
                image: "assets/Food/shrimp.jpg",
              ),
              FoodPairings(
                name: "Salmon",
                image: "assets/Food/salmon.jpg",
              ),
            ]

        ),
        Wines(
            image: "assets/Wine/WhiteWine/riesling.png",
            name: "Riesling",
            description: "Riesling is a white wine which is crisp and light bodied. It goes especially well with pho, crab, thai, clams, and chole.",
            foodPairings: [
              FoodPairings(
                name: "Pho",
                image: "assets/Food/pho.jpg",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Thai",
                image: "assets/Food/thai.jpg",
              ),
              FoodPairings(
                name: "Clams",
                image: "assets/Food/clams.jpg",
              ),
              FoodPairings(
                name: "Chole",
                image: "assets/Food/chole.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/pinot_grigio.png",
            name: "Pinot Grigio",
            description: "Pinot Grigio is a dry white wine which is crisp and light bodied. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name: "Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name: "Sole",
                image: "assets/Food/sole.jpg",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name: "Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/sauvignon_blanc.png",
            name: "Sauvignon Blanc",
            description: "Sauvignon Blanc is a dry white wine which is smooth and medium bodied. It goes especially well with gumbo, salad, sushi, cajun, and shrimp.",
            foodPairings: [
              FoodPairings(
                name: "Gumbo",
                image: "assets/Food/gumbo.jpeg",
              ),
              FoodPairings(
                name: "Salad",
                image: "assets/Food/salad.jpg",
              ),
              FoodPairings(
                name: "Sushi",
                image: "assets/Food/sushi.jpg",
              ),
              FoodPairings(
                name: "Cajun",
                image: "assets/Food/cajun.jpg",
              ),
              FoodPairings(
                name: "Shrimp",
                image: "assets/Food/shrimp.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/pinot_gris.png",
            name: "Pinot Gris",
            description: "It goes especially well with rundown, fish tea, caribbean, ropa vieja, and jerk chicken.",
            foodPairings: [
              FoodPairings(
                name: "Rundown",
                image: "assets/Food/Rundown.jpg",
              ),
              FoodPairings(
                name: "Fish Tea",
                image: "assets/Food/fish_tea.png",
              ),
              FoodPairings(
                name: "Caribbean",
                image: "assets/Food/Caribbean.jpg",
              ),
              FoodPairings(
                name: "Ropa Vieja",
                image: "assets/Food/ropa_vieja.png",
              ),
              FoodPairings(
                name: "Jerk Chicken",
                image: "assets/Food/jerk_chicken.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/moscato.png",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name: "Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name: "Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name: "Chocolate Souffle",
                image: "assets/Food/chocosouffle.jpg",
              ),
              FoodPairings(
                name: "Vanilla Ricotta Souffle",
                image: "assets/Food/Vanilla ricotta souffle.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/gewurztraminer.png",
            name: "Gewurztraminer",
            description: "Gewurztraminer is a white wine which is aromatic and vibrant. It goes especially well with pho, thai, sushi, asian, and jjigae.",
            foodPairings: [
              FoodPairings(
                name: "Pho",
                image: "assets/Food/pho.jpg",
              ),
              FoodPairings(
                name: "Thai",
                image: "assets/Food/thai.jpg",
              ),
              FoodPairings(
                name: "Sushi",
                image: "assets/Food/sushi.jpg",
              ),FoodPairings(
                name: "Asian",
                image: "assets/Food/asian.jpg",
              ),
              FoodPairings(
                name: "Jjigae",
                image: "assets/Food/jjigae.png",
              ),
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
            image: "assets/Wine/RedWine/CabernetSauvignon.jpeg",
            name: "Cabernet Sauvignon",
            description: "Cabernet Sauvignon is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and cholent.",
            foodPairings: [
              FoodPairings(
                name: "Stew",
                image: "assets/Food/stew.jpg",
              ),
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name: "Jjigae",
                image: "assets/Food/jjigae.png",
              ),
              FoodPairings(
                name: "Cholent",
                image: "assets/Food/cholent.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Merlot.jpg",
            name: "Merlot",
            description: "Merlot is a dry red wine which is smooth and medium bodied. It goes especially well with tuna, steak, burger, prime rib, and beef ribs.",
            foodPairings: [
              FoodPairings(
                name: "Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
              FoodPairings(
                name: "Prime Rib",
                image: "assets/Food/primerib.jpg",
              ),
              FoodPairings(
                name: "Beef Ribs",
                image: "assets/Food/beefribs.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Syrah.png",
            name: "Syrah",
            description: "Shiraz is a dry red wine which is bold and full bodied. It goes especially well with chili, pizza, brisket, goulash, and rib tips.",
            foodPairings: [
              FoodPairings(
                name: "Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name: "Pizza",
                image: "assets/Food/pizza.jpg",
              ),
              FoodPairings(
                name: "Brisket",
                image: "assets/Food/brisket.jpg",
              ),
              FoodPairings(
                name: "Goulash",
                image: "assets/Food/goulash.jpg",
              ),
              FoodPairings(
                name: "Rib Tips",
                image: "assets/Food/ribtips.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Zinfandel.png",
            name: "Zinfandel",
            description: "Zinfandel is a dry red wine which is bold and full bodied. It goes especially well with burger, brisket, cioppino, meatloaf, and rib tips.",
            foodPairings: [
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
              FoodPairings(
                name: "Brisket",
                image: "assets/Food/brisket.jpg",
              ),
              FoodPairings(
                name: "Cioppino",
                image: "assets/Food/cioppino.png",
              ),
              FoodPairings(
                name: "Meatloaf",
                image: "assets/Food/meatloaf.jpg",
              ),
              FoodPairings(
                name: "Rib Tips",
                image: "assets/Food/ribtips.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Malbec.png",
            name: "Malbec",
            description: "Malbec is a dry red wine which is bold and full bodied. It goes especially well with stew, steak, chili, jjigae, and burger.",
            foodPairings: [
              FoodPairings(
                name: "Stew",
                image: "assets/Food/stew.jpg",
              ),
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name: "Jjigae",
                image: "assets/Food/jjigae.png",
              ),
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/pinot noir.png",
            name: "Pinot Noir",
            description: "Pinot Noir is a dry red wine which is light and fruity. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name: "Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name: "Sole",
                image: "assets/Food/sole.jpg",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name: "Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Sangiovese.jpg",
            name: "Sangiovese",
            description: "Sangiovese is a dry red wine which is smooth and medium bodied. It goes especially well with steak, pizza, lasagne, italian, and cioppino",
            foodPairings: [
              FoodPairings(
                name: "Steak",
                image: "assets/Food/steak.jpg",
              ),
              FoodPairings(
                name: "Pizza",
                image: "assets/Food/pizza.jpg",
              ),
              FoodPairings(
                name: "Lasagne",
                image: "assets/Food/lasagne.jpg",
              ),
              FoodPairings(
                name: "Italian",
                image: "assets/Food/italian.jpg",
              ),
              FoodPairings(
                name: "Cioppino",
                image: "assets/Food/cioppino.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/RedWine/Nebbiolo.jpg",
            name: "Nebbiolo",
            description: "Nebbiolo is a dry red wine which is bold and full bodied. It goes especially well with baked ziti.",
            foodPairings: [
              FoodPairings(
                name: "Baked Ziti",
                image: "assets/Food/bakedziti.jpg",
              ),
            ]
        ),
      ]),
  //Sparkling Wines
  WineCategory(
      image: "assets/Wine/SparklingWine/SparklingWineCategory_2.jpg",
      categoryName: "Sparkling Wine",
      wine: [
        Wines(
            image: "assets/Wine/SparklingWine/Champagne.png",
            name: "Champagne",
            description: "It goes especially well with quiche, french, ceviche, souffle, and coq au vin.",
            foodPairings: [
              FoodPairings(
                name:  "Quiche",
                image: "assets/Food/quiche.jpg",
              ),
              FoodPairings(
                name:"French",
                image: "assets/Food/french_terrine.jpg",
              ),
              FoodPairings(
                name:"Ceviche",
                image: "assets/Food/ceviche.jpg",
              ),
              FoodPairings(
                name:"Souffle",
                image: "assets/Food/souffle.jpg",
              ),
              FoodPairings(
                name:"Coq Au Vin",
                image: "assets/Food/coqauvin.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/SparklingWine/cava.png",
            name: "Cava",
            description: "It goes especially well with chili, crabcakes, and grilled cheese sandwich.",
            foodPairings: [
              FoodPairings(
                name:"Chili",
                image: "assets/Food/chili.jpg",
              ),
              FoodPairings(
                name:"Crabcakes",
                image: "assets/Food/crabcakes.jpg",
              ),
              FoodPairings(
                name:"Grilled Cheese Sandwich",
                image: "assets/Food/grilledcheese.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/SparklingWine/sekt.jpg",
            name: "Sekt",
            description: "It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name:"Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name:"Sole",
                image: "assets/Food/sole.jpg",
              ),
              FoodPairings(
                name:"Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name:"Tuna",
                image: "assets/Food/tuna.jpg",
              ),
              FoodPairings(
                name:"Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/SparklingWine/Sparkling rose.jpeg",
            name: "Sparkling Rose",
            description: "It goes especially well with chole, tacos, curry, sushi, and nachos.",
            foodPairings: [
              FoodPairings(
                name: "Chole",
                image: "assets/Food/chole.jpg",
              ),
              FoodPairings(
                name:"Tacos",
                image: "assets/Food/tacos.jpg",
              ),
              FoodPairings(
                name:"Curry",
                image: "assets/Food/curry.jpg",
              ),
              FoodPairings(
                name:"Sushi",
                image: "assets/Food/sushi.jpg",
              ),
              FoodPairings(
                name:"Nachos",
                image: "assets/Food/nachos.jpg",
              ),
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
            image: "assets/Wine/DessertWine/Sherry.png",
            name: "Sherry",
            description: "It goes especially well with turnover, gazpacho, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Gazpacho",
                image: "assets/Food/gazpacho.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "assets/Food/chocosouffle.jpg",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "assets/Food/Vanilla ricotta souffle.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/WhiteWine/moscato.png",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "assets/Food/chocosouffle.jpg",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "assets/Food/Vanilla ricotta souffle.png",
              ),
            ]
        ),
        Wines(
            image: "assets/Wine/DessertWine/port.jpeg",
            name: "Port",
            description: "It goes especially well with turnover, hand pies, onion tart, pastry pillows, and souffle dessert.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "assets/Food/turnover.jpg",
              ),
              FoodPairings(
                name:"Hand pies",
                image: "assets/Food/handpies.jpg",
              ),
              FoodPairings(
                name: "Pastry Pillows",
                image: "assets/Food/pastrypillows.jpg",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Souffle Dessert",
                image: "assets/Food/souffle.jpg",
              ),
            ]
        ),
      ]),
];