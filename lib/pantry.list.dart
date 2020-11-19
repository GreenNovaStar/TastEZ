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

/*------list of all controller for each section-----*/
TextEditingController bakedController = new TextEditingController();
TextEditingController specialtyController = new TextEditingController();
TextEditingController toppingsController = new TextEditingController();
TextEditingController cannedController = new TextEditingController();
TextEditingController nutsController = new TextEditingController();
TextEditingController fridgeController = new TextEditingController();
TextEditingController freezerController = new TextEditingController();
TextEditingController snacksController = new TextEditingController();
TextEditingController produceController = new TextEditingController();
TextEditingController miscController = new TextEditingController();
TextEditingController dairyController = new TextEditingController();
TextEditingController meatController = new TextEditingController();
TextEditingController drinkController = new TextEditingController();

FocusNode myFocusNode = FocusNode();

/*------list of all focusNodes for each section-----*/
FocusNode bakedFocusNode = new FocusNode();
FocusNode specialtyFocusNode = new FocusNode();
FocusNode toppingsFocusNode = new FocusNode();
FocusNode cannedFocusNode = new FocusNode();
FocusNode nutsFocusNode = new FocusNode();
FocusNode fridgeFocusNode = new FocusNode();
FocusNode freezerFocusNode = new FocusNode();
FocusNode snacksFocusNode = new FocusNode();
FocusNode produceFocusNode = new FocusNode();
FocusNode miscFocusNode = new FocusNode();
FocusNode dairyFocusNode = new FocusNode();
FocusNode meatFocusNode = new FocusNode();
FocusNode drinkFocusNode = new FocusNode();

Widget pantry(User currUser) {
    return ExtractedTiles(currUser: currUser);
}

class ExtractedTiles extends StatefulWidget {
  const ExtractedTiles({
    Key key,
    @required this.currUser,
  }) : super(key: key);
  final User currUser;



  @override
  _ExtractedTilesState createState() => _ExtractedTilesState();
}

class _ExtractedTilesState extends State<ExtractedTiles> {
  @override
  Widget build(BuildContext context) {
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
                labels: widget.currUser.pantry.bakedGoods,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> bakedGoods) => widget.currUser.addPantryItem(bakedGoods, "bakedGoods"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "bakedGoods", controller: bakedController, focusNode: bakedFocusNode),
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
                labels: widget.currUser.pantry.specialty,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> specialty) => widget.currUser.addPantryItem(specialty, "specialty"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "specialty", controller: specialtyController, focusNode: specialtyFocusNode),
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
                labels: widget.currUser.pantry.toppings,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> toppings) => widget.currUser.addPantryItem(toppings, "toppings"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "toppings", controller: toppingsController, focusNode: toppingsFocusNode),
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
                labels: widget.currUser.pantry.cannedGoods,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> cannedGoods) => widget.currUser.addPantryItem(cannedGoods, "cannedGoods"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "cannedGoods", controller: cannedController, focusNode: cannedFocusNode),
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
                labels: widget.currUser.pantry.grainsNuts,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> grainsNuts) => widget.currUser.addPantryItem(grainsNuts, "grainsNuts"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "grainsNuts", controller: nutsController, focusNode: nutsFocusNode),
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
                labels: widget.currUser.pantry.refrigerator,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> refrigerator) => widget.currUser.addPantryItem(refrigerator, "refrigerator"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "refrigerator", controller: fridgeController, focusNode: fridgeFocusNode),
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
                labels: widget.currUser.pantry.freezer,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> freezer) => widget.currUser.addPantryItem(freezer, "freezer"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "freezer", controller: freezerController, focusNode: freezerFocusNode),
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
                labels: widget.currUser.pantry.snacks,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> snacks) => widget.currUser.addPantryItem(snacks, "snacks"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "snacks", controller: snacksController, focusNode: snacksFocusNode),
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
                labels: widget.currUser.pantry.produce,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> produce) => widget.currUser.addPantryItem(produce, "produce"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "produce", controller: produceController, focusNode: produceFocusNode),
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
                labels: widget.currUser.pantry.misc,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> misc) => widget.currUser.addPantryItem(misc, "misc"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "misc", controller: miscController, focusNode: miscFocusNode),
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
                labels: widget.currUser.pantry.dairy,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> dairy) => widget.currUser.addPantryItem(dairy, "dairy"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "dairy", controller: dairyController, focusNode: dairyFocusNode),
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
                labels: widget.currUser.pantry.meats,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> meats) => widget.currUser.addPantryItem(meats, "meats"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "meats", controller: meatController, focusNode: meatFocusNode),
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
                labels: widget.currUser.pantry.drinks,
                onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                onSelected: (List<String> drinks) => widget.currUser.addPantryItem(drinks, "drinks"),
              ),
                AddTextFieldTemplate(currUser: widget.currUser, category: "drinks", controller: drinkController, focusNode: drinkFocusNode),
              ],),//drinks
          ]));
  }
}

class AddTextFieldTemplate extends StatefulWidget {
  const AddTextFieldTemplate({
    Key key,
    @required this.currUser,
    @required this.category,
    @required this.controller,
    @required this.focusNode,
  }) : super(key: key);

  final User currUser;
  final String category;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  _AddTextFieldTemplateState createState() => _AddTextFieldTemplateState();
}

class _AddTextFieldTemplateState extends State<AddTextFieldTemplate> {

  @override
  Widget build(BuildContext context) {
    var ancestralState = context.findAncestorStateOfType<_ExtractedTilesState>(); //call the previous widget of type _ExtractedTilesState

    return Card(
        child: TextField(
          controller: widget.controller,
          showCursor: true,
          focusNode: widget.focusNode,
          onTap: () => widget.focusNode.requestFocus(),
          /* dont need as it does a second call after onEditingComplete is called
          onSubmitted: (input) {
            setState((){
              List<String> item = [widget.controller.text];
              widget.currUser.addPantryItem(item, widget.category);
              print(item);
              widget.controller.clear();
              FocusScope.of(context).unfocus();
              ancestralState.setState(() {});
            });
          },*/
          onEditingComplete: (){ //this is only called when  the user presses the *done* on the keyboard
            setState((){
              List<String> item = [widget.controller.text];
              print(widget.controller.text);
              print(item);
              widget.currUser.addPantryItem(item, widget.category);
              widget.controller.clear();
              FocusScope.of(context).unfocus();
              ancestralState.setState(() {});
            });
          },
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: (){
                setState((){
                  List<String> item = [widget.controller.text];
                  widget.currUser.addPantryItem(item, widget.category);
                  print("add button pressed, added ${widget.controller.text}");
                  widget.controller.clear();
                  FocusScope.of(context).unfocus();
                  ancestralState.setState(() {});
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