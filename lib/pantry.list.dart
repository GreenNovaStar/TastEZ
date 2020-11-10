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

//TODO: implement CheckboxGroup's "checked" member to autofill checkboxes upon tab change and return

class Pantry {
  List<String> dairy;
  //List<String> flour;
  List<String> fruit;
  List<String> meat;
  List<String> herbs;
  List<String> nuts;
  List<String> seafood;
  List<String> veget;

  Pantry(
      {this.dairy,
     //   this.flour,
        this.fruit,
        this.meat,
        this.herbs,
        this.nuts,
        this.seafood,
        this.veget});

  Pantry.fromJson(Map<String, dynamic> json) {
    dairy = json['dairy'].cast<String>();
   // flour = json['flour'].cast<String>();
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
    //data['flour'] = this.flour;
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
  "Egg",
  "Half and Half",
  "Sour Cream",
  "Yogurt",
];/*
List<String> flourDefault = [
  "Cake Flour",
  "Chickpea Flour",
  "Cornmeal",
  "Cornstarch",
  "Graham Flour",
  "Pastry Flour",
  "Rice Flour",
  "Self-rising Flour",
  "Tapoica Starch",
  "Whole Wheat Flour",
  "Flour",
];*/
List<String> fruitDefault = [
  "Apple",
  "Avocado",
  "Banana",
  "Blackberry",
  "Blueberry",
  "Cherry",
  "Coconut",
  "Cranberry",
  "Date",
  "Fig",
  "Grape",
  "Grapefruit",
  "Kiwi",
  "Lemon",
  "Lime",
  "Mango",
  "Nectarine",
  "Olive",
  "Orange",
  "Papaya",
  "Passion Fruit",
  "Peach",
  "Pear",
  "Persimmon",
  "Pineapple",
  "Plantain",
  "Plum",
  "Pomegranate",
  "Prickly Pear",
  "Raisin",
  "Raspberry",
  "Star Fruit",
  "Strawberry",
  "Tamarind",
  "Tangerine",
  "Watermelon",
];
List<String> meatDefault = [
  "Bacon",
  "Beef",
  "Bison",
  "Chicken",
  "Duck",
  "Goat",
  "Ham",
  "Kidney",
  "Lamb",
  "Liver",
  "Mutton",
  "Pastrami",
  "Pepperoni",
  "Pork",
  "Prosciutto",
  "Salami",
  "Sausage",
  "Turkey",
  "Veal",
  "Venison",
];
List<String> herbsDefault = [
  "Allspice",
  "Basil",
  "Bay Leaf",
  "Caraway",
  "Cardamon",
  "Celery Seed",
  "Chili Powder",
  "Cilantro",
  "Cinnamon",
  "Coriander",
  "Cumin",
  "Dill",
  "Fennel",
  "Garlic",
  "Garlic Powder",
  "Ginger",
  "Green Onion",
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
  "Sage",
  "Star Anise",
  "Thyme",
  "Turmeric",
  "Vanilla",
  "Wasabi",
];
List<String> nutsDefault = [
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
  "Walnut",
];
List<String> seafoodDefault = [
  "Catfish",
  "Caviar",
  "Cod",
  "Crab",
  "Eel",
  "Frog",
  "Octopus",
  "Salmon",
  "Scallop",
  "Shrimp",
  "Squid",
  "Trout",
  "Tuna",
];
List<String> vegetDefault = [
  "Acorn Squash",
  "Artichoke",
  "Arugula",
  "Asparagus",
  "Bean Sprout",
  "Beet",
  "Bell Pepper",
  "Butternut Squash",
  "Carrot",
  "Cassava",
  "Celery",
  "Cucumber",
  "Eggplant",
  "Fennel",
  "Garlic",
  "Green Bean",
  "Green Onion",
  "Green Pepper",
  "Habanero",
  "Horseradish",
  "Kale",
  "Kidney Bean",
  "Leek",
  "Lemongrass",
  "Lentil",
  "Lettuce",
  "Lima Bean",
  "Mung Bean",
  "Mushroom",
  "Nettle",
  "Okra",
  "Onion",
  "Pea",
  "Pepperoncini",
  "Potato",
  "Pumpkin",
  "Radish",
  "Rhubarb",
  "Romaine Lettuce",
  "Rutabaga",
  "Shallot",
  "Spinach",
  "Squash",
  "Sweet Potato",
  "Tomato",
  "Turnip",
  "Water Chestnut",
  "Yam",
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
              checked: [],
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
            /*ExpansionTile(
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
              checked: [],
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    onSubmitted: (input) { currUser.addPantryItem(input, "flour");},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))
            ],),*/
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
              checked: [],
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    onSubmitted: (input) { currUser.addPantryItem(input, "fruit");},
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
              checked: [],
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    onSubmitted: (input) { currUser.addPantryItem(input, "meat");},
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
              checked: [],
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    onSubmitted: (input) { currUser.addPantryItem(input, "herbs");},
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
              checked: [],
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    onSubmitted: (input) { currUser.addPantryItem(input, "nuts");},

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
              checked: [],
            ),
              Card(
                child: TextField(
                  controller: addController,
                  onSubmitted: (input) { currUser.addPantryItem(input, "seafood");},
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
              checked: [],
            ),
              Card(
                  child: TextField(
                    controller: addController,
                    onSubmitted: (input) { currUser.addPantryItem(input, "veget");},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      hintText: "Add a new item...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),))],),
            ]));
}