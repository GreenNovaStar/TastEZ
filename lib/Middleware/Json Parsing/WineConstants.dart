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
                image: "",
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
                            image: "",
                      ),
                ]
            ),
            Wines(
                image: "",
                name: "Champagne",
                description: "It goes especially well with quiche, french, ceviche, souffle, and coq au vin.",
                foodPairings: [
                      FoodPairings(
                            name:  "Quiche",
                            image: "assets/Food/quiche.jpg",
                      ),
                      FoodPairings(
                            name:"French",
                            image: "",
                      ),
                      FoodPairings(
                            name:"Ceviche",
                            image: "",
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
                image: "",
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
                image: "",
                name: "Cava",
                description: "It goes especially well with chili, crabcakes, and grilled cheese sandwich.",
                foodPairings: [
                      FoodPairings(
                            name:"Chili",
                            image: "",
                      ),
                      FoodPairings(
                            name:"Crabcakes",
                            image: "",
                      ),
                      FoodPairings(
                            name:"Grilled Cheese Sandwich",
                            image: "",
                      ),
                ]
            ),
        Wines(
            image: "",
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
            image: "",
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
            image: "",
            name: "Merlot",
            description: "Merlot is a dry red wine which is smooth and medium bodied. It goes especially well with tuna, steak, burger, prime rib, and beef ribs.",
            foodPairings: [
              FoodPairings(
                name: "Suna",
                image: "",
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
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "",
              ),
            ]
        ),
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "",
              ),
            ]
        ),
        //N
        Wines(
            image: "",
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
            image: "",
            name: "Pinot Grigio",
            description: "Pinot Grigio is a dry white wine which is crisp and light bodied. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name: "Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name: "Sole",
                image: "",
              ),
              FoodPairings(
                name: "Crab",
                image: "assets/Food/crab.jpg",
              ),
              FoodPairings(
                name: "Tuna",
                image: "",
              ),
              FoodPairings(
                name: "Hake",
                image: "assets/Food/hake.jpg",
              ),
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Gris",
            description: "It goes especially well with rundown, fish tea, caribbean, ropa vieja, and jerk chicken.",
            foodPairings: [
              FoodPairings(
                name: "Rundown",
                image: "",
              ),
              FoodPairings(
                name: "Fish Tea",
                image: "",
              ),
              FoodPairings(
                name: "Caribbean",
                image: "",
              ),
              FoodPairings(
                name: "Ropa Vieja",
                image: "",
              ),
              FoodPairings(
                name: "Jerk Chicken",
                image: "",
              ),
            ]
        ),
        Wines(
            image: "",
            name: "Pinot Noir",
            description: "Pinot Noir is a dry red wine which is light and fruity. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name: "Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name: "Sole",
                image: "",
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
            image: "",
            name: "Port",
            description: "It goes especially well with turnover, hand pies, onion tart, pastry pillows, and souffle dessert.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "",
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
            image: "",
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
            image: "",
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
                image: "",
              ),
            ]
        ),
        Wines(
            image: "",
            name: "Sauvignon Blanc",
            description: "Sauvignon Blanc is a dry white wine which is smooth and medium bodied. It goes especially well with gumbo, salad, sushi, cajun, and shrimp.",
            foodPairings: [
              FoodPairings(
                name: "Gumbo",
                image: "",
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
            image: "",
            name: "Sekt",
            description: "It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
              FoodPairings(
                name:"Cod",
                image: "assets/Food/cod.jpg",
              ),
              FoodPairings(
                name:"Sole",
                image: "",
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
                image: "",
              ),
            ]
        ),
        Wines(
            image: "",
            name: "Sherry",
            description: "It goes especially well with turnover, gazpacho, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
              FoodPairings(
                name:"Turnover",
                image: "",
              ),
              FoodPairings(
                name:"Gazpacho",
                image: "",
              ),
              FoodPairings(
                name:"Onion Tart",
                image: "assets/Food/oniontart.jpg",
              ),
              FoodPairings(
                name:"Chocolate Souffle",
                image: "",
              ),
              FoodPairings(
                name:"Vanilla Ricotta Souffle",
                image: "",
              ),
            ]
        ),
        Wines(
            image: "",
            name: "Sparkling Rose",
            description: "It goes especially well with chole, tacos, curry, sushi, and nachos.",
            foodPairings: [
              FoodPairings(
                name: "Chole",
                image: "assets/Food/chole.jpg",
              ),
              FoodPairings(
                name:"Tacos",
                image: "",
              ),
              FoodPairings(
                name:"Curry",
                image: "",
              ),
              FoodPairings(
                name:"Sushi",
                image: "",
              ),
              FoodPairings(
                name:"Nachos",
                image: "",
              ),
            ]
        ),
        Wines(
            image: "",
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
                image: "",
              ),
              FoodPairings(
                name: "Goulash",
                image: "",
              ),
              FoodPairings(
                name: "Rib Tips",
                image: "",
              ),
            ]
        ),
        //Z
        Wines(
            image: "",
            name: "Zinfandel",
            description: "Zinfandel is a dry red wine which is bold and full bodied. It goes especially well with burger, brisket, cioppino, meatloaf, and rib tips.",
            foodPairings: [
              FoodPairings(
                name: "Burger",
                image: "assets/Food/burger.jpg",
              ),
              FoodPairings(
                name: "Brisket",
                image: "",
              ),
              FoodPairings(
                name: "Cioppino",
                image: "",
              ),
              FoodPairings(
                name: "Meatloaf",
                image: "",
              ),
              FoodPairings(
                name: "Rib Tips",
                image: "",
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
            image: "",
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
            image: "",
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
            image: "",
            name: "Pinot Grigio",
            description: "Pinot Grigio is a dry white wine which is crisp and light bodied. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
                  FoodPairings(
                        name: "Cod",
                        image: "assets/Food/cod.jpg",
                  ),
                  FoodPairings(
                        name: "Sole",
                        image: "",
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
            image: "",
            name: "Sauvignon Blanc",
            description: "Sauvignon Blanc is a dry white wine which is smooth and medium bodied. It goes especially well with gumbo, salad, sushi, cajun, and shrimp.",
            foodPairings: [
                  FoodPairings(
                        name: "Gumbo",
                        image: "",
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
            image: "",
            name: "Pinot Gris",
            description: "It goes especially well with rundown, fish tea, caribbean, ropa vieja, and jerk chicken.",
            foodPairings: [
                  FoodPairings(
                        name: "Rundown",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Fish Tea",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Caribbean",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Ropa Vieja",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Jerk Chicken",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
                  FoodPairings(
                        name: "Turnover",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Onion Tart",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Chocolate Souffle",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Vanilla Ricotta Souffle",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
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
                image: "",
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
                            image: "",
                      ),
                ]
            ),
        Wines(
            image: "",
            name: "Merlot",
            description: "Merlot is a dry red wine which is smooth and medium bodied. It goes especially well with tuna, steak, burger, prime rib, and beef ribs.",
            foodPairings: [
                  FoodPairings(
                        name: "Suna",
                        image: "",
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
            image: "",
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
                        image: "",
                  ),
                  FoodPairings(
                        name: "Goulash",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Rib Tips",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
            name: "Zinfandel",
            description: "Zinfandel is a dry red wine which is bold and full bodied. It goes especially well with burger, brisket, cioppino, meatloaf, and rib tips.",
            foodPairings: [
                  FoodPairings(
                        name: "Burger",
                        image: "assets/Food/burger.jpg",
                  ),
                  FoodPairings(
                        name: "Brisket",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Cioppino",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Meatloaf",
                        image: "",
                  ),
                  FoodPairings(
                        name: "Rib Tips",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
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
            image: "",
            name: "Pinot Noir",
            description: "Pinot Noir is a dry red wine which is light and fruity. It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
                  FoodPairings(
                        name: "Cod",
                        image: "assets/Food/cod.jpg",
                  ),
                  FoodPairings(
                        name: "Sole",
                        image: "",
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
            image: "",
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
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
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
            image: "",
            name: "Champagne",
            description: "It goes especially well with quiche, french, ceviche, souffle, and coq au vin.",
            foodPairings: [
                  FoodPairings(
                        name:  "Quiche",
                        image: "assets/Food/quiche.jpg",
                  ),
                  FoodPairings(
                        name:"French",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Ceviche",
                        image: "",
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
            image: "",
            name: "Cava",
            description: "It goes especially well with chili, crabcakes, and grilled cheese sandwich.",
            foodPairings: [
                  FoodPairings(
                        name:"Chili",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Crabcakes",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Grilled Cheese Sandwich",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
            name: "Sekt",
            description: "It goes especially well with cod, sole, crab, tuna, and hake.",
            foodPairings: [
                  FoodPairings(
                        name:"Cod",
                        image: "assets/Food/cod.jpg",
                  ),
                  FoodPairings(
                        name:"Sole",
                        image: "",
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
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
            name: "Sparkling Rose",
            description: "It goes especially well with chole, tacos, curry, sushi, and nachos.",
            foodPairings: [
                  FoodPairings(
                        name: "Chole",
                        image: "assets/Food/chole.jpg",
                  ),
                  FoodPairings(
                        name:"Tacos",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Curry",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Sushi",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Nachos",
                        image: "",
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
            image: "",
            name: "Sherry",
            description: "It goes especially well with turnover, gazpacho, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
                  FoodPairings(
                        name:"Turnover",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Gazpacho",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Onion Tart",
                        image: "assets/Food/oniontart.jpg",
                  ),
                  FoodPairings(
                        name:"Chocolate Souffle",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Vanilla Ricotta Souffle",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
            name: "Moscato",
            description: "Moscato is a dessert wine which is aromatic and vibrant. It goes especially well with turnover, onion tart, chocolate souffle, and vanilla ricotta souffle.",
            foodPairings: [
                  FoodPairings(
                        name:"Turnover",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Onion Tart",
                        image: "assets/Food/oniontart.jpg",
                  ),
                  FoodPairings(
                        name:"Chocolate Souffle",
                        image: "",
                  ),
                  FoodPairings(
                        name:"Vanilla Ricotta Souffle",
                        image: "",
                  ),
            ]
        ),
        Wines(
            image: "",
            name: "Port",
            description: "It goes especially well with turnover, hand pies, onion tart, pastry pillows, and souffle dessert.",
            foodPairings: [
                  FoodPairings(
                        name:"Turnover",
                        image: "",
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