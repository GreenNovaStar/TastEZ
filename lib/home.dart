import 'package:flutter/material.dart';
import 'search.dart';
import 'contact.us.dart';
import 'recipe.dart';
import 'recipe.book.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dio/dio.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  String query;
  int suggestCount = 4;
  final DateTime time = new DateTime.now();
  final searchProvider = Search();
  List<RecipeElement> recipes;

  final List<String> _pageTitles = ["Welcome to TastEZ", "Recipe Book", "Pantry", "Shopping List"];
  TabController _controller;
  String currTitle;

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

  void _getHomeSuggestion() async {
    final Dio spoon = new Dio(_options);
    Response spoonResp;
      if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + suggestCount.toString(), queryParameters: {"tags": "dinner"});
      }
      else if (time.hour > 11 && time.hour <= 17) {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + suggestCount.toString(), queryParameters: {"tags": "lunch"});
      }
      else {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + suggestCount.toString(), queryParameters: {"tags": "breakfast"});
      }
      if (spoonResp.statusCode == 200) {
        recipes = recipeFromJson(spoonResp.data).recipes;
      }
  }

  @override
  void initState(){
    super.initState();
    currTitle = _pageTitles[0];
    _controller =  TabController(length:4, vsync:this);
    _controller.addListener(changeTitle);
    //_getHomeSuggestion(); //TODO: commented out for now to avoid using up API quota, even as large as it is.
  }

  void changeTitle() {
    setState(() {
      currTitle = _pageTitles[_controller.index];
    });
  }

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
            Container(child: ListView.builder(
              itemCount: recipes == null ? 0 : recipes.length, //TODO: for some reason this is returning null.
              itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(recipes[index].title),
                    leading: Image.network(recipes[index].image),
                  );},)),
            Container(child: recipeBook()),
            Container(child: /*pantry()),*/ Center(child: Text('Pantry')),),
            Container(child: /*shopList()),*/ Center(child: Text('Shopping List')),),
          ],),),),);
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
          Tab(icon: Icon(Icons.book)),
          Tab(icon: Icon(Icons.kitchen)),
          Tab(icon: Icon(Icons.shopping_basket)),
        ],),);
  }
}