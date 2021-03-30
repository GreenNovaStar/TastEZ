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
  }):super(key:key);

  final User user;
  final RecipeElement recipe;

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
                children: [
                  SizedBox(child: Icon(Icons.access_time_rounded)),
                  Text("${convertMinutesToHoursRecipePage(widget.recipe.readyInMinutes)}", style: TextStyle(fontSize: 16)),

                  SizedBox(child: Icon(Icons.star_border_rounded)),
                  Text("${widget.recipe.spoonacularScore.toInt().toString()} / 100", style: TextStyle(fontSize: 16)),

                  SizedBox(child: Icon(Icons.room_service_outlined)),
                  Text("${widget.recipe.servings.toString()}", style: TextStyle(fontSize: 16)),
                ],
              ),
              // ListTile(
              //   //title: (widget.recipe.calories != null) ? Text("Calories: " + widget.recipe.calories.toString()) : Text("Calories: Creator didn't define a calorie count"),
              //   // title: (widget.recipe.spoonacularScore != null) ?
              //   //   Text("Spoonacular Score: ${widget.recipe.spoonacularScore.toInt().toString()} / 100") :
              //   //   Text("Spoonacular Score: None provided"),
              //   leading: Text("Spoonacular Score: ", style: TextStyle(fontSize: 16)),
              //   trailing: (widget.recipe.spoonacularScore != null) ?
              //         Text("${widget.recipe.spoonacularScore.toInt().toString()} / 100", style: TextStyle(fontSize: 16)) :
              //         Text("None provided", style: TextStyle(fontSize: 16)),
              // ),
              // ListTile(
              //   // title: Text(
              //   //   "Servings: " + widget.recipe.servings.toString(),
              //   // ),
              //   leading: Text("Servings: ", style: TextStyle(fontSize: 16)),
              //   trailing: Text("${widget.recipe.servings.toString()}", style: TextStyle(fontSize: 16)),
              // ),
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
            //Title for the expansion Tile
            title: Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[

              /*added list tiles for each individual Section (cook time,
                calories, servings, etc) Copy and paste a list Tile if you need
                more sections*/
              //children: <Widget>[
              //usedIngredients(widget.recipe)
              // missingIngredient(widget.user, widget.recipe),
              //],
              ingredientPage(widget.recipe),
            ],
          ),
        ],
      ),
    );

    /*----------Recipe Directions Widget----------*/
    Widget collapseDirections = Container(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),

      // child: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: widget.recipe.analyzedInstructions[0].steps.length,
      //   itemBuilder: (context, index){
      //     return Text(
      //         "${widget.recipe.analyzedInstructions[0].steps[index].number}. ${widget.recipe.analyzedInstructions[0].steps[index].step}\n"
      //     );
      //   },
      // ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          //Expansion Tile starts here
          ExpansionTile(
            //Title for the expansion title
            title: Text(
              'Instructions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              //Recipe description displayed as normal text
              // Text(
              //   widget.recipe.analyzedInstructions.length > 1 ? widget.recipe
              //       .analyzedInstructions.toString() : widget.recipe
              //       .instructions.replaceAll(". ", "\n\n"),
              //   //widget.recipe.instructions.replaceAll(". ", "\n\n"), //added this to make it look neater
              //   style: TextStyle(
              //     fontSize: 16.0,
              //   ),
              //   softWrap: true,
              // ),
              retInstructionText(widget.recipe),
              // widget.recipe.analyzedInstructions[0].steps.length > 0 ?
              //   SizedBox(
              //     // height: MediaQuery.of(context).size.height - 500,
              //     child: ListView.builder(
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemCount: widget.recipe.analyzedInstructions[0].steps.length,
              //       itemBuilder: (context, index){
              //         return Text(
              //             "${widget.recipe.analyzedInstructions[0].steps[index].number}. ${widget.recipe.analyzedInstructions[0].steps[index].step}\n"
              //         );
              //       },
              //     ),
              //   ) :
              // SizedBox(
              //   child: Text("No analyzed instructions were provided"),
              //   // height: MediaQuery.of(context).size.height - 500,
              //   // child: ListView.builder(
              //   //   physics: NeverScrollableScrollPhysics(),
              //   //   shrinkWrap: true,
              //   //   itemCount: widget.recipe.analyzedInstructions[0].steps.length,
              //   //   itemBuilder: (context, index){
              //   //     return Text(
              //   //         "${widget.recipe.analyzedInstructions[0].steps[index].number}. ${widget.recipe.analyzedInstructions[0].steps[index].step}\n"
              //   //     );
              //   //   },
              //   // ),
              // ),

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
              Text("spoonscore: ${widget.recipe.spoonacularScore.toString()}"),
              widget.recipe.winePairing == null ?
              Text("wine pairing is null") :
              Text("Winepairing: ${widget.recipe.winePairing.pairedWines.toString()}"),
              Text("Extended Ingredients: ${widget.recipe.extendedIngredients[0].originalName}"),
              Text("cooking minutes: ${widget.recipe.cookingMinutes}"),
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

    print("${widget.recipe.image.toString()} check to see if image.tostring is null");
    // return MaterialApp(
    //   theme: ThemeData(accentColor: themeColor),
    //   title: 'Recipe Page',
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     //Top bar of the page (Title and color)
    //     appBar: AppBar(
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back),
    //         onPressed: () => Navigator.pop(context),
    //       ),
    //       title: Text(widget.recipe.title),
    //       backgroundColor: Colors.orange,
    //     ),
    //     //Building Body of app page
    //     body: ListView(
    //       children: [
    //         (widget.recipe.image.toString() != "" &&
    //             widget.recipe.image.toString() != "null") ?
    //         Image.network(widget.recipe.image.toString(),
    //           width: 600,
    //           height: 240,
    //           fit: BoxFit.cover,) :
    //         Card(child:
    //         ListTile(leading: SizedBox(
    //             height: 40, child: Image.asset('assets/TastEZ_logo.png')),
    //           title: Text("No Image Provided"),
    //         )),
    //         //Image of Recipe
    //         //Individual Widgets in order displayed
    //         collapseInfo,
    //         collapseIngredients,
    //         collapseDirections,
    //         collapseWinePairing,
    //         //infoSection,
    //         creditSpoonacular,
    //       ],
    //     ),
    //
    //     //this is for when the user wants to favorite the recipe within the recipe page
    //     //currently it doesnt update the previous page.
    //     floatingActionButton: FloatingActionButton(
    //       backgroundColor: themeColor,
    //       onPressed: () {
    //         setState(() {
    //           int indexOfFavoritedItem = inFavoriteList(
    //               widget.user.favorites, widget.recipe.title.toString());
    //           if (indexOfFavoritedItem !=
    //               -1) { //if item is in the favorite list,
    //             if (widget.user.favorites[indexOfFavoritedItem]
    //                 .isFavorite) { //check if the item is favorited
    //               widget.user.favorites[indexOfFavoritedItem].isFavorite =
    //               false; //then unfavorite it
    //               widget.user.favorites.removeAt(
    //                   indexOfFavoritedItem); //then remove the item from the favorites array
    //             } else {
    //               //nothing should really happen here
    //               print('testing to see if something happens here');
    //             }
    //           } else { //since item is not in the favorites list, add it to the favorites list
    //             widget.user.favorites.add(Favorites(recipe: widget.recipe,
    //                 isFavorite: true)); //then set it to be favorited
    //           }
    //         });
    //       },
    //       child: (widget.user.favorites.length != null) ?
    //       ((inFavoriteList(
    //           widget.user.favorites, widget.recipe.title.toString())) != -1
    //           ? Icon(Icons.favorite_rounded, color: favoriteIconColor,)
    //           : Icon(Icons.favorite_border_rounded, color: favoriteIconColor)) :
    //       Icon(Icons.favorite_border_rounded, color: favoriteIconColor),
    //     ),
    //
    //   ),
    // );
    return Scaffold(
      //Top bar of the page (Title and color)
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.recipe.title),
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
  if(recipe.analyzedInstructions.isNotEmpty){
    if(recipe.analyzedInstructions[0].steps.length > 0){
      return SizedBox(
        // height: MediaQuery.of(context).size.height - 500,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recipe.analyzedInstructions[0].steps.length,
          itemBuilder: (context, index){
            return Text(
                "${recipe.analyzedInstructions[0].steps[index].number}. ${recipe.analyzedInstructions[0].steps[index].step}\n"
            );
          },
        ),
      );
    }else{
      if(recipe.instructions != ""){
        return Text(
          recipe.analyzedInstructions.length > 1 ? recipe.analyzedInstructions.toString() : recipe.instructions.replaceAll(". ", "\n\n"), //widget.recipe.instructions.replaceAll(". ", "\n\n"), //added this to make it look neater
          style: TextStyle(
            fontSize: 16.0,
          ),
          softWrap: true,
        );
      } else {
        return Text("No instruction or analyzed instructions provided");
      }
    }
  } else {
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

Widget ingredientPage(RecipeElement recipe){
  if(recipe.extendedIngredients.isNotEmpty){
    return SizedBox(
      // height: MediaQuery.of(context).size.height - 500,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipe.extendedIngredients.length,
        itemBuilder: (context, index){
          return Card(child: ListTile(
            title: Text("${recipe.extendedIngredients[index].original}"),
            trailing: IconButton(
              icon: Icon(Icons.add_circle_outline_rounded, color: Colors.black),
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
}
//   return ListView.builder(
//     itemCount: recipe.extendedIngredients.length,
//     itemBuilder: (context, index){
//       return Text("${recipe.extendedIngredients[index].original}");
//     },
//   );
// }