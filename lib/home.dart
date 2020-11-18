import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'search.dart';
import 'favorites.dart';
import 'pantry.list.dart';
import 'user.dart';
import 'prefs.dart';
import 'recipe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'suggestions.dart';


final int _suggestCount = 10;

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
      new Prefs(                            //prefs
        darkMode:0,
        dairyCustom: new List<String>(),
        flourCustom: new List<String>(),
        fruitCustom: new List<String>(),
        meatCustom: new List<String>(),
        herbsCustom: new List<String>(),
        nutsCustom: new List<String>(),
        seafoodCustom: new List<String>(),
        vegetCustom: new List<String>(),
      ),
      new Pantry(                          //pantry
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
  final searchProvider = Search();
  final List<String> _pageTitles = ["Welcome to TastEZ", "Favorites", "Pantry", "Shopping List"];
  TabController _controller;

  void changeTitle() async {
    setState(() {
      currTitle = _pageTitles[_controller.index];
    });
  }

  @override
  void initState(){
    super.initState();
    currTitle = _pageTitles[0];
    _controller =  TabController(length:4, vsync:this);
    _controller.addListener(changeTitle);
    defaultUser.initUser();
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
            //   FutureBuilder<Recipe>(
            //       future: defaultUser.getHomeSuggestion(),
            // builder: (BuildContext context, AsyncSnapshot<Recipe> response) {
            //   Widget child;
            //   switch(response.connectionState){
            //     case ConnectionState.none:
            //       return Text('Press button to start.');
            //     case ConnectionState.active:
            //     case ConnectionState.waiting:
            //     //defaultUser.getHomeSuggestion();
            //       return Text('Awaiting result...');
            //     case ConnectionState.done:
            //       if(response.hasError){
            //         print("i know it went here");
            //         return Text('Error: ${response.error}');
            //       }
            //       if (response.hasData) {
            //         print("went in here");
            //         child = Container(child: ListView.builder(
            //           itemCount: _suggestCount,
            //           itemBuilder: (context, i) {
            //             return Card(child: ListTile(
            //               title: (response.data.recipes[i].title.toString() != null) ? Text(response.data.recipes[i].title.toString()) : Text("PLACEHOLDER"),
            //               leading: (response.data.recipes[i].image.toString() != "" && response.data.recipes[i].image.toString() != null) ? Image.network(response.data.recipes[i].image.toString()) : Image.asset('assets/nullimage.png'),
            //             ),);},)
            //         );
            //       }else{
            //         print("but did it go here?");
            //         child = Container(child: ListView.builder(
            //           itemCount: _suggestCount,
            //           itemBuilder: (context, i) {
            //             return Card(child: ListTile(
            //               title: Text("PLACEHOLDER"),
            //               leading: Image.asset('assets/nullimage.png'),
            //               trailing: IconButton(
            //                 onPressed: () {
            //                   print("$i Unfavorited");
            //                   // setState((){
            //                   //   widget.isFavorited[index] ? widget.isFavorited[index] = false : widget.isFavorited[index] = true;
            //                   // });
            //                   //remove item from the favorite list
            //                 },
            //                 icon: Icon(Icons.favorite_border_rounded),
            //                 color: Colors.red[600],
            //                 splashRadius: 30,
            //                 iconSize: 25,
            //               ),
            //             ),);},)
            //         );
            //       }
            //       return Container(child: child);
                  //return RefreshIndicator(onRefresh: () {defaultUser.getHomeSuggestion();});
                //   break;
                // default:
                //   return null;
            //   }
            //
            // }

              // ),
              Container(child: favorites()),
              Container(child: pantry(defaultUser)),
              Container(child: /*shopList()),*/ Center(child: Text('Shopping List')),),
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
