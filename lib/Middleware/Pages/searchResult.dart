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
  Future<SearchRecipe> getRecipeByComplexSearch(String results, List<String> searchFilter) async {
    print("We are in Future in searchResult");
    print("serach filter = ${searchFilter.toString()}");
    print(results);
    final Dio spoon = new Dio(_options);
    Response spoonResp;
    SearchRecipe response = new SearchRecipe();
    if(searchFilter.isNotEmpty){
      spoonResp = await spoon.get("/recipes/search?query=" + results + "&number=10" + searchFilter[0]+searchFilter[1]+searchFilter[2]+searchFilter[3]);
    }else{
      spoonResp = await spoon.get("/recipes/search?query=" + results + "&number=10");
    }
    if (spoonResp.statusCode == 200) {
      print("We are in the if. status 200.");
      searchFilter = List.empty(growable: true);
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text("Search results for: ${widget.searchTerm}", style: TextStyle(color: subAccentColor),),
        iconTheme: IconThemeData(color: subAccentColor),
      ),
      body: widget.parsedComplexSearch.results.length > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
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
                              Image.network(widget.parsedComplexSearch.results[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.center, width: 80,) :
                              Image.network(widget.parsedComplexSearch.baseUri + widget.parsedComplexSearch.results[i].image.toString(), fit: BoxFit.fitHeight, alignment: Alignment.center, width: 80,) ) :
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

Widget RecipeBySearch(User currUser, String results, List<String> searchFilter){

  print("We are in RecipeBySearch, in searchResult.dart, values passed is User, and results = $results");
  print("We are in RecipeBySearch, in searchResult.dart, values passed is User, and search filter = $searchFilter");
  searchResults tempSearch = new searchResults();


  return FutureBuilder<SearchRecipe>(
      future: tempSearch.getRecipeByComplexSearch(results, searchFilter),
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