// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/API%20Parsing/RecipeElement.dart';
import 'package:tastez/Middleware/Pages/Favorites.dart';
import 'package:tastez/Middleware/Pages/ShoppingListElement.dart';
import 'package:tastez/Middleware/Pages/missing.ingredients.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/user.dart';
import 'suggestions.dart';
import 'favorites.dart';
import 'winePairing.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));
// String recipeToJson(Recipe data) => json.encode(data.toJson());

/*---------Attempt to create a Recipe UI----------*/

Widget recipePage(User currUser, RecipeElement recipe) {
  return RecipePage(user: currUser, recipe: recipe);
}

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key key,
    @required this.user,
    @required this.recipe,
     this.tag
  }):super(key:key);

  final User user;
  final RecipeElement recipe;
  final String tag;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {

    /*----------Recipe Information Widget----------*/
    Widget collapseInfo = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Column(
            /*added list tiles for each individual Section (cook time,
                calories, servings, etc) Copy and paste a list Tile if you need
                more sections*/
            children: <Widget>[
              // ListTile( // Cook Time Section
              //   //leading: Text("Approximate Cook Time: ", style: TextStyle(fontSize: 16)),
              //   leading: Row(
              //     children: [
              //       SizedBox(child: Icon(Icons.access_time_rounded)),
              //       Text("${convertMinutesToHoursRecipePage(widget.recipe.readyInMinutes)}", style: TextStyle(fontSize: 16)),
              //     ],
              //   ),
              //   trailing: Text("${convertMinutesToHoursRecipePage(widget.recipe.readyInMinutes)}", style: TextStyle(fontSize: 16)),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(child: Icon(Icons.access_time_rounded)),
                  // Text("${convertMinutesToHoursRecipePage(widget.recipe.readyInMinutes)}", style: TextStyle(fontSize: 16)),
                  cookTime(widget.recipe),
                  //Text(widget.recipe.spoonacularScore.toString()),
                  score(widget.recipe),
                  servings(widget.recipe),
                  // SizedBox(child: Icon(Icons.star_border_rounded)),
                  // Text("${widget.recipe.spoonacularScore.toInt().toString()} / 100", style: TextStyle(fontSize: 16)),

                  // SizedBox(child: Icon(Icons.room_service_outlined)),
                  // Text("${widget.recipe.servings.toString()}", style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // alignment: WrapAlignment.spaceAround,
                // spacing: 40,
                // runSpacing: 5,
                children: [
                  if(widget.recipe.glutenFree) Image.asset('assets/Intolerences/glutenfree.png', height: 40, width: 40,),
                  if(widget.recipe.dairyFree) Image.asset('assets/Intolerences/dairyfree.png', height: 40, width: 40,),
                  if(widget.recipe.sustainable) Image.asset('assets/Intolerences/sustainable.png', height: 40, width: 40,),
                  if(widget.recipe.vegan) Image.asset('assets/Intolerences/vegan.png', height: 40, width: 40,),
                  if(widget.recipe.vegetarian) Image.asset('assets/Intolerences/vegetarian.png', height: 40, width: 40,),
                  // widget.recipe.glutenFree ? Image.asset('assets/Intolerences/glutenfree.png', height: 40, width: 40,) : SizedBox.shrink(),
                  // widget.recipe.dairyFree ? Image.asset('assets/Intolerences/dairyfree.png', height: 40, width: 40,) : SizedBox.shrink(),
                  // widget.recipe.sustainable ? Image.asset('assets/Intolerences/sustainable.png', height: 40, width: 40,) : SizedBox.shrink(),
                  // widget.recipe.vegan ? Image.asset('assets/Intolerences/vegan.png', height: 40, width: 40,) : SizedBox.shrink(),
                  // widget.recipe.vegetarian ? Image.asset('assets/Intolerences/vegetarian.png', height: 40, width: 40,) : SizedBox.shrink(),
                  // Image.asset('assets/Intolerences/glutenfree.png', height: 40, width: 40,),
                  // Image.asset('assets/Intolerences/dairyfree.png', height: 40, width: 40,),
                  // Image.asset('assets/Intolerences/sustainable.png', height: 40, width: 40,),
                  // Image.asset('assets/Intolerences/vegan.png', height: 40, width: 40,),
                  // Image.asset('assets/Intolerences/vegetarian.png', height: 40, width: 40,),
                ],
              ),
              // Image.asset('assets/Intolerences/glutenfree.png', height: 35, width: 35,),
              // Text("Gluten Free: ${widget.recipe.glutenFree}"),
              // Text("Dairy Free: ${widget.recipe.dairyFree}"),
              // Text("Sustainable: ${widget.recipe.sustainable}"),
              // Text("Vegan: ${widget.recipe.vegan}"),
              // Text("Vegetarian: ${widget.recipe.vegetarian}"),
            ],
          ),
        ],
      ),
    );

    /*----------Recipe Ingredients Widget----------*/
    Widget collapseIngredients = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          //Expansion Tile starts here
          ExpansionTile(
            textColor: Colors.orange,
            iconColor: Colors.orange,
            //Title for the expansion Tile
            title: Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              ingredientPage(widget.recipe),
            ],
          ),
        ],
      ),
    );

    /*----------Recipe Directions Widget----------*/
    Widget collapseDirections = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          //Expansion Tile starts here
          ExpansionTile(
            textColor: Colors.orange,
            iconColor: Colors.orange,
            //Title for the expansion title
            title: Text(
              'Instructions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              retInstructionText(widget.recipe),
            ],
          ),
        ],
      ),
    );

    /*----------Recipe Wine Pairing Widget----------*/
    Widget collapseWinePairing = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          //Expansion Tile starts here
          ExpansionTile(
            textColor: Colors.orange,
            iconColor: Colors.orange,
            //Title for Expansion Tile
            title: Text(
              'Wine Pairing',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              /*Drop down information is in a list tile format with only text*/
              winePairingCall(widget.recipe),
              Text("Recipe id: ${widget.recipe.id.toString()}"),
              // Text("spoonscore: ${widget.recipe.spoonacularScore.toString()}"),
              // widget.recipe.winePairing == null ?
              // Text("wine pairing is null") :
              // Text("Winepairing: ${widget.recipe.winePairing.pairedWines.toString()}"),
              // Text("Extended Ingredients: ${widget.recipe.extendedIngredients[0].originalName}"),
              // Text("cooking minutes: ${widget.recipe.cookingMinutes}"),
              // Text(widget.recipe.analyzedInstructions[0].steps[0].step),
              // Text("pairingText : ${widget.recipe.winePairing.pairingText}"),
            ],
          ),
        ],
      ),
    );

    /*----------Credit to Spoonacular----------*/
    /*Giving credit to Spoonacular for the recipes*/
    Widget creditSpoonacular = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                //TastEZ in a title format
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'TastEZ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                //Disclaimer that we don't own the recipes
                Text(
                  "Recipes provided by Spoonacular. \n"
                      "TastEZ does not claim ownership of Recipes. ",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ], // children
      ),
    );

    /*----------MaterialApp----------*/
    /*Builds the GUI, first displaying the page's Title then Image.
    At the bottom of the MaterialApp, each widget is listed in the order that
    will be displayed.*/

    // print("${widget.recipe.image.toString()} check to see if image.tostring is null");
    return Scaffold(

      //Top bar of the page (Title and color)
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: subAccentColor,),
          onPressed: () => Navigator.pop(context),
        ),
        title: RichText(
          textScaleFactor: 1.3,
          text: TextSpan(children: [
          TextSpan(text: widget.recipe.title),
        ],),),
        // Text(),
        backgroundColor: Colors.orange,
      ),
      //Building Body of app page
      body: ListView(
        children: [
          (widget.recipe.image.toString() != "" &&
              widget.recipe.image.toString() != "null") ?
          Image.network(widget.recipe.image.toString(),
            width: 600,
            height: 240,
            fit: BoxFit.cover,) :
          Card(child:
          ListTile(leading: SizedBox(
              height: 40, child: Image.asset('assets/TastEZ_logo.png')),
            title: Text("No Image Provided"),
          )),

          //Image of Recipe
          //Individual Widgets in order displayed
          collapseInfo,
          collapseIngredients,
          collapseDirections,
          collapseWinePairing,
          //infoSection,
          creditSpoonacular,
        ],
      ),

      //this is for when the user wants to favorite the recipe within the recipe page
      //currently it doesnt update the previous page.
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {
          setState(() {
            int indexOfFavoritedItem = inFavoriteList(
                widget.user.favorites, widget.recipe.title.toString());
            if (indexOfFavoritedItem !=
                -1) { //if item is in the favorite list,
              if (widget.user.favorites[indexOfFavoritedItem]
                  .isFavorite) { //check if the item is favorited
                widget.user.favorites[indexOfFavoritedItem].isFavorite =
                false; //then unfavorite it
                widget.user.favorites.removeAt(
                    indexOfFavoritedItem); //then remove the item from the favorites array
              } else {
                //nothing should really happen here
                print('testing to see if something happens here');
              }
            } else { //since item is not in the favorites list, add it to the favorites list
              widget.user.favorites.add(Favorites(recipe: widget.recipe,
                  isFavorite: true)); //then set it to be favorited
            }
          });
        },
        child: (widget.user.favorites.length != null) ?
        ((inFavoriteList(
            widget.user.favorites, widget.recipe.title.toString())) != -1
            ? Icon(Icons.favorite_rounded, color: favoriteIconColor,)
            : Icon(Icons.favorite_border_rounded, color: favoriteIconColor)) :
        Icon(Icons.favorite_border_rounded, color: favoriteIconColor),
      ),

    );
  } // Widget Build
}
Widget printDebug(){
  print("this is a debug call");
}

