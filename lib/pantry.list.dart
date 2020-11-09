import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'prefs.dart';

class Pantry {
  List<String> dairy;
  List<String> flour;
  List<String> fruit;
  List<String> meat;
  List<String> herbs;
  List<String> nuts;
  List<String> seafood;
  List<String> veget;

  Pantry(
      {this.dairy,
        this.flour,
        this.fruit,
        this.meat,
        this.herbs,
        this.nuts,
        this.seafood,
        this.veget});

  Pantry.fromJson(Map<String, dynamic> json) {
    dairy = json['dairy'].cast<String>();
    flour = json['flour'].cast<String>();
    fruit = json['fruit'].cast<String>();
    meat = json['meat'].cast<String>();
    herbs = json['herbs'].cast<String>();
    nuts = json['nuts'].cast<String>();
    seafood = json['seafood'].cast<String>();
    veget = json['veget'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dairy'] = this.dairy;
    data['flour'] = this.flour;
    data['fruit'] = this.fruit;
    data['meat'] = this.meat;
    data['herbs'] = this.herbs;
    data['nuts'] = this.nuts;
    data['seafood'] = this.seafood;
    data['veget'] = this.veget;
    return data;
  }
}

// region pantry defaults
List<String> dairyDefault = [
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
];
List<String> flourDefault = [
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
];
List<String> fruitDefault = [
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
];
List<String> meatDefault = [
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
];
List<String> herbsDefault = [
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
];
List<String> nutsDefault = [
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
];
List<String> seafoodDefault = [
  "Catfish",
  "Caviar",
  "Cod",
  "Crab",
  "Crabstick",
  "Eel",
  "Frog",
  "Hagfish",
  "Octopus",
  "Salmon",
  "Scallop",
  "Sea Cucumber",
  "Shellfish",
  "Shrimp",
  "Snail",
  "Snoek",
  "Squid",
  "Trout",
  "Tuna",
];
List<String> vegetDefault = [
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
  "Yu Choy",
  "Zucchini",
];
//endregion pantry defaults

TextEditingController addController = new TextEditingController();

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
              labels: dairyDefault + currUser.prefs.dairyCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> dairy) => currUser.savePref(dairy, "dairy"),
            ),
            Card(
              child: TextField(
                controller: addController,
                onSubmitted: (input) { currUser.addPantryItem(input, "dairy");},
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add),
                  hintText: "Add a new item...",
                  hintStyle: TextStyle(color: Colors.grey),
                ),))],),
            ExpansionTile(
              maintainState: true,
              title: Text("Flour",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Flour
              labels: flourDefault + currUser.prefs.flourCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> flour) => currUser.savePref(flour, "flour"),
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))
            ],),
            ExpansionTile(
              maintainState: true,
              title: Text("Fruit",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Fruit
              labels: fruitDefault + currUser.prefs.fruitCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> fruit) => currUser.savePref(fruit, "fruit"),
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))],),
            ExpansionTile(
              maintainState: true,
              title: Text("Meat and Poultry",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Meat and Poultry
              labels: meatDefault + currUser.prefs.meatCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> meat) => currUser.savePref(meat, "meat"),
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))],),
            ExpansionTile(
              maintainState: true,
              title: Text("Herbs and Spices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup(//Herbs and Spices
              labels: herbsDefault + currUser.prefs.herbsCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> herbs) => currUser.savePref(herbs, "herbs"),
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))],),
            ExpansionTile(
              maintainState: true,
              title: Text("Nut and Seeds",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Nut and Seeds
              labels: nutsDefault + currUser.prefs.nutsCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> nuts) => currUser.savePref(nuts, "nuts"),
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))],),
            ExpansionTile(
              maintainState: true,
              title: Text("Seafood",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup( //Seafood
              labels: seafoodDefault + currUser.prefs.seafoodCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> seafood) => currUser.savePref(seafood, "seafood"),
            ),
              Card(
                child: TextField(
                  controller: addController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    hintText: "Add a new item...",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),))],),
            ExpansionTile(
              maintainState: true,
              title: Text("Vegetables",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            children: <Widget> [CheckboxGroup(//Vegetables
              labels: vegetDefault + currUser.prefs.vegetCustom,
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> veget) => currUser.savePref(veget, "veget"),
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))],),
            ]));
}