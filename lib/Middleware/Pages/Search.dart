import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Pages/recipe.dart';
import 'package:tastez/GUI/Pages/suggestions.dart';
import 'package:tastez/Middleware/Pages/Favorites.dart';
import 'package:tastez/Middleware/Pages/searchFilter.dart';
import 'package:tastez/pantry.list.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/APIParsing/Recipe.dart';
import 'package:tastez/Middleware/APIParsing/RecipeElement.dart';
import 'package:tastez/Middleware/user.dart';

class CustomSearch extends SearchDelegate{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //Cunstructor
  CustomSearch({this.searchQuery, this.searchFilterResults});

  //variables
  List<String> searchQuery;
  List<String> searchFilterResults;
  // String searchQuery;

  /*------Top App Bar-----*/

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme =
      ThemeData(
        primaryColor: themeColor,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: subAccentColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white), //change the color of the hint text
      );
    assert(theme != null);
    return theme;

  }
  /*-----END Top App Bar-----*/

  /*Clear Search Bar Button*/
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
            Icons.filter_alt_rounded,
            color: subAccentColor),
        onPressed: () async {
          print("new filter icon pressed");
          final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => searchFilter()));
          print(result[0]);
          if(searchFilterResults != null){
            searchFilterResults.add(result[0]);
            searchFilterResults.add(result[1]);
            searchFilterResults.add(result[2]);
            searchFilterResults.add(result[3]);
          }else{
            searchFilterResults = List.empty(growable: true);
            searchFilterResults.add(result[0]);
            searchFilterResults.add(result[1]);
            searchFilterResults.add(result[2]);
            searchFilterResults.add(result[3]);
          }

        },
      ),
      IconButton(
        icon: Icon(
            Icons.clear_rounded,
            color: subAccentColor),
        onPressed: () {
          query = ''; //clear the query
        },
      ),
    ];
  }
  /*END Clear Bar*/

  /*Back button, Closes Search page*/
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
          Icons.arrow_back_rounded,
          color: subAccentColor),
      onPressed: () {
        close(context, null);
      },
    );
  }
  /*END Back Button*/

  /*----------Search Action----------*/
  // .trim() is to remove whitespaces before and after the string.
  // just so we don't have some search results like "   abc   "
  // with .trim() the previous string becomes "abc"

  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {
    //check the length of the query
    if (query.length < 3) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Search term must be longer than two letters.",
              ),
            )
          ],
        );
      }
    //results = a sublist of searchQuery that contains the same string as query
    final results = searchQuery.where((element) => element.toLowerCase().contains(query.toLowerCase()));
    return Container(
      child: ListView.builder(
        itemCount: (results.length > 0) ? results.length : 1,
        itemBuilder: (context, index) {
          //check if there has been any search done previously
          if(searchQuery.length > 0){
            return ListTile(
              //check if the query has already been searched before
                onTap: (){
                  if(searchQuery.contains(query)){
                    print("already in previous search, no need to add");
                    close(context, query.trim());
                  }else {
                    searchQuery.add(query.trim());
                    close(context, query.trim());
                  }
                },
                //print out the search query
                title: searchQuery[index].toLowerCase().contains(query.trim().toLowerCase()) ? Text(searchQuery[index]) : Text(query.trim()));
          }else{
            return ListTile(
                onTap: (){
                  searchQuery.add(query.trim());
                  close(context, query.trim());
                },
                title: Text(query.trim()));
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //results = a sublist of searchQuery that contains the same string as query
    final results = searchQuery.where((element) => element.toLowerCase().contains(query.toLowerCase()));
    return ListView(
      children: results.map<ListTile>((e) =>
          ListTile(
            //check if the query has already been searched before
            //onTap: (){searchQuery.contains(query) ? print("already in previous search, no need to add") : query.length > 2 ? searchQuery.add(query.trim()) : query = '';},
            onTap: (){
              if(e.contains(query)){
                print("already in previous search, no need to add");
                close(context, e.trim());
              }else {
                if(query.length > 2){
                  searchQuery.add(query.trim());
                  close(context, e.trim());
                }else{
                  query = '';
                }
              }
            },
            title: results.length > 0 ? Text(e) : Text(query.trim()),
          )).toList(),
    );
  }


}