Widget retInstructionText(RecipeElement recipe){
  if(recipe.analyzedInstructions != null){
    if(recipe.analyzedInstructions.isNotEmpty){
      if(recipe.analyzedInstructions[0].steps.length > 0){
        return SizedBox(
          // height: MediaQuery.of(context).size.height - 500,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipe.analyzedInstructions[0].steps.length,
            itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListTile(
                    title: Text(
                        "${recipe.analyzedInstructions[0].steps[index].number}. ${recipe.analyzedInstructions[0].steps[index].step}"
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }else{
        if(recipe.instructions != ""){
          return Card(
            child: ListTile(
              title: Text(
                recipe.analyzedInstructions.length > 1 ? recipe.analyzedInstructions.toString() : recipe.instructions.replaceAll(". ", "\n\n"), //widget.recipe.instructions.replaceAll(". ", "\n\n"), //added this to make it look neater
                style: TextStyle(
                  fontSize: 16.0,
                ),
                softWrap: true,
              ),
            ),
          );
        } else {
          return Text("No instruction or analyzed instructions provided");
        }
      }
    } else {
      if(recipe.instructions != null){
        if(recipe.instructions.isNotEmpty){
          return Text(
            recipe.instructions.replaceAll(". ", ".\n\n"), //widget.recipe.instructions.replaceAll(". ", "\n\n"), //added this to make it look neater
            style: TextStyle(
              fontSize: 16.0,
            ),
            softWrap: true,
          );
        } else {
          return Text("No instruction or analyzed instructions provided");
        }
      }
    }
  }else{
    if(recipe.instructions != null){
      if(recipe.instructions.isNotEmpty){
        return Text(
          recipe.instructions.replaceAll(". ", ".\n\n"), //widget.recipe.instructions.replaceAll(". ", "\n\n"), //added this to make it look neater
          style: TextStyle(
            fontSize: 16.0,
          ),
          softWrap: true,
        );
      } else {
        return Text("No instruction or analyzed instructions provided");
      }
    }
  }


}

Widget ingredientPage(RecipeElement recipe){
  if(recipe.extendedIngredients != null){
    if(recipe.extendedIngredients.isNotEmpty && recipe.extendedIngredients.length > 0){
      return SizedBox(
        // height: MediaQuery.of(context).size.height - 500,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recipe.extendedIngredients.length,
          itemBuilder: (context, index){

            return Card(child: ListTile(
              title: Row(
                children: [
                  //recipe.extendedIngredients[index].
                  SizedBox(width: 90,child: Text("${recipe.extendedIngredients[index].measures.us.amount} ${recipe.extendedIngredients[index].measures.us.unitShort}")),
                  SizedBox(width: 170,child: Text("${recipe.extendedIngredients[index].name}", softWrap: true,)),
                ],),
              trailing: IconButton(
                icon: Icon(Icons.add_circle_outline_rounded, color: Colors.orangeAccent, ),
                onPressed: (){

                  defaultUser.shopping.add(ShoppingListElement(ingredient: recipe.extendedIngredients[index].original, crossedOff: false));
                },
              ),
            ));
          },
        ),
      );
    }else{
      return Text("No ingredients provided");
    }
  }else{
    return Text("No ingredients provided");
  }

}

Widget cookTime(RecipeElement recipe){
  // ignore: deprecated_member_use
  return FlatButton(
    disabledTextColor: Colors.black,
    child: Row(
      children: [
        SizedBox(child: Icon(Icons.access_time_rounded)),
        Text("  ${convertMinutesToHoursRecipePage(recipe.readyInMinutes)}", style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}

Widget score(RecipeElement recipe){

  return RatingBar.builder(
      itemSize: 20,
      minRating: 0,
      maxRating: 100,
      initialRating: recipe.spoonacularScore/20,
      itemCount: 5,
      unratedColor: Colors.orange.withAlpha(100),
      allowHalfRating: true,
      itemBuilder: (context, _){
        return Icon(Icons.star, color: Colors.orange,);
      },
      onRatingUpdate: (rating){print(rating);},
      updateOnDrag: false,
    ignoreGestures: true,

  );
}

Widget servings(RecipeElement recipe){
  return FlatButton(
    color: Colors.greenAccent,
    disabledTextColor: Colors.black,
    child: Row(
      children: [
        SizedBox(child: Icon(Icons.room_service_outlined)),
        Text("  ${recipe.servings.toString()}", style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}