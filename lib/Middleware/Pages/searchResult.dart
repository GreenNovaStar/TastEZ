import 'package:flutter/material.dart';
import 'package:tastez/GUI/AppBar/AppBar.dart';
import 'package:tastez/GUI/AppBar/CurvyAppBar.dart';
import 'package:tastez/GUI/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Pages/recipe.dart';
import 'package:tastez/GUI/Pages/suggestions.dart';
import 'package:tastez/Middleware/API%20Parsing/Recipe.dart';

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:tastez/Middleware/API%20Parsing/RecipeElement.dart';
import 'package:tastez/Middleware/API%20Parsing/WinePairing/SearchRecipe.dart';
import 'package:tastez/Middleware/HomePage/HomePage.dart';
import 'package:tastez/Middleware/HomePage/OverFlowButtonIcons.dart';
import 'package:tastez/Middleware/Pages/Search.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';
import 'package:tastez/Middleware/user.dart';
import 'package:tastez/home.dart';


/*----------searchResults Class----------*/
class searchResults{

  // Constructor
  searchResults();

// API information
  final BaseOptions _options = new BaseOptions(
    baseUrl: "https://rapidapi.p.rapidapi.com",
    connectTimeout:5000,
    receiveTimeout:3000,
    headers: {
      "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "x-rapidapi-key": "0b83fa3f6emshf35335a21f7c826p178545jsnf157389bedd5",
      "useQueryString": true,
    },
    contentType: "application/json",
  );

  // API-parsing
  Future<SearchRecipe> getRecipeByComplexSearch(String results) async {
    print("We are in Future in searchResult");
    print(results);
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    SearchRecipe response = new SearchRecipe();
    spoonResp = await spoon.get("/recipes/search?query=" + results + "&number=10");
    if (spoonResp.statusCode == 200) {
      print("We are in the if. status 200.");
      response = SearchRecipe.fromJson(spoonResp.data);
    }
    return response;
  }

}

class SearchResultsGUI extends StatefulWidget {

  SearchRecipe parsedComplexSearch;
  User currUser;
  String searchTerm;

  SearchResultsGUI({this.parsedComplexSearch, this.currUser, this.searchTerm});

  @override
  _SearchResultsGUIState createState() => _SearchResultsGUIState();
} // anotherWidget

class _SearchResultsGUIState extends State<SearchResultsGUI> {

