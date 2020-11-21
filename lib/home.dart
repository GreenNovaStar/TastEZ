import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'search.dart';
import 'favorites.dart';
import 'pantry.list.dart';
import 'user.dart';
import 'recipe.dart';
import 'prefs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'shop.list.dart';
import 'suggestions.dart';

final int _suggestCount = 4;

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String query, currTitle;
  Recipe response;
  User defaultUser = User(
      0,                                    //id
      "ABCDEFG1234567",                     //uuid
      "John Smith",                         //name
      "example@aol.com",                    //email
      new Prefs(),
      new Pantry(
        cannedGoods: List.empty(growable: true),
        refrigerator: List.empty(growable: true),
        freezer: List.empty(growable: true),
        misc: List.empty(growable: true),
        meats: List.empty(growable: true),
        dairy: List.empty(growable: true),
        grainsNuts: List.empty(growable: true),
        specialty: List.empty(growable: true),
        drinks: List.empty(growable: true),
        snacks: List.empty(growable: true),
        produce: List.empty(growable: true),
        toppings: List.empty(growable: true),
        bakedGoods: List.empty(growable: true),
      ),
    List.empty(growable: true), //favorites
    List.empty(growable: true), //shopping list
  );
  final searchProvider = Search();
  final List<String> _pageTitles = ["Welcome to TastEZ", "Favorites", "Pantry", "Shopping List"];
  TabController _controller;

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

  @override
  void initState(){
    super.initState();
    currTitle = _pageTitles[0];
    _controller =  TabController(length:4, vsync:this);
    defaultUser.initUser();
  }

  Future<void> refreshTitle() {
    setState(() {
      return currTitle = _pageTitles[_controller.index];
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length:4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(currTitle),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.help_outline,
                      size: 26.0,
                    ),)),],
            elevation: 8.0,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: HoldDetector(
            onHold: () => searchProvider.advancedSearch(),
            holdTimeout: Duration(milliseconds: 200),
            enableHapticFeedback: true,
            child:FloatingActionButton(
              elevation: 0.0,
              child: const Icon(Icons.search), onPressed: () => searchProvider.basicSearch(query),
            ),),
          bottomNavigationBar: navigation(),
          body: TabBarView(controller:_controller,
            children: [
              Container(child: suggestions(defaultUser)),
              // FutureBuilder<Recipe>(
              //   future: defaultUser.getHomeSuggestion(),
              //   builder: (BuildContext context, AsyncSnapshot<Recipe> response) {
              //     Widget child;
              //     if (response.hasData) {
              //       child = Container(child: ListView.builder(
              //           itemCount: _suggestCount,
              //           itemBuilder: (context, i) {
              //             return Card(child: ListTile(
              //               title: (response.data.recipes.elementAt(i).title.toString() != null) ? Text(response.data.recipes[i].title.toString()) : Text("PLACEHOLDER"),
              //               leading: (response.data.recipes[i].image.toString() != "" && response.data.recipes[i].image.toString() != null) ? Image.network(response.data.recipes[i].image.toString()) : Image.asset('assets/nullimage.png'),
              //               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(defaultUser, response.data.recipes[i]))),
              //               trailing: IconButton(
              //                 onPressed: () {
              //                   int indexOfFavoritedItem = inFavoriteList(defaultUser.favorites, response.data.recipes.elementAt(i).title.toString());
              //                   setState(() {
              //                     if(indexOfFavoritedItem != -1){
              //                       if(!defaultUser.favorites[indexOfFavoritedItem].isFavorite){
              //                         //if recipe isnt favorited then favorite it
              //                         defaultUser.favorites[indexOfFavoritedItem].isFavorite = true;
              //                       }else{
              //                         //else if recipe is favorited then unfavorite it
              //                         defaultUser.favorites[indexOfFavoritedItem].isFavorite = false;
              //                       }
              //                     }else{
              //                       defaultUser.favorites.add(Favorites(recipe: response.data.recipes[i], isFavorite: true));
              //                     }
              //                   });
              //                 },
              //                  //icon: defaultUser.favorites[i].isFavorite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded),
              //                 icon: (defaultUser.favorites.length != 0) ? (defaultUser.favorites[i].isFavorite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded)) : Icon(Icons.favorite_border_rounded),
              //                 color: Colors.red[600],
              //                 splashRadius: 30,
              //                 iconSize: 25,
              //               ),
              //             ),);},)
              //       );
              //     }
              //     return Container(child:child);
              //   }
              // ),
              Container(child: favorites(defaultUser)),
              Container(child: pantry(defaultUser)),
              Container(child: shopList(defaultUser)),
          ],),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Features'),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Contact Us'),
                  onTap: () {
                    /*Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));*/
                    // Navigator.pop(context);
                  },
                ),//contact us
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    /*Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));*/
                    // Navigator.pop(context);
                  },
                ),//settings
              ],
            ),
          ),
        ),),);
  }

  Widget navigation() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller:_controller,
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.deepOrange,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.amber,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.favorite)),
          Tab(icon: Icon(Icons.kitchen)),
          Tab(icon: Icon(Icons.shopping_basket)),
        ],),);
  }
}
// int inFavoriteList(List<Favorites> favoriteList, String recipeName){
//   for(int i = 0; i < favoriteList.length; i++){
//     if(favoriteList[i].recipe.title.toString() == recipeName){
//       return i;
//     }
//   }
//   return -1;
// }