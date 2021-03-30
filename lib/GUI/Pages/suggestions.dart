import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastez/GUI/AppBar/CurvyAppBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/API%20Parsing/Recipe.dart';
import 'package:tastez/Middleware/API%20Parsing/RecipeElement.dart';
import 'package:tastez/Middleware/Pages/Favorites.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';
import 'package:tastez/Middleware/user.dart';
import 'recipe.dart';





Widget suggestions(User currUser){
  return Scaffold(
    body: FutureBuilder<Recipe>(
        future: currUser.getHomeSuggestion(),
        // future: currUser.getRecipeByID(),
        // future: currUser.getRandomRecipe(),
        builder: (BuildContext context, AsyncSnapshot<Recipe> response) {
          Widget child;
          if (response.hasData) {
            print("data recieved");
            child = Container(child: SuggestionListTemplate(response: response, currUser: currUser,));
          }else{
            child = Container(height:0.0, width: 0.0);
            print("no data received");
          }
          return child;
        }
    ),
  );
}

class SuggestionListTemplate extends StatefulWidget {
  const SuggestionListTemplate({
    Key key,
    this.response,
    //this.suggestCount,
    this.currUser,
  }) : super(key: key);
  final AsyncSnapshot<Recipe> response;
  //final int suggestCount;
  final User currUser;

  @override
  _SuggestionListTemplateState createState() => _SuggestionListTemplateState();
}

//todo: get refresh to work
// Future<Recipe> _refreshSuggestions() async{
//   Recipe response = await defaultUser.getHomeSuggestion();
//   // Future.delayed(Duration(seconds: 2));
//   return response;
//   // print('refreshing recipes...');
// }

class _SuggestionListTemplateState extends State<SuggestionListTemplate> {
  FocusNode recipeSearchNode = new FocusNode();
  TextEditingController recipeSearchController = new TextEditingController();
  bool recipeSearchVisiblity = true;