  @override
  Widget build(BuildContext context) {
    print("We are in _anotherWidgetState");
    final Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       widget.parsedComplexSearch.results[0].title,
    //     ),
    //   ),
    //   body: Container(
    //     child: Image.network(widget.parsedComplexSearch.results[0].image),
    //   ),
    // ); // return
    // Return from Suggestion.dart

//     return Scaffold(
//       appBar: PreferredSize(preferredSize: Size(size.width, 100),
//         child: CurvyAppBar(
//           size: size,
//           //onPressed: () {return suggestions(widget.currUser);}
//         ),),
//       body: Container(
//         color: subAccentColor,
//         //child: RefreshIndicator(
//         //  color: themeColor,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 8.0, bottom: 90),
//           child: ListView.builder(
//             itemCount: widget.parsedComplexSearch.number > 0 ? widget.parsedComplexSearch.number : 0,
//             itemBuilder: (context, i) {
//
//               return GestureDetector(
//                 onTap: (){
//                   print("item ${widget.parsedComplexSearch.results[i].title} pressed");
//                   // Future<RecipeElement> recipe = widget.currUser.getRecipeByID(widget.parsedComplexSearch.results[i].id);
//                   bodyNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => GetRecipeFromSearchID(widget.currUser, widget.parsedComplexSearch.results[i].id)));
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => GetRecipeFromSearchID(widget.currUser, widget.parsedComplexSearch.results[i].id)));
//                 },
//                 //color: themeColor,
//                 //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20), // if you need this
//                     side: BorderSide(
//                       color: Colors.grey.withOpacity(0.2),
//                       width: 1,
//                     ),
//                   ),
//                   color: subAccentColor,
//                   elevation: 1,
//                   child: ListTile(
//                       title: (widget.parsedComplexSearch.results[i].title.toString() != null) ?
//                       Text(widget.parsedComplexSearch.results[i].title.toString()) :
//                       Text("PLACEHOLDER"),
//                       leading: (widget.parsedComplexSearch.results[i].image != "" && widget.parsedComplexSearch.results[i].image.toString() != "null") ?
//                       ClipRRect(borderRadius: BorderRadius.circular(20.0),
//                           child: widget.parsedComplexSearch.results[i].image.contains("http") ?
//                           Image.network(widget.parsedComplexSearch.results[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,) :
//                           Image.network(widget.parsedComplexSearch.baseUri + widget.parsedComplexSearch.results[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,) ) :
//                       Image.asset('assets/TastEZ_logo.png', fit: BoxFit.cover,), //Image.asset('assets/nullimage.png'),
//                   ),
//
//                 ),
//               );
//             },
//           ),
//         ),
//         //), // refreshIndicator
//       ),
//       bottomNavigationBar: Container(
//         width: size.width,
//         height: 80,
//         child: Stack(
//           children: [
//             CustomPaint(
//               size: Size(size.width, 80),
//               painter: BNBCustomPainter(),
//             ),
//
// //--------------------Floating Action Button-------------------------------
//             Center(
//                 heightFactor: 0.6,
//                 child: GestureDetector(
//                   child:
//                   // FloatingActionButton(onPressed: (){print("search button pressed");},
//                   FloatingActionButton(
//                     onPressed: () async {
//                       final resultsFromSearch = await showSearch(
//                         context: context,
//                         delegate: CustomSearch(searchQuery: widget.currUser.previousSearches),
//                       );
//                       if(resultsFromSearch != null){
//                         print("result from search = $resultsFromSearch");
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(widget.currUser, resultsFromSearch)));
//                       }else{
//                         print("pressed back from search, nothing returned");
//                       }
//
//                     },
//                     backgroundColor: themeColor,
//                     child: Icon(Icons.search), elevation: 0.1,),
//                 )
//             ),
//
// //--------------------Bottom Navigation Icons-------------------------------
//             Container(
//               width: size.width,
//               height: 80,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(icon: Icon(Icons.home),
//                     onPressed: (){
//                       setState((){
//                         controller.jumpToPage(0);
//                         print(controller.page);
//                       });
//                     },
//                     color: controller.hasClients && controller.page.toInt() == 0 ? Colors.redAccent : Colors.white,
//                   ),
//                   IconButton(icon: Icon(Icons.favorite),
//                     onPressed: (){
//                       print("favorites button pressed");
//                       setState((){
//                         controller.jumpToPage(1);
//                         print(controller.page);
//                       });
//                     },
//                     color: controller.hasClients && controller.page.toInt() == 1 ? Colors.redAccent : Colors.white,
//                   ),
//                   Container(width:size.width*0.20), //spacer for bottom icons
//                   IconButton(icon: Icon(Icons.kitchen),
//                     onPressed: (){
//                       print("pantry button pressed");
//                       setState((){
//                         controller.jumpToPage(2);
//                         print(controller.page);
//                       });
//                     },
//                     color: controller.hasClients && controller.page.toInt() == 2 ? Colors.redAccent : Colors.white,
//                   ),
//                   IconButton(icon: Icon(Icons.shopping_basket),
//                     onPressed: (){
//                       print("shopping list button pressed");
//                       setState((){
//                         controller.jumpToPage(3);
//                         print(controller.page);
//                       });
//                     },
//                     color: controller.hasClients && controller.page.toInt() == 3 ? Colors.redAccent : Colors.white,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         )
//     ),
//     );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text("Search results for: ${widget.searchTerm}"),
      ),
      body: widget.parsedComplexSearch.results.length > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 90),
              child: ListView.builder(
                itemCount: widget.parsedComplexSearch.results.length > 0 ? widget.parsedComplexSearch.results.length: 0,
                itemBuilder: (context, i) {

                  return GestureDetector(
                    onTap: (){
                      print("item ${widget.parsedComplexSearch.results[i].title} pressed");
                      // Future<RecipeElement> recipe = widget.currUser.getRecipeByID(widget.parsedComplexSearch.results[i].id);

                      // bodyNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => GetRecipeFromSearchID(widget.currUser, widget.parsedComplexSearch.results[i].id)));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GetRecipeFromSearchID(widget.currUser, widget.parsedComplexSearch.results[i].id)));
                    },
                    //color: themeColor,
                    //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
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
                        title: (widget.parsedComplexSearch.results[i].title.toString() != null) ?
                        Text(widget.parsedComplexSearch.results[i].title.toString()) :
                        Text("PLACEHOLDER"),
                        leading: (widget.parsedComplexSearch.results[i].image != "" && widget.parsedComplexSearch.results[i].image.toString() != "null") ?
                        ClipRRect(borderRadius: BorderRadius.circular(20.0),
                            child: widget.parsedComplexSearch.results[i].image.contains("http") ?
                            Image.network(widget.parsedComplexSearch.results[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,) :
                            Image.network(widget.parsedComplexSearch.baseUri + widget.parsedComplexSearch.results[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,) ) :
                        Image.asset('assets/TastEZ_logo.png', fit: BoxFit.cover,), //Image.asset('assets/nullimage.png'),
                      ),

                    ),
                  );
                },
              ),
            )
          : ListTile(title: Text("No dishes found with this search result")),
    );

  }
} // _anotherWidgetState

Widget RecipeBySearch(User currUser, String results){

  print("We are in RecipeBySearch, in searchResult.dart, values passed is User, and results = $results");
  searchResults tempSearch = new searchResults();


  return FutureBuilder<SearchRecipe>(
      future: tempSearch.getRecipeByComplexSearch(results),
      // future: currUser.getRecipeByID(),
      builder: (BuildContext context, AsyncSnapshot<SearchRecipe> response) {
        print("We are in the builder of FutureBuilder (RecipeBySearch)");
        Widget child;
        if (response.hasData) {
          print("data recieved");
          child = SearchResultsGUI(currUser: currUser, parsedComplexSearch: response.data, searchTerm: results);
          // bodyNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => SearchResultsGUI(currUser: currUser, parsedComplexSearch: response.data)));
          // child = Container(child: Text("${response.data.totalResults}"));
        }else{
          child = Container(height:0.0, width: 0.0);
          print("no data received");
        }
        return child;

        // if(response.connectionState == ConnectionState.done){
        //   if(response.hasError){
        //     return Text("Future Builder in RecipeBySearch resulted in an error");
        //   }
        //   bodyNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => SearchResultsGUI(currUser: currUser, parsedComplexSearch: response.data)));
        // }else{
        //   return CircularProgressIndicator();
        // }
        // return null;
      }
  );

}

Widget GetRecipeFromSearchID(User currUser, int id){

  return FutureBuilder<RecipeElement>(
      future: currUser.getRecipeByID(id),
      // future: currUser.getRecipeByID(),
      builder: (BuildContext context, AsyncSnapshot<RecipeElement> response) {
        print("We are in the builder of FutureBuilder (GetRecipeFromSearchID)");
        Widget child;
        if (response.hasData) {
          print("data recieved");
          child = recipePage(currUser, response.data);
          // child = Container(child: Text("${response.data.totalResults}"));
        }else{
          child = Container(height:0.0, width: 0.0);
          print("no data received");
        };
        return child;
      }
  );;

}