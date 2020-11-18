import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:html/parser.dart';

//TODO: implement CheckboxGroup's "checked" member to autofill checkboxes upon tab change and return

class Pantry {
  List<String> bakedGoods; //Bakery/Bread, Baking, Bread
  List<String> specialty; //Health Foods, Gourmet, Ethnic Foods
  List<String> toppings; //Spices and Seasonings, "Nut butters, Jams, and Honey," "Oil, Vinegar, Salad Dressing"
  List<String> cannedGoods; //Canned and Jarred
  List<String> grainsNuts; //Pasta and Rice, Cereal, Nuts
  List<String> refrigerator; //Refrigerated
  List<String> freezer; //Frozen
  List<String> snacks; //Savory Snacks, Sweet Snacks
  List<String> produce; //Produce, Dried Fruits
  List<String> misc; //Not in Grocery Story/Homemade, null, Online, Grilling Supplies
  List<String> dairy; // "Milk, Eggs, Other Dairy," Cheese
  List<String> meats; // Meat, Seafood
  List<String> drinks; //Alcoholic Beverages, Beverages

  Pantry(
      {this.bakedGoods,
      this.specialty,
        this.toppings,
        this.cannedGoods,
        this.grainsNuts,
        this.refrigerator,
        this.freezer,
        this.snacks,
        this.produce,
        this.misc,
        this.dairy,
        this.meats,
      this.drinks});
  Pantry.fromJson(Map<String, dynamic> json) {
    bakedGoods = json['bakedGoods'].cast<String>();
    specialty = json['specialty'].cast<String>();
    toppings = json['toppings'].cast<String>();
    cannedGoods = json['cannedGoods'].cast<String>();
    grainsNuts = json['grainsNuts'].cast<String>();
    refrigerator = json['refrigerator'].cast<String>();
    freezer = json['freezer'].cast<String>();
    snacks = json['snacks'].cast<String>();
    produce = json['produce'].cast<String>();
    misc = json['misc'].cast<String>();
    dairy = json['dairy'].cast<String>();
    meats = json['meats'].cast<String>();
    drinks = json['drinks'].cast<String>();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['bakedGoods'] = this.bakedGoods;
    data['specialty'] = this.specialty;
    data['toppings'] = this.toppings;
    data['cannedGoods'] = this.cannedGoods;
    data['grainsNuts'] = this.grainsNuts;
    data['refrigerator'] = this.refrigerator;
    data['freezer'] = this.freezer;
    data['snacks'] = this.snacks;
    data['produce'] = this.produce;
    data['misc'] = this.misc;
    data['dairy'] = this.dairy;
    data['meats'] = this.meats;
    data['drinks'] = this.drinks;
    return data;
  }
}

TextEditingController addController = new TextEditingController();

Widget pantry(User currUser) {
    return Padding(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              maintainState: true,
              title: Text("Baked Goods",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),),
              children: <Widget>[ CheckboxGroup(
                labels: currUser.pantry.bakedGoods,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> bakedGoods) => currUser.addPantryItem(bakedGoods, "bakedGoods"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "bakedGoods"),
              ],
            ),//baked goods
            ExpansionTile(
              maintainState: true,
              title: Text("Specialty",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup( //Specialty
                labels: currUser.pantry.specialty,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> specialty) => currUser.addPantryItem(specialty, "specialty"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "specialty"),
              ],),//specialty
            ExpansionTile(
              maintainState: true,
              title: Text("Spices, Condiments, and Toppings",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup( //Meat and Poultry
                labels: currUser.pantry.toppings,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> toppings) => currUser.addPantryItem(toppings, "toppings"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "toppings"),
              ],),//toppings
            ExpansionTile(
              maintainState: true,
              title: Text("Canned Goods",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Herbs and Spices
                labels: currUser.pantry.cannedGoods,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> cannedGoods) => currUser.addPantryItem(cannedGoods, "cannedGoods"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "cannedGoods"),
              ],),//canned goods
            ExpansionTile(
              maintainState: true,
              title: Text("Nut and Grains",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup( //Nut and Seeds
                labels: currUser.pantry.grainsNuts,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> grainsNuts) => currUser.addPantryItem(grainsNuts, "grainsNuts"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "grainsNuts"),
              ],),//grains and nuts
            ExpansionTile(
              maintainState: true,
              title: Text("Refrigerated",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup( //Seafood
                labels: currUser.pantry.refrigerator,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> refrigerator) => currUser.addPantryItem(refrigerator, "refrigerator"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "refrigerator"),
              ],),//refrigerator
            ExpansionTile(
              maintainState: true,
              title: Text("Freezer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.freezer,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> freezer) => currUser.addPantryItem(freezer, "freezer"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "freezer"),
              ],),//freezer
            ExpansionTile(
              maintainState: true,
              title: Text("Snacks",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.snacks,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> snacks) => currUser.addPantryItem(snacks, "snacks"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "snacks"),
              ],),//snacks
            ExpansionTile(
              maintainState: true,
              title: Text("Produce",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.produce,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> produce) => currUser.addPantryItem(produce, "produce"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "produce"),
              ],),//produce
            ExpansionTile(
              maintainState: true,
              title: Text("Miscellaneous",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.misc,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> misc) => currUser.addPantryItem(misc, "misc"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "misc"),
              ],),//misc
            ExpansionTile(
              maintainState: true,
              title: Text("Dairy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.dairy,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> dairy) => currUser.addPantryItem(dairy, "dairy"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "dairy"),
              ],),//dairy
            ExpansionTile(
              maintainState: true,
              title: Text("Meat & Seafood",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.meats,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> meats) => currUser.addPantryItem(meats, "meats"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "meats"),
              ],),//meats
            ExpansionTile(
              maintainState: true,
              title: Text("Beverages",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              children: <Widget> [CheckboxGroup(//Vegetables
                labels: currUser.pantry.drinks,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> drinks) => currUser.addPantryItem(drinks, "drinks"),
              ),
                AddTextFieldTemplate(currUser: currUser, category: "drinks"),
              ],),//drinks
          ]));
}

class AddTextFieldTemplate extends StatefulWidget {
  const AddTextFieldTemplate({
    Key key,
    @required this.currUser,
    @required this.category,
  }) : super(key: key);

  final User currUser;
  final String category;

  @override
  _AddTextFieldTemplateState createState() => _AddTextFieldTemplateState();
}

class _AddTextFieldTemplateState extends State<AddTextFieldTemplate> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: TextField(
          controller: addController,
          onSubmitted: (input) {
            setState((){
              List<String> item = [input];
              widget.currUser.addPantryItem(item, widget.category);
              print(widget.category);
              addController.clear();
              FocusScope.of(context).unfocus();
            });
          },
          onEditingComplete: (){
            setState((){
              List<String> item = [addController.text];
              widget.currUser.addPantryItem(item, widget.category);
              addController.clear();
              FocusScope.of(context).unfocus();
            });
          },
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: (){
                setState((){
                  List<String> item = [addController.text];
                  widget.currUser.addPantryItem(item, widget.category);
                  print("add button pressed, added ${addController.text}");
                  addController.clear();
                  FocusScope.of(context).unfocus();
                });
              },
              icon: Icon(Icons.add),
            ),//Icon(Icons.add),
            hintText: "Add a new item...",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        )
    );
  }
}