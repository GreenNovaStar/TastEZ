import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'search.dart';
//import 'contact.us.dart';
import 'recipe.dart';
import 'recipe.book.dart';
import 'pantry.list.dart';
import 'user.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dio/dio.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'favorites.dart';

final int _suggestCount = 5;

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<String> images = List.filled(_suggestCount, "");
  List<String> titles = List.filled(_suggestCount, "");
  List<int> ids = List.filled(_suggestCount, 0);
  String query;
  int errCheck;
  User defaultUser = new User(
      id: 0,
      name: "John Smith",
      email: "example@aol.com",
      hPass: "abc123",
      prefs: new Prefs(),
      pantry: new Pantry(
        dairy:List.filled(11,""),
        flour:List.filled(12,""),
        fruit:List.filled(57,""),
        meat:List.filled(30,""),
        herbs: List.filled(48,""),
        nuts: List.filled(14,""),
        seafood: List.filled(19,""),
        veget: List.filled(97,""),
      )
  );

  final DateTime time = new DateTime.now();
  final searchProvider = Search();
  Response spoonResp;

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

  _initUser(User currUser) async {
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> database = openDatabase(join(await getDatabasesPath(), 'users.db'),);
    Database db = await database;
    await db.insert(
      'users',
      currUser.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  _getHomeSuggestion(User currUser) async {
    final Dio spoon = new Dio(_options);

    if (currUser.id == defaultUser.id) {
      if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + _suggestCount.toString(),
            queryParameters: {"tags": "dinner"});
      }
      else if (time.hour > 11 && time.hour <= 17) {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + _suggestCount.toString(),
            queryParameters: {"tags": "lunch"});
      }
      else {
        spoonResp = await spoon.get(
            "/recipes/random?number=" + _suggestCount.toString(),
            queryParameters: {"tags": "breakfast"});
      }
      if (spoonResp.statusCode == 200) {
        for(int i = 0; i < _suggestCount; i++) {
          images[i] = spoonResp.data['recipes'][i]['image'].toString();
          titles[i] = spoonResp.data['recipes'][i]['title'].toString();
          ids[i] = spoonResp.data['recipes'][i]['id'];
        }
        errCheck = 200;
      }
      else errCheck = -1;
      setState(() {});
    }
    else {
      String wholePantry = "";
      if (currUser.pantry.dairy[0] != "") {
        for (int i = 0; i < currUser.pantry.dairy.length; i++) {
          wholePantry += currUser.pantry.dairy[i];
          if (currUser.pantry.dairy[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.flour[0] != "") {
        for (int i = 0; i < currUser.pantry.flour.length; i++) {
          wholePantry += currUser.pantry.flour[i];
          if (currUser.pantry.flour[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.fruit[0] != "") {
        for(int i = 0; i < currUser.pantry.fruit.length; i++) {
          wholePantry += currUser.pantry.fruit[i];
          if (currUser.pantry.fruit[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.meat[0] != "") {
        for(int i = 0; i < currUser.pantry.meat.length; i++) {
          wholePantry += currUser.pantry.meat[i];
          //if (currUser.pantry.meat[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.herbs[0] != "") {
        for (int i = 0; i < currUser.pantry.herbs.length; i++) {
          wholePantry += currUser.pantry.herbs[i];
          if (currUser.pantry.herbs[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.nuts[0] != "") {
        for (int i = 0; i < currUser.pantry.nuts.length; i++) {
          wholePantry += currUser.pantry.nuts[i];
          if (currUser.pantry.nuts[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.seafood[0] != "") {
        for (int i = 0; i < currUser.pantry.seafood.length; i++) {
          wholePantry += currUser.pantry.seafood[i];
          if (currUser.pantry.seafood[i] != "") wholePantry += ",+";
        }
      }
      if (currUser.pantry.veget[0] != "") {
        for (int i = 0; i < currUser.pantry.veget.length; i++) {
          wholePantry += currUser.pantry.veget[i];
          if (currUser.pantry.veget[i] != "") wholePantry += ",+";
        }
      }
      print(wholePantry);
      if (time.hour > 17 && (time.hour <= 23 && time.minute <= 59)) {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number=" + _suggestCount.toString(),
            queryParameters: {"tags": "dinner"});
      }
      else if (time.hour > 11 && time.hour <= 17) {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString(),
            queryParameters: {"tags": "lunch"});
      }
      else {
        spoonResp = await spoon.get(
            "/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString(),
            queryParameters: {"tags": "breakfast"});
      }
      print("/recipes/findByIngredients?limitLicense=true&ingredients=" + wholePantry + "&number="  + _suggestCount.toString());
    }
    if (spoonResp.statusCode == 200) {
      for(int i = 0; i < _suggestCount; i++) {
        images[i] = spoonResp.data[i]['image'];
        titles[i] = spoonResp.data[i]['title'];
        ids[i] = spoonResp.data[i]['id'];
      }
      errCheck = 200;
    }
    else errCheck = -1;
    setState(() {});
  }

  void changeTitle() {
    setState(() {
      currTitle = _pageTitles[_controller.index];
      if (_controller.index == 0) {
        _getHomeSuggestion(defaultUser);
      }
    });
  }

  @override
  void initState(){
    super.initState();
    currTitle = _pageTitles[0];
    _controller =  TabController(length:4, vsync:this);
    _controller.addListener(changeTitle);
    _getHomeSuggestion(defaultUser);
    _initUser(defaultUser);
    if (errCheck == -1) throw FlutterError;
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
            children: [ Container(child: ListView.builder(
              itemCount: _suggestCount,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: (titles.elementAt(i) != null) ? Text(titles.elementAt(i)) : Text("PLACEHOLDER"),
                    leading: (images.elementAt(i) != "" && images.elementAt(i) != null) ? Image.network(images.elementAt(i)) : Image.asset('assets/nullimage.png'),
                  ),);},)),
              Container(child: favorites()),//(child: recipeBook()),
              Container(child: pantry(defaultUser)),
              Container(child: /*shopList()),*/
              Center(child: Text('Shopping List')),),
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
          Tab(icon: Icon(Icons.book)),
          Tab(icon: Icon(Icons.kitchen)),
          Tab(icon: Icon(Icons.shopping_basket)),
        ],),);
  }
}
