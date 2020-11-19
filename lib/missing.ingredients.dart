import 'package:flutter/material.dart';
import 'home.dart';
import 'main.dart';
import 'user.dart';
import 'recipe.dart';
import 'package:flutter/cupertino.dart';

class MissingIngredient{
  //RecipeElement recipe;
  String ingredient;
  bool   hasInPantry;
  MissingIngredient({this.ingredient, this.hasInPantry});
}

class MissingTemplate extends StatefulWidget {
  const MissingTemplate({
    Key key,
    @required this.isMissing,
  }) : super(key: key);

  // final List<bool> isMissing;
  final List<MissingIngredient> isMissing;

  @override
  _MissingTemplateState createState() => _MissingTemplateState();
}

class _MissingTemplateState extends State<MissingTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(
      itemCount: widget.isMissing.length, //5, //automatically adjusts based on the widget array
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            child: InkWell(
              onTap: () {
                //print("card $index tapped");
                setState(() {
                  if(widget.isMissing[index].hasInPantry){
                    // print("ingredient $index is not missing anymore");
                    // widget.isMissing[index] = false;
                    //print("${widget.isMissing[index].ingredient} sent to shopping cart");
                    //send item to shopping cart
                  }else{
                    //print("${widget.isMissing[index].ingredient} is now missing");
                    widget.isMissing[index].hasInPantry = true;
                  }
                });
                // setState(() {widget.isMissing[index] ? widget.isMissing[index] = false : widget.isMissing[index] = true;});
              },

              onLongPress: (){
                setState(() {
                  if(widget.isMissing[index].hasInPantry){
                    //print("ingredient ${widget.isMissing[index].ingredient} is not missing anymore");
                    widget.isMissing[index].hasInPantry = false;
                    //print("Ingredient sent to shopping cart");
                  }
                  //print("${widget.isMissing[index].ingredient} was long pressed");
                });

              },

              child: ListTile(
                // title: (index % 3 == 0) ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
                //title: widget.isMissing[index] ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
                title: widget.isMissing[index].hasInPantry ? Text("${widget.isMissing[index].ingredient} missing", style: TextStyle(color: Colors.red[900])) : Text("${widget.isMissing[index].ingredient}", style: TextStyle(color: Colors.black)),
                //leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
                // trailing: (index % 3 == 0) ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
                trailing: widget.isMissing[index].hasInPantry ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
              ),
            ),
          ),
        );
      },
    ),
      //),
    );
  }
}

Widget missingIngredient(User currUser, RecipeElement recipe){
  print("went into missingIngredient(user, recipeselement)");
  List<MissingIngredient> isMissing = [];
  for (int i = 0; i < recipe.extendedIngredients.length; i++) {
    switch (recipe.extendedIngredients.elementAt(i).aisle) {
      case "Bakery/Bread": case "Baking": case "Bread": { //bakedGoods
      if (!(currUser.pantry.bakedGoods.contains(recipe.extendedIngredients.elementAt(i).name)))
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Health Foods": case "Gourmet": case "Ethnic Foods": { //specialty
        if (!(currUser.pantry.specialty.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Spices and Seasonings": case "Nut butters, Jams, and Honey": case "Oil, Vinegar, Salad Dressing": { //toppings
        if (!(currUser.pantry.toppings.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Canned and Jarred": { //cannedGoods
          if (!(currUser.pantry.cannedGoods.contains(recipe.extendedIngredients.elementAt(i).name)))
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        } break;
        case "Pasta and Rice": case "Cereal": case "Nuts" : { //grainsNuts
        if (!(currUser.pantry.grainsNuts.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Refrigerated" : {  //refrigerator
          if (!(currUser.pantry.refrigerator.contains(recipe.extendedIngredients.elementAt(i).name)))
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        } break;
        case "Frozen" : { //freezer
          if (!(currUser.pantry.freezer.contains(recipe.extendedIngredients.elementAt(i).name)))
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        } break;
        case "Savory Snacks" : case "Sweet Snacks" : { //snacks
        if (!(currUser.pantry.snacks.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Produce" : case "Dried Fruits" : { //produce
        if (!(currUser.pantry.produce.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Milk, Eggs, Other Dairy": case "Cheese": { //dairy
        if (!(currUser.pantry.dairy.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Meat": case "Seafood": { //meats
        if (!(currUser.pantry.meats.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Alcoholic Beverages": case "Beverages": { //drinks
        if (!(currUser.pantry.drinks.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
        case "Not in Grocery Story/Homemade": case "Online" : case "Grilling Supplies": default: { //misc
        if (!(currUser.pantry.misc.contains(recipe.extendedIngredients.elementAt(i).name)))
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      } break;
    }
  }
  return MissingTemplate(isMissing: isMissing);
}

/*
case "Bakery/Bread": case "Baking": case "Bread": { //bakedGoods
        if (!(currUser.pantry.bakedGoods.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Health Foods": case "Gourmet": case "Ethnic Foods": { //specialty
        if (!(currUser.pantry.specialty.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Spices and Seasonings": case "Nut butters, Jams, and Honey": case "Oil, Vinegar, Salad Dressing": { //toppings
        if (!(currUser.pantry.toppings.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Canned and Jarred": { //cannedGoods
        if (!(currUser.pantry.cannedGoods.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Pasta and Rice": case "Cereal": case "Nuts" : { //grainsNuts
        if (!(currUser.pantry.grainsNuts.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Refrigerated" : {  //refrigerator
        if (!(currUser.pantry.refrigerator.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Frozen" : { //freezer
        if (!(currUser.pantry.freezer.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Savory Snacks" : case "Sweet Snacks" : { //snacks
        if (!(currUser.pantry.snacks.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Produce" : case "Dried Fruits" : { //produce
        if (!(currUser.pantry.produce.contains(recipe.extendedIngredients.elementAt(i).name))){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
        }
      } break;
      case "Milk, Eggs, Other Dairy": case "Cheese": { //dairy
      if (!(currUser.pantry.dairy.contains(recipe.extendedIngredients.elementAt(i).name))){
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      }else{
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
      }
      } break;
      case "Meat": case "Seafood": { //meats
      if (!(currUser.pantry.meats.contains(recipe.extendedIngredients.elementAt(i).name))){
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      }else{
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
      }
    } break;
      case "Alcoholic Beverages": case "Beverages": { //drinks
      if (!(currUser.pantry.drinks.contains(recipe.extendedIngredients.elementAt(i).name))){
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
      }else{
        isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
      }
    } break;
      case "Not in Grocery Story/Homemade": case "Online" : case "Grilling Supplies": default: { //misc
          if (!(currUser.pantry.misc.contains(recipe.extendedIngredients.elementAt(i).name))){
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
          }else{
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: true));
          }
      } break;
    }
 */ //this is all the cases with the true statement

