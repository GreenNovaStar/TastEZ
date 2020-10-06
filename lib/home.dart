import 'package:flutter/material.dart';
import 'main.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:holding_gesture/holding_gesture.dart';

class Home extends StatelessWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  void basicSearch() async {
    String query;
    Dio spoonDio = new Dio();
    var spoonResp = await spoonDio.get("https://api.spoonacular.com/recipes/complexSearch", queryParameters: {"query": query});
  }

  void advancedSearch() async {
    Dio spoonDio = new Dio();
    Response spoonResp = await spoonDio.get("https://api.spoonacular.com/recipes/complexSearch", queryParameters: {"query": "potato"});
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
            elevation: 8.0,
            title: Text(title),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: HoldDetector(
            onHold: () => advancedSearch(),
            holdTimeout: Duration(milliseconds: 200),
            enableHapticFeedback: true,
            child:FloatingActionButton(
              elevation: 0.0,
              child: const Icon(Icons.search), onPressed: () => basicSearch(),
            ),),
          bottomNavigationBar: navigation(),
          body: TabBarView(children: [
            Container(child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),);}),),),
            Container(child: Center(child: Text('RecipeBook')),),
            Container(child: Center(child: Text('Pantry')),),
            Container(child: Center(child: Text('Shopping List')),),
          ],),),),);
  }
  Widget navigation() {
    return Container(
      color: Colors.white,
      child: TabBar(
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.deepOrange,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.amber,
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home',),
          Tab(icon: Icon(Icons.book), text: 'Recipes',),
          Tab(icon: Icon(Icons.kitchen), text: 'Pantry',),
          Tab(icon: Icon(Icons.shopping_basket), text: 'S. List',),
        ],),);
  }
}