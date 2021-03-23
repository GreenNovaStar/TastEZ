import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'dart:async';

import 'package:tastez/Middleware/Pages/Search.dart';

class SearchButton extends StatelessWidget {
  GestureTapCallback onPressedSearch;
  SearchButton({this.onPressedSearch});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // onPressed: onPressedSearch,
      // onPressed: () async {
      //     final resultsFromSearch = await showSearch(
      //       context: context,
      //       delegate: CustomSearch(searchQuery: currUser.previousSearches),
      //     );
      //     if(resultsFromSearch != null){
      //       print("result from search = $resultsFromSearch");
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(currUser, resultsFromSearch)));
      //     }else{
      //       print("pressed back from search, nothing returned");
      //     }
      //
      // },
      backgroundColor: themeColor,
      child: Icon(
        Icons.search,
        color: subAccentColor,
      ),
      elevation: 0.1,
    );
  }
}