  @override
  Widget build(BuildContext context) {

    // List<Recipe> recipes;
    // recipes.add(widget.response.data);
    // widget.response.data.recipes[0]

    Recipe recipe = widget.response.data;

    return Container(
      color: subAccentColor,
      child: RefreshIndicator(
        //onRefresh: widget.currUser.getHomeSuggestion(),
        // onRefresh: _refreshSuggestions,
        onRefresh: () async {

          setState(() async {
            recipe = await widget.currUser.getHomeSuggestion();
          });
        },
        //onRefresh: (widget.currUser) => {widget.currUser.getHomeSuggestion();},
        color: themeColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 90),
          child: ListView.builder(
            itemCount: widget.currUser.getSuggestCount() > 0 ? widget.currUser.getSuggestCount() : 0,
            itemBuilder: (context, i) {
              // return InkWell(
              //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
              //   child: Card(
              //     color: subAccentColor,
              //     elevation: 8,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         (widget.response.data.recipes[i].image.toString() != "" && widget.response.data.recipes[i].image.toString() != "null") ?
              //           SizedBox(width: 30, height: 30, child: ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.network(widget.response.data.recipes[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,))) :
              //           SizedBox(width: 30, height: 30, child: Image.asset('assets/TastEZ_logo.png', fit: BoxFit.cover,)),
              //
              //         Column(
              //           children: [
              //             (widget.response.data.recipes.elementAt(i).title.toString() != null) ?
              //               Text("${widget.response.data.recipes[i].title.toString()}", softWrap: true,) :
              //               Text("PLACEHOLDER"),
              //
              //             (widget.response.data.recipes.elementAt(i).readyInMinutes.toString() != null) ?
              //               Text("Approximate Cook Time: ${convertMinutesToHours(widget.response.data.recipes[i].readyInMinutes)}") :
              //               Text("PLACEHOLDER"),
              //           ],
              //         ),
              //
              //         IconButton(
              //           onPressed: () {
              //             setState(() {
              //               int indexOfFavoritedItem = inFavoriteList(
              //                   widget.currUser.favorites,
              //                   widget.response.data.recipes.elementAt(i).title.toString());
              //               if (indexOfFavoritedItem != -1) { //if item is in the favorite list,
              //                 if (widget.currUser.favorites[indexOfFavoritedItem].isFavorite) { //check if the item is favorited
              //                   widget.currUser.favorites[indexOfFavoritedItem].isFavorite = false; //then unfavorite it
              //                   widget.currUser.favorites.removeAt(indexOfFavoritedItem); //then remove the item from the favorites array
              //                 } else {
              //                   //nothing should really happen here
              //                   print('testing to see if something happens here');
              //                 }
              //               } else { //since item is not in the favorites list, add it to the favorites list
              //                 widget.currUser.favorites.add(Favorites(
              //                     recipe: widget.response.data.recipes[i],
              //                     isFavorite: true)); //then set it to be favorited
              //               }
              //             });
              //           },
              //           icon: (widget.currUser.favorites.length != null) ?
              //           ((inFavoriteList(widget.currUser.favorites, widget.response.data.recipes.elementAt(i).title.toString())) != -1 ?
              //           Icon(Icons.favorite_rounded) :
              //           Icon(Icons.favorite_border_rounded)) :
              //           Icon(Icons.favorite_border_rounded),
              //           color: Colors.red[600],
              //           splashRadius: 30,
              //           iconSize: 25,
              //         ),
              //       ],
              //     ),
              //
              //   ),
              // );

              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, recipe.recipes[i]))),
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
                // onTap: () => bodyNavigatorKey.currentState.pushNamed('/recipePage'),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  color: subAccentColor,
                  elevation: 1,
                      child: ListTile(
                        title: (recipe.recipes.elementAt(i).title.toString() != null) ?
                          Text(recipe.recipes[i].title.toString()) :
                          Text("PLACEHOLDER"),
                        leading: (recipe.recipes[i].image.toString() != "" && recipe.recipes[i].image.toString() != "null") ?
                          ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.network(recipe.recipes[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,)) :
                          Image.asset('assets/TastEZ_logo.png', fit: BoxFit.cover,),//Image.asset('assets/nullimage.png'),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
                        subtitle: (recipe.recipes.elementAt(i).readyInMinutes.toString() != null) ?
                          // Text("Approximate Cook Time: ${widget.response.data.recipes[i].readyInMinutes.toString()} minutes") :
                          Text("Approximate Cook Time: ${convertMinutesToHours(recipe.recipes[i].readyInMinutes)}") :
                          Text("PLACEHOLDER"),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              int indexOfFavoritedItem = inFavoriteList(
                                  widget.currUser.favorites,
                                  recipe.recipes.elementAt(i).title.toString());
                              if (indexOfFavoritedItem != -1) { //if item is in the favorite list,
                                if (widget.currUser.favorites[indexOfFavoritedItem].isFavorite) { //check if the item is favorited
                                  widget.currUser.favorites[indexOfFavoritedItem].isFavorite = false; //then unfavorite it
                                  widget.currUser.favorites.removeAt(indexOfFavoritedItem); //then remove the item from the favorites array
                                } else {
                                  //nothing should really happen here
                                  print('testing to see if something happens here');
                                }
                              } else { //since item is not in the favorites list, add it to the favorites list
                                widget.currUser.favorites.add(Favorites(
                                    recipe: recipe.recipes[i],
                                    isFavorite: true)); //then set it to be favorited
                              }
                            });
                          },
                          icon: (widget.currUser.favorites.length != null) ?
                            ((inFavoriteList(widget.currUser.favorites, recipe.recipes.elementAt(i).title.toString())) != -1 ?
                              Icon(Icons.favorite_rounded) :
                              Icon(Icons.favorite_border_rounded)) :
                            Icon(Icons.favorite_border_rounded),
                          color: favoriteIconColor,
                          splashRadius: 30,
                          iconSize: 25,
                        ),
                      ),

                  ),
              );

              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, recipe.recipes[i]))),
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
                // onTap: () => bodyNavigatorKey.currentState.pushNamed('/recipePage'),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  color: subAccentColor,
                  elevation: 1,

                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 180,
                              child: (recipe.recipes[i].image.toString() != "" && recipe.recipes[i].image.toString() != "null") ?
                                ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.network(recipe.recipes[i].image.toString(), fit: BoxFit.fitWidth, alignment: Alignment.center,)) :
                                Image.asset('assets/TastEZ_logo.png', fit: BoxFit.cover,),//Image.asset('assets/nullimage.png'),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 0,
                            child: (recipe.recipes.elementAt(i).title.toString() != null) ?
                              Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  "${recipe.recipes.elementAt(i).title.toString()}",
                                  style: GoogleFonts.sriracha(
                                    textStyle: TextStyle(
                                      fontSize: 23,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                      //..color = Colors.white,
                                        ..color = ThemeTextColor,
                                    ),
                                  ),

                                ),
                                // Solid text as fill.
                                Text(
                                  "${recipe.recipes.elementAt(i).title.toString()}",
                                  style: GoogleFonts.sriracha(
                                    textStyle: TextStyle(
                                      color: LightTextColor,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ],
                            ) :
                              Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  "No Title Provided",
                                  style: GoogleFonts.sriracha(
                                    textStyle: TextStyle(
                                      fontSize: 23,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                      //..color = Colors.white,
                                        ..color = ThemeTextColor,
                                    ),
                                  ),

                                ),
                                // Solid text as fill.
                                Text(
                                  "No Title Provided",
                                  style: GoogleFonts.sriracha(
                                    textStyle: TextStyle(
                                      color: LightTextColor,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  int indexOfFavoritedItem = inFavoriteList(
                                      widget.currUser.favorites,
                                      widget.response.data.recipes.elementAt(i).title.toString());
                                  if (indexOfFavoritedItem != -1) { //if item is in the favorite list,
                                    if (widget.currUser.favorites[indexOfFavoritedItem].isFavorite) { //check if the item is favorited
                                      widget.currUser.favorites[indexOfFavoritedItem].isFavorite = false; //then unfavorite it
                                      widget.currUser.favorites.removeAt(indexOfFavoritedItem); //then remove the item from the favorites array
                                    } else {
                                      //nothing should really happen here
                                      print('testing to see if something happens here');
                                    }
                                  } else { //since item is not in the favorites list, add it to the favorites list
                                    widget.currUser.favorites.add(Favorites(
                                        recipe: widget.response.data.recipes[i],
                                        isFavorite: true)); //then set it to be favorited
                                  }
                                });
                              },
                              icon: (widget.currUser.favorites.length != null) ?
                              ((inFavoriteList(widget.currUser.favorites, widget.response.data.recipes.elementAt(i).title.toString())) != -1 ?
                              Icon(Icons.favorite_rounded) :
                              Icon(Icons.favorite_border_rounded)) :
                              Icon(Icons.favorite_border_rounded),
                              color: Colors.red[600],
                              splashRadius: 30,
                              iconSize: 25,
                            ),
                          )
                        ],
                      ),

                    ],
                  )

                  // child: ListTile(
                  //   title: (recipe.recipes.elementAt(i).title.toString() != null) ?
                  //   Text(recipe.recipes[i].title.toString()) :
                  //   Text("PLACEHOLDER"),
                  //   leading: (recipe.recipes[i].image.toString() != "" && recipe.recipes[i].image.toString() != "null") ?
                  //   ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.network(recipe.recipes[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,)) :
                  //   Image.asset('assets/TastEZ_logo.png', fit: BoxFit.cover,),//Image.asset('assets/nullimage.png'),
                  //   //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
                  //   subtitle: (recipe.recipes.elementAt(i).readyInMinutes.toString() != null) ?
                  //   // Text("Approximate Cook Time: ${widget.response.data.recipes[i].readyInMinutes.toString()} minutes") :
                  //   Text("Approximate Cook Time: ${convertMinutesToHours(recipe.recipes[i].readyInMinutes)}") :
                  //   Text("PLACEHOLDER"),
                  //   trailing: IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         int indexOfFavoritedItem = inFavoriteList(
                  //             widget.currUser.favorites,
                  //             recipe.recipes.elementAt(i).title.toString());
                  //         if (indexOfFavoritedItem != -1) { //if item is in the favorite list,
                  //           if (widget.currUser.favorites[indexOfFavoritedItem].isFavorite) { //check if the item is favorited
                  //             widget.currUser.favorites[indexOfFavoritedItem].isFavorite = false; //then unfavorite it
                  //             widget.currUser.favorites.removeAt(indexOfFavoritedItem); //then remove the item from the favorites array
                  //           } else {
                  //             //nothing should really happen here
                  //             print('testing to see if something happens here');
                  //           }
                  //         } else { //since item is not in the favorites list, add it to the favorites list
                  //           widget.currUser.favorites.add(Favorites(
                  //               recipe: recipe.recipes[i],
                  //               isFavorite: true)); //then set it to be favorited
                  //         }
                  //       });
                  //     },
                  //     icon: (widget.currUser.favorites.length != null) ?
                  //     ((inFavoriteList(widget.currUser.favorites, recipe.recipes.elementAt(i).title.toString())) != -1 ?
                  //     Icon(Icons.favorite_rounded) :
                  //     Icon(Icons.favorite_border_rounded)) :
                  //     Icon(Icons.favorite_border_rounded),
                  //     color: favoriteIconColor,
                  //     splashRadius: 30,
                  //     iconSize: 25,
                  //   ),
                  // ),

                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Recipe> _refreshSuggestions() async{
    Recipe response = await defaultUser.getHomeSuggestion();
    // Future.delayed(Duration(seconds: 2));
    setState(() {});
    return response;
    // print('refreshing recipes...');
  }

}

int inFavoriteList(List<Favorites> favoriteList, String recipeName){
  for(int i = 0; i < favoriteList.length; i++){
    if(favoriteList[i].recipe.title.toString() == recipeName){
      return i;
    }
  }
  return -1;
}

String convertMinutesToHours (int duration){
  int hour = -1;
  int min = -1;
  
  hour = duration ~/ 60;
  min = duration - (hour*60);
  
  if(hour > 0){
    return "Hour(s): $hour | Minute(s): $min";
  }else{
    return "Minute(s): $min";
  }
}

String convertMinutesToHoursRecipePage (int duration){
  int hour = -1;
  int min = -1;

  hour = duration ~/ 60;
  min = duration - (hour*60);

  if(hour > 0){
    return "${hour} hr. ${min} min";
  }else{
    return "${min} min";
  }
}
