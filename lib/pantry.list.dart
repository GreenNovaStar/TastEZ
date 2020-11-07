import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> savePref(User currUser, List<String> data, String pantryCat) async {
  final Future<Database> database = openDatabase(join(await getDatabasesPath(), 'users.db'),);
  final Database db = await database;

  switch (pantryCat) {
    case "dairy": {
      for (int i = 0; i < currUser.pantry.dairy.length; i++) {
        if (i >= data.length) currUser.pantry.dairy[i] = "";
        else currUser.pantry.dairy[i] = data[i];
      }
    }
    break;
    case "flour": {
      for (int i = 0; i < currUser.pantry.flour.length; i++) {
        if (i >= data.length) currUser.pantry.flour[i] = "";
        else currUser.pantry.flour[i] = data[i];
      }
    }
    break;
    case "fruit": {
      for (int i = 0; i < currUser.pantry.fruit.length; i++) {
        if (i >= data.length) currUser.pantry.fruit[i] = "";
        else currUser.pantry.fruit[i] = data[i];
      }
    }
    break;
    case "meat": {
      for (int i = 0; i < currUser.pantry.meat.length; i++) {
        if (i >= data.length) currUser.pantry.meat[i] = "";
        else currUser.pantry.meat[i] = data[i];
      }
    }
    break;
    case "herbs": {
      for (int i = 0; i < currUser.pantry.herbs.length; i++) {
        if (i >= data.length) currUser.pantry.herbs[i] = "";
        else currUser.pantry.herbs[i] = data[i];
      }
    }
    break;
    case "nuts": {
      for (int i = 0; i < currUser.pantry.nuts.length; i++) {
        if (i >= data.length) currUser.pantry.nuts[i] = "";
        else currUser.pantry.nuts[i] = data[i];
      }
    }
    break;
    case "seafood": {
      for (int i = 0; i < currUser.pantry.seafood.length; i++) {
        if (i >= data.length) currUser.pantry.seafood[i] = "";
        else currUser.pantry.seafood[i] = data[i];
      }
    }
    break;
    case "veget": {
      for (int i = 0; i < currUser.pantry.veget.length; i++) {
        if (i >= data.length) currUser.pantry.veget[i] = "";
        else currUser.pantry.veget[i] = data[i];
      }
    }
    break;
  }
  await db.update(
    'users',
    currUser.toMap(),
    where: "id = ?",
    whereArgs: [currUser.id],
  );
  final List<Map<String,dynamic>> maps = await db.query('users');
  print(data);
  print(currUser.pantry.dairy);
  print(maps);
}

Widget pantry(User currUser) {
    return Padding(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              maintainState: true,
              title: Text("Dairy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),),
              children: <Widget>[ CheckboxGroup( //Dairy
              labels: <String>[
                "Milk",
                "Butter",
                "Buttermilk",
                "Cheese",
                "Cream",
                "Crème Fraiche",
                "Egg",
                "Ghee",
                "Half and Half",
                "Sour Cream",
                "Yogurt",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> dairy) => savePref(currUser, dairy, "dairy"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Flour",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Flour
              labels: <String>[
                "Cake Flour",
                "Chickpea Flour",
                "Cornmeal",
                "Cornstarch",
                "Graham Flour",
                "Maida",
                "Pastry Flour",
                "Rice Flour",
                "Self-rising Flour",
                "Tapoica Starch",
                "Whole Wheat Flour",
                "Flour",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> flour) => savePref(currUser, flour, "flour"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Fruit",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Fruit
              labels: <String>[
                "Apple",
                "Avocado",
                "Banana",
                "Blackberry",
                "Blueberry",
                "Breadfruit",
                "Cherry",
                "Chokeberry",
                "Coconut",
                "Cranberry",
                "Date",
                "Durian",
                "Feijoa",
                "Fig",
                "Grape",
                "Grapefruit",
                "Guava",
                "Haw",
                "Horned Melon",
                "Jackfruit",
                "Juneberry",
                "Kiwifruit",
                "Kumquat",
                "Lemon",
                "Lime","Longan",
                "Lychee",
                "Mango",
                "Medlar",
                "Melon",
                "Nectarine",
                "Olive",
                "Orange",
                "Papaya",
                "Passion Fruit",
                "Pawpaw",
                "Peach",
                "Pear",
                "Pepino",
                "Persimmon",
                "Pineapple",
                "Plantain",
                "Plum",
                "Pomegranate",
                "Prickly Pear",
                "Pummelo",
                "Quince",
                "Raisin",
                "Rambutan",
                "Rasberry",
                "Sapote",
                "Star Fruit",
                "Strawberry",
                "Tamarillo",
                "Tamarind",
                "Tangerine",
                "Ugli Fruit",
                "Watermelon",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> fruit) => savePref(currUser, fruit, "fruit"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Meat and Poultry",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Meat and Poultry
              labels: <String>[
                "Bacon",
                "Beef",
                "Bison",
                "Chicken",
                "Chorizo",
                "Cornish Hen",
                "Duck",
                "Foie Gras",
                "Giblets",
                "Goat",
                "Ham",
                "Hot Dog",
                "Kidney",
                "Lamb",
                "Liver",
                "Mutton",
                "Panchetta",
                "Pastrami",
                "Pepperoni",
                "Pork",
                "Prosciutto",
                "Quail",
                "Rabbit",
                "Salami",
                "Sausage",
                "Tongue",
                "Tripe",
                "Turkey",
                "Veal",
                "Venison",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> meat) => savePref(currUser, meat, "meat"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Herbs and Spices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup(//Herbs and Spices
              labels: <String>[
                "Allspice",
                "Annatto",
                "Asafoetida",
                "Basil",
                "Bay Leaf",
                "Black Salt",
                "Caraway",
                "Cardamon",
                "Celery Seed",
                "Chervil",
                "Chicory",
                "Chili Powder",
                "Cilantro",
                "Cinnamon",
                "Coriander",
                "Cumin",
                "Dill",
                "Fennel",
                "Fenugreek",
                "Galangal",
                "Garlic",
                "Garlic Powder",
                "Ginger",
                "Green Onion",
                "Juniper Berry",
                "Lemongrass",
                "Mint",
                "Mixed Spice",
                "MSG",
                "Mustard",
                "Nutmeg",
                "Oregano",
                "Paprika",
                "Parsley",
                "Pepper",
                "Rosemary",
                "Saffron",
                "Sage",
                "Serrano Chili",
                "Star Anise",
                "Szechuan Pepper",
                "Tamarind",
                "Tarragon",
                "Thyme",
                "Tumeric",
                "Vanilla",
                "Wasabi",
                "Zhug",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> herbs) => savePref(currUser, herbs, "herbs"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Nut and Seeds",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup( //Nut and Seeds
              labels: <String>[
                "Candlenut",
                "Cashew",
                "Chestnut",
                "Macadamia",
                "Peanut",
                "Pecan",
                "Pine Nut",
                "Pistachio",
                "Poppy Seed",
                "Quinoa",
                "Sesame Seed",
                "Sunflower Seeds",
                "Tahini",
                "Walnut",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> nuts) => savePref(currUser, nuts, "nuts"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Seafood",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Seafood
              labels: <String>[
                "Catfish",
                "Caviar",
                "Cod",
                "Crab"
                "Crabstick",
                "Eel",
                "Frog",
                "Hagfish",
                "Octopus",
                "Salmon"
                "Scallop",
                "Sea Cucumber"
                "Shellfish",
                "Shrimp",
                "Snail",
                "Snoek",
                "Squid",
                "Trout",
                "Tuna",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> seafood) => savePref(currUser, seafood, "seafood"),
            ),],),
            ExpansionTile(
              maintainState: true,
              title: Text("Vegetables",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup(//Vegetables
              labels: <String>[
                "Acorn Squash",
                "Alfalfa",
                "Artichoke",
                "Argula",
                "Asparagus",
                "Azuki Bean",
                "Bean Sprout",
                "Beet",
                "Bell Pepper",
                "Brassicas",
                "Broad Bean",
                "Butternut Squash",
                "Carrot",
                "Cassava",
                "Celery",
                "Chayote",
                "Chickpea",
                "Chicory",
                "Chiles",
                "Chufa",
                "Colcannon",
                "Collard Greens",
                "Cucumber",
                "Daikon",
                "Dal",
                "Drumstick",
                "Edible Cactus",
                "Eggplant",
                "Fava Bean",
                "Fennel",
                "Fenugreek",
                "Fiddlehead",
                "Florence Fennel",
                "Frisee",
                "Garlic",
                "Gem Squash",
                "Green Bean",
                "Green Onion",
                "Green Pepper",
                "Habanero",
                "Heart of Palm",
                "Hop Shoot",
                "Horse Radish",
                "Jicama",
                "Kale",
                "Kangkung",
                "Kidney Bean",
                "Kohlarbi",
                "Leek",
                "Legumes",
                "Lemongrass",
                "Lentil",
                "Lettuce",
                "Lima Bean",
                "Mung Bean",
                "Mushroom",
                "Nettle",
                "Nori",
                "Okra",
                "Onion",
                "Pea",
                "Pepperoncini",
                "Pigeon Pea",
                "Pimento",
                "Potato",
                "Pumpkin",
                "Radish",
                "Rhubarb",
                "Romaine Lettuce",
                "Runner Bean",
                "Rutabaga",
                "Salsify",
                "Samphire",
                "Shallot",
                "Snow Pea",
                "Spinach",
                "Spirulina",
                "Squash",
                "Stinging Nettle",
                "Sunchoke",
                "Sweet Potato",
                "Swiss Chard",
                "Taro Root",
                "The Trinity",
                "Tigernut",
                "Tomatillo",
                "Tomato",
                "Truffle",
                "Turnip",
                "Urad Bean",
                "Water Chestnut",
                "Watercress",
                "White Mushroom",
                "Yam",
                "Yardlong Bean",
                "Yu CHoy",
                "Zucchini",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> veget) => savePref(currUser, veget, "veget"),
            ),],),
            ]));
}