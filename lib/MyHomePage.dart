import 'package:flutter/material.dart';
import 'package:tastez/main.dart';
import 'package:tastez/Suggestions.dart';
import 'package:tastez/RecipeBook.dart';
import 'package:tastez/Pantry.dart';
import 'package:tastez/ShoppingList.dart';
import 'package:tastez/CocktailCreator.dart';
import 'package:tastez/ContactUs.dart';
import 'package:tastez/Settings.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title text"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => helpPage(),
                    );
                  }, //help splash screen
                  child: Icon(
                    Icons.help_outline,
                    size: 26.0,
                  ),
                )
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
                  // Navigator.pop(context);
                },
              ),//contact us
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                  // Navigator.pop(context);
                },
              ),//settings
            ],
          ),
        ),
        bottomNavigationBar: menu(),
        body: TabBarView(children: [
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }
              ),
            ),
          ),
          Container(child: Center(child: Text('RecipeBook')),),
          Container(child: Center(child: Text('Pantry')),),
          Container(child: Center(child: Text('Shopping List')),),
        ],
        ),
        floatingActionButton:  FloatingActionButton(
          onPressed: (){
            //search function
          },
          elevation: 0.0,
          child:
          Icon(Icons.search),

        ),
      ),
    );
  }
  Widget menu() {
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
          Tab(icon: Icon(Icons.shopping_basket), text: 'Shopping List',),
        ],
      ),
    );

  }
}

class helpPage extends StatefulWidget {
  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('About Pop up'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          ],
        )
    );
  }
}


// class _MyHomePageState extends State<MyHomePage> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title),),
//       body: Center(child: Text('<null>')),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             // ListTile(
//             //   leading: Icon(Icons.home),
//             //   title: Text('Suggestions'),
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//             //     //Navigator.pop(context);
//             //   },
//             // ),//suggestions
//             // ListTile(
//             //   leading: Icon(Icons.book),
//             //   title: Text('Recipe Book'),
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//             //     //Navigator.pop(context);
//             //   },
//             // ),//recipe book
//             // ListTile(
//             //   leading: Icon(Icons.kitchen),
//             //   title: Text('Pantry'),
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//             //     //Navigator.pop(context);
//             //   },
//             // ),//pantry
//             // ListTile(
//             //   leading: Icon(Icons.shopping_basket),
//             //   title: Text('Shopping List'),
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//             //     //Navigator.pop(context);
//             //   },
//             // ),//shopping list
//             // ListTile(
//             //   leading: Icon(Icons.local_drink),
//             //   title: Text('Cocktail Creator'),
//             //   onTap: () {
//             //     Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//             //     // Navigator.pop(context);
//             //   },
//             // ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         elevation: 0.0,
//         //backgroundColor: Colors.blue[900],
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               title: Text('Favorites'),
//           ),
//
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//           ),
//
//           BottomNavigationBarItem(
//               icon: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//           ),
//         ],
//           onTap: (index){
//             setState(() {
//               currentIndex = index;
//               switch(currentIndex){
//                 case 0:
//                 //Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                   Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Suggestions()));
//                   break;
//                 case 1:
//                 //Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                   Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => RecipeBook()));
//                   break;
//                 case 2:
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                   Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => ShoppingList()));
//                   break;
//                 case 3:
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                   Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Pantry()));
//                   break;
//               }
//             });
//           }
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//
//         },
//         elevation: 0.0,
//         child:
//         Icon(Icons.search),
//
//       ),
//
//     );
//   }
// }