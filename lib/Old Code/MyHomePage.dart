import 'package:flutter/material.dart';
import 'package:tastez/main.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Suggestions.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/RecipeBook.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Pantry.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/ShoppingList.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/CocktailCreator.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/ContactUs.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Settings.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage>{
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context){
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Title text"),
//           actions: <Widget>[
//             PopupMenuButton(
//               //onSelected:{},
//               itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//                 const PopupMenuItem(
//                   //value: WhyFarther.harder,
//                   child: Text('Help'),
//                 ),
//                 const PopupMenuItem(
//                   //value: WhyFarther.smarter,
//                   child: Text('Being a lot smarter'),
//                 ),
//                 const PopupMenuItem(
//                   //value: WhyFarther.selfStarter,
//                   child: Text('Being a self-starter'),
//                 ),
//                 const PopupMenuItem(
//                   //value: WhyFarther.tradingCharter,
//                   child: Text('Placed in charge of trading charter'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 child: Text('Features'),
//                 decoration: BoxDecoration(
//                   color: Colors.orangeAccent,
//                 ),
//               ),
//
//               ListTile(
//                 leading: Icon(Icons.book),
//                 title: Text('Contact Us'),
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                   // Navigator.pop(context);
//                 },
//               ),//contact us
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Settings'),
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                   // Navigator.pop(context);
//                 },
//               ),//settings
//             ],
//           ),
//         ),
//         bottomNavigationBar: menu(),
//         body: TabBarView(children: [
//           Container(
//             child: GridView.count(
//               crossAxisCount: 2,
//               children: List.generate(100, (index) {
//                 return Center(
//                   child: Text(
//                     'Item $index',
//                     style: Theme.of(context).textTheme.headline5,
//                   ),
//                 );
//               }
//               ),
//             ),
//           ),
//           Container(child: Center(child: Text('RecipeBook')),),
//           Container(child: Center(child: Text('Pantry')),),
//           Container(child: Center(child: Text('Shopping List')),),
//         ],
//         ),
//         floatingActionButton:  FloatingActionButton(
//           onPressed: (){
//             //search function
//           },
//           elevation: 0.0,
//           child:
//           Icon(Icons.search),
//
//         ),
//       ),
//     );
//   }
//   Widget menu() {
//     return Container(
//       color: Colors.white,
//       child: TabBar(
//         labelColor: Colors.amber,
//         unselectedLabelColor: Colors.deepOrange,
//         indicatorSize: TabBarIndicatorSize.tab,
//         indicatorPadding: EdgeInsets.all(5.0),
//         indicatorColor: Colors.amber,
//         tabs: [
//           Tab(icon: Icon(Icons.home), text: 'Home',),
//           Tab(icon: Icon(Icons.book), text: 'Recipes',),
//           Tab(icon: Icon(Icons.kitchen), text: 'Pantry',),
//           Tab(icon: Icon(Icons.shopping_basket), text: 'Shopping List',),
//         ],
//       ),
//     );
//
//   }
// }
//
// class helpPage extends StatefulWidget {
//   @override
//   _helpPageState createState() => _helpPageState();
// }
//
// class _helpPageState extends State<helpPage> {
//   @override
//   Widget build(BuildContext context) {
//     // return AlertDialog(
//     //     backgroundColor: Colors.white,
//     //     title: const Text('Help'),
//     //     content: new Column(
//     //       mainAxisSize: MainAxisSize.max,
//     //       crossAxisAlignment: CrossAxisAlignment.stretch,
//     //       children: <Widget>[
//     //         Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet felis tempor, dictum purus ac, scelerisque mi. Aenean hendrerit ex ut ligula consectetur, eget viverra erat fringilla. Quisque quis neque ac eros eleifend molestie. Vestibulum suscipit metus tortor. Nulla imperdiet risus dictum dignissim vestibulum. Praesent nec ante in ex consectetur consequat non condimentum tellus. Duis nec eros vulputate, facilisis neque at, accumsan orci. Duis mattis a massa ac fringilla. Sed tincidunt nisl vitae dui sodales egestas. Nulla accumsan sollicitudin placerat. Curabitur lacinia mattis iaculis. Vivamus efficitur iaculis luctus."),
//     //         Text("Donec posuere augue mi, vel consequat erat ultrices id. Proin fringilla sodales tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas porta, nisi a venenatis iaculis, est metus malesuada dolor, auctor elementum orci arcu sit amet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras mattis sapien lobortis, maximus lorem eget, bibendum erat. Praesent iaculis a odio non porta. Suspendisse aliquet blandit nulla, non condimentum mauris aliquet nec. Praesent ultricies, libero ac pulvinar gravida, nisl augue pulvinar ligula, non luctus libero lectus vitae tellus. Pellentesque ac enim sit amet leo aliquet efficitur. Phasellus mi sem, porta vel magna eu, scelerisque sollicitudin sem. Nulla in tincidunt odio. Aenean dictum, purus sit amet lacinia efficitur, nisi mi tincidunt felis, eget mollis turpis nisi a ipsum. Ut viverra ante eget urna pretium mollis. In sit amet iaculis eros, non convallis leo. ")
//     //       ],
//     //     )
//     // );
//   }
// }


class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(child: Text('<null>')),
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
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Suggestions'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
            //     //Navigator.pop(context);
            //   },
            // ),//suggestions
            // ListTile(
            //   leading: Icon(Icons.book),
            //   title: Text('Recipe Book'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
            //     //Navigator.pop(context);
            //   },
            // ),//recipe book
            // ListTile(
            //   leading: Icon(Icons.kitchen),
            //   title: Text('Pantry'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
            //     //Navigator.pop(context);
            //   },
            // ),//pantry
            // ListTile(
            //   leading: Icon(Icons.shopping_basket),
            //   title: Text('Shopping List'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
            //     //Navigator.pop(context);
            //   },
            // ),//shopping list
            // ListTile(
            //   leading: Icon(Icons.local_drink),
            //   title: Text('Cocktail Creator'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
            //     // Navigator.pop(context);
            //   },
            // ),//cocktail creator
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        //backgroundColor: Colors.blue[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Shopping List'),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              title: Text('Pantry'),
          ),
        ],
          onTap: (index){
            setState(() {
              currentIndex = index;
              switch(currentIndex){
                case 0:
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Suggestions()));
                  break;
                case 1:
                //Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => RecipeBook()));
                  break;
                case 2:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => ShoppingList()));
                  break;
                case 3:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Pantry()));
                  break;
              }
            });
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        elevation: 0.0,
        child:
        Icon(Icons.search),

      ),

    );
  }
}