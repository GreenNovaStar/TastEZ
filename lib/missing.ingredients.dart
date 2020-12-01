import 'package:flutter/material.dart';
import 'package:tastez/shop.list.dart';
import 'home.dart';
import 'main.dart';
import 'user.dart';
import 'recipe.dart';
import 'package:flutter/cupertino.dart';
import 'shop.list.dart';

class MissingIngredient{
  //RecipeElement recipe;
  String ingredient;
  bool   hasInPantry;
  bool   hasInCart;
  MissingIngredient({this.ingredient, this.hasInPantry, this.hasInCart});
}

class MissingTemplate extends StatefulWidget {
  const MissingTemplate({
    Key key,
    @required this.isMissing,
    @required this.currUser,
  }) : super(key: key);

  // final List<bool> isMissing;
  final List<MissingIngredient> isMissing;
  final User currUser;

  @override
  _MissingTemplateState createState() => _MissingTemplateState();
}

class _MissingTemplateState extends State<MissingTemplate> {
  @override
  Widget build(BuildContext context) {
    widget.currUser.shopping = sendToShoppingCart(widget.currUser.shopping, widget.isMissing);
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
                  if(!widget.isMissing[index].hasInPantry && !widget.isMissing[index].hasInCart){
                    print("im in here");
                    widget.currUser.shopping.add(ShoppingListElement(ingredient: widget.isMissing[index].ingredient, crossedOff: false));
                    widget.isMissing[index].hasInCart = true;
                  }

                });
              },

              onLongPress: (){
                setState(() {
                  if(widget.isMissing[index].hasInCart){
                    int indexToRemove = isInCartIndex(widget.currUser.shopping, widget.isMissing[index].ingredient);
                    widget.currUser.shopping.removeAt(indexToRemove);
                    // widget.currUser.shopping.remove(ShoppingListElement(ingredient: widget.isMissing[index].ingredient, crossedOff: false));
                    widget.isMissing[index].hasInCart = false;
                  }
                });

              },

              child: ListTile(
                // title: !widget.isMissing[index].hasInPantry ? Text("${widget.isMissing[index].ingredient} missing", style: TextStyle(color: Colors.red[900])) : Text("${widget.isMissing[index].ingredient}", style: TextStyle(color: Colors.black)),
                // trailing: !widget.isMissing[index].hasInPantry ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
                title: (!widget.isMissing[index].hasInPantry) ?
                          (!widget.isMissing[index].hasInCart ? Text("${widget.isMissing[index].ingredient} missing", style: TextStyle(color: Colors.red[900])) : Text("${widget.isMissing[index].ingredient}", style: TextStyle(color: Colors.red[900]))) :
                          Text("${widget.isMissing[index].ingredient}", style: TextStyle(color: Colors.black)),
                trailing:(!widget.isMissing[index].hasInPantry) ?
                          (!widget.isMissing[index].hasInCart ? Icon(Icons.error_outline_rounded, color: Colors.red[900]) :Icon(Icons.add_shopping_cart_rounded, color: Colors.red[900])) :
                          null,
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
  // List<MissingIngredient> isMissing = [];
  // for (int i = 0; i < recipe.extendedIngredients.length; i++) {
  //   switch (recipe.extendedIngredients.elementAt(i).aisle) {
  //     case "Bakery/Bread": case "Baking": case "Bread": { //bakedGoods
  //     if (!(currUser.pantry.bakedGoods.contains(recipe.extendedIngredients.elementAt(i).name)))
  //       isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Health Foods": case "Gourmet": case "Ethnic Foods": { //specialty
  //       if (!(currUser.pantry.specialty.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Spices and Seasonings": case "Nut butters, Jams, and Honey": case "Oil, Vinegar, Salad Dressing": { //toppings
  //       if (!(currUser.pantry.toppings.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Canned and Jarred": { //cannedGoods
  //         if (!(currUser.pantry.cannedGoods.contains(recipe.extendedIngredients.elementAt(i).name)))
  //           isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //       } break;
  //       case "Pasta and Rice": case "Cereal": case "Nuts" : { //grainsNuts
  //       if (!(currUser.pantry.grainsNuts.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Refrigerated" : {  //refrigerator
  //         if (!(currUser.pantry.refrigerator.contains(recipe.extendedIngredients.elementAt(i).name)))
  //           isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //       } break;
  //       case "Frozen" : { //freezer
  //         if (!(currUser.pantry.freezer.contains(recipe.extendedIngredients.elementAt(i).name)))
  //           isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //       } break;
  //       case "Savory Snacks" : case "Sweet Snacks" : { //snacks
  //       if (!(currUser.pantry.snacks.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Produce" : case "Dried Fruits" : { //produce
  //       if (!(currUser.pantry.produce.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Milk, Eggs, Other Dairy": case "Cheese": { //dairy
  //       if (!(currUser.pantry.dairy.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Meat": case "Seafood": { //meats
  //       if (!(currUser.pantry.meats.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Alcoholic Beverages": case "Beverages": { //drinks
  //       if (!(currUser.pantry.drinks.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //       case "Not in Grocery Story/Homemade": case "Online" : case "Grilling Supplies": default: { //misc
  //       if (!(currUser.pantry.misc.contains(recipe.extendedIngredients.elementAt(i).name)))
  //         isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
  //     } break;
  //   }
  // }
  List<MissingIngredient> isMissing = initialSetup(currUser, recipe);
  return MissingTemplate(isMissing: isMissing, currUser: currUser);
}

List<MissingIngredient> initialSetup(User currUser, RecipeElement recipe){
  List<MissingIngredient> isMissing = [];
  for (int i = 0; i < recipe.extendedIngredients.length; i++) {
    switch (recipe.extendedIngredients.elementAt(i).aisle) {
      case "Bakery/Bread": case "Baking": case "Bread": { //bakedGoods
      if (!(currUser.pantry.bakedGoods.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Health Foods": case "Gourmet": case "Ethnic Foods": { //specialty
      if (!(currUser.pantry.specialty.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
        //isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false));
    } break;
      case "Spices and Seasonings": case "Nut butters, Jams, and Honey": case "Oil, Vinegar, Salad Dressing": { //toppings
      if (!(currUser.pantry.toppings.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Canned and Jarred": { //cannedGoods
        if (!(currUser.pantry.cannedGoods.contains(recipe.extendedIngredients.elementAt(i).name))){
          if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
          }else{
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
          }
        }
      } break;
      case "Pasta and Rice": case "Cereal": case "Nuts" : { //grainsNuts
      if (!(currUser.pantry.grainsNuts.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Refrigerated" : {  //refrigerator
        if (!(currUser.pantry.refrigerator.contains(recipe.extendedIngredients.elementAt(i).name))){
          if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
          }else{
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
          }
        }
      } break;
      case "Frozen" : { //freezer
        if (!(currUser.pantry.freezer.contains(recipe.extendedIngredients.elementAt(i).name))){
          if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
          }else{
            isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
          }
        }
      } break;
      case "Savory Snacks" : case "Sweet Snacks" : { //snacks
      if (!(currUser.pantry.snacks.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Produce" : case "Dried Fruits" : { //produce
      if (!(currUser.pantry.produce.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Milk, Eggs, Other Dairy": case "Cheese": { //dairy
      if (!(currUser.pantry.dairy.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Meat": case "Seafood": { //meats
      if (!(currUser.pantry.meats.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Alcoholic Beverages": case "Beverages": { //drinks
      if (!(currUser.pantry.drinks.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
      case "Not in Grocery Story/Homemade": case "Online" : case "Grilling Supplies": default: { //misc
      if (!(currUser.pantry.misc.contains(recipe.extendedIngredients.elementAt(i).name))){
        if(!isInCart(currUser.shopping, recipe.extendedIngredients.elementAt(i).name)){
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: false));
        }else{
          isMissing.add(MissingIngredient(ingredient: recipe.extendedIngredients.elementAt(i).name, hasInPantry: false, hasInCart: true));
        }
      }
    } break;
    }
  }
  return isMissing;
}

List<ShoppingListElement> sendToShoppingCart(List<ShoppingListElement> shoppingList, List<MissingIngredient> missingList){
  for(int i = 0; i < missingList.length; i++){
    if(missingList[i].hasInPantry){
      if(!isInCart(shoppingList, missingList[i].ingredient)){
        print("adding ${missingList[i].ingredient} from sendToShoppingCart");
        shoppingList.add(ShoppingListElement(ingredient: missingList[i].ingredient, crossedOff: false));
      }
    }
  }
  return shoppingList;
}

bool isInCart(List<ShoppingListElement> shopping, String missingIngredient){
  for(int i = 0; i < shopping.length; i++){
    if(shopping[i].ingredient == missingIngredient) {
      return true;
    }
  }
  return false;
}
int isInCartIndex(List<ShoppingListElement> shopping, String missingIngredient){
  for(int i = 0; i < shopping.length; i++){
    if(shopping[i].ingredient == missingIngredient) {
      return i;
    }
  }
  return -1;
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

