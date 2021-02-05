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
import 'package:flutter/services.dart';

// final int _suggestCount = 4;
final controller = PageController(
  initialPage: 0,
);
final Color themeColor = Colors.orange; //changes the color of the app
final Color accentColor = Colors.orangeAccent; //changes the color of the app
final Color subAccentColor = Colors.orange[50]; //changes the color of the app
final double appBarIconPaddingSpace = 40;

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
  // PageController _pageController;

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
    // _pageController = PageController(
    //   initialPage: 0,
    // );
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
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.amber,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     home: DefaultTabController(
  //       length:4,
  //       child: Scaffold(
  //         appBar: AppBar(
  //           title: Text(currTitle),
  //           actions: <Widget>[
  //             Padding(
  //                 padding: EdgeInsets.only(right: 20.0),
  //                 child: GestureDetector(
  //                   onTap: () {},
  //                   child: Icon(
  //                     Icons.help_outline,
  //                     size: 26.0,
  //                   ),)),],
  //           elevation: 8.0,
  //         ),
  //         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  //         floatingActionButton: HoldDetector(
  //           onHold: () => searchProvider.advancedSearch(),
  //           holdTimeout: Duration(milliseconds: 200),
  //           enableHapticFeedback: true,
  //           child:FloatingActionButton(
  //             elevation: 0.0,
  //             child: const Icon(Icons.search), onPressed: () => searchProvider.basicSearch(query),
  //           ),),
  //         bottomNavigationBar: navigation(),
  //         body: TabBarView(controller:_controller,
  //           children: [
  //             Container(child: suggestions(defaultUser)),
  //             Container(child: favorites(defaultUser)),
  //             Container(child: pantry(defaultUser)),
  //             Container(child: shopList(defaultUser)),
  //         ],),
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
  //               ListTile(
  //                 leading: Icon(Icons.book),
  //                 title: Text('Contact Us'),
  //                 onTap: () {
  //                   /*Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));*/
  //                   // Navigator.pop(context);
  //                 },
  //               ),//contact us
  //               ListTile(
  //                 leading: Icon(Icons.settings),
  //                 title: Text('Settings'),
  //                 onTap: () {
  //                   /*Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));*/
  //                   // Navigator.pop(context);
  //                 },
  //               ),//settings
  //             ],
  //           ),
  //         ),
  //       ),),);

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeColor, //color of the system status bar (TOP bar)
      systemNavigationBarColor: Colors.black, //color of system navigation bar (BOTTOM bar)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          //appBar: PreferredSize(preferredSize: AppBar().preferredSize,
          appBar: PreferredSize(preferredSize: Size(size.width, 100),
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: size.width,
                      height: 100,
                      color: subAccentColor,//Color(0x00000000),
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(size.width, 100),
                            painter: AppBarCustomPainter(),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(height: 33, child: Image.asset('assets/TastEZ_text.png')),
                                  ),
                                  //Text("TastEZ", style: TextStyle(fontSize: 25, color: Colors.white),),
                                  Container(width: size.width*0.35),
                                  Container(
                                    padding: const EdgeInsets.all(0.0),
                                    width: appBarIconPaddingSpace,
                                    child: IconButton(
                                      onPressed: () {print("refresh button pressed");},
                                      icon: Icon(Icons.refresh_rounded),
                                      splashRadius: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(0.0),
                                    width: appBarIconPaddingSpace,
                                    child: PopupMenuButton<String>(
                                      color: Colors.white,
                                      onSelected: (item) => DialogConstants.selectedItemProfile(item),
                                      itemBuilder: (BuildContext context){
                                        return DialogConstants.dialogChoicesProfile.map((String item) {
                                          return PopupMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList();
                                      },
                                      icon: CircleAvatar(
                                        maxRadius: 15,
                                        //backgroundColor: Colors.black12,
                                        backgroundColor: Color(0x00000000), //transparent color code
                                        //backgroundImage: NetworkImage("https://www.clipartmax.com/png/small/15-153165_log-clipart-user-profile-phone-png.png"), //need to link with user profile
                                        child: Container(
                                          // decoration: BoxDecoration(
                                          //   shape: BoxShape.circle,
                                          //   border: Border.all(color: Colors.white)),
                                            child: Icon(Icons.person, color: Colors.white)), //fallback if there is no profile picture
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    width: appBarIconPaddingSpace,
                                    child: PopupMenuButton<String>(
                                      color: Colors.white,
                                      onSelected: (item) => DialogConstants.selectedItemOverflow(item),
                                      itemBuilder: (BuildContext context){
                                        return DialogConstants.dialogChoicesOverflow.map((String item) {
                                          return PopupMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList();
                                      },
                                      icon: Icon(Icons.more_vert, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),),
          // ]
          // ),
//               child: Container(
//                 color: subAccentColor,
//                 child: AppBar(
//                   backgroundColor: themeColor,
//                   leading: Container(height: 25, child: Image.asset('assets/TastEZ_logo.png', alignment: Alignment.centerRight,),),
//                   title: Text(
//                     "TastEZ",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   shape: RoundedRectangleBorder(
//                     // borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                       borderRadius: BorderRadius.only(
//                         //bottomLeft: Radius.circular(30.0),
//                         bottomRight: Radius.circular(30.0),
//                       )
//                   ),
//                   actions: <Widget>[
// //--------------------Hard Refresh Button-------------------------------
//                     IconButton(
//                       onPressed: () {print("refresh button pressed");},
//                       icon: Icon(Icons.refresh_rounded),
//                       splashRadius: 20,
//                     ),
// //--------------------Profile Picture Icon-------------------------------
//                     PopupMenuButton<String>(
//
//                       onSelected: (item) => DialogConstants.selectedItemProfile(item),
//                       itemBuilder: (BuildContext context){
//                         return DialogConstants.dialogChoicesProfile.map((String item) {
//                           return PopupMenuItem<String>(
//                             value: item,
//                             child: Text(item),
//                           );
//                         }).toList();
//                       },
//                       icon: CircleAvatar(
//                         maxRadius: 15,
//                         //backgroundColor: Colors.black12,
//                         backgroundColor: Color(0x00000000), //transparent color code
//                         //backgroundImage: NetworkImage("https://www.clipartmax.com/png/small/15-153165_log-clipart-user-profile-phone-png.png"), //need to link with user profile
//                         child: Container(
//                           // decoration: BoxDecoration(
//                           //   shape: BoxShape.circle,
//                           //   border: Border.all(color: Colors.white)),
//                             child: Icon(Icons.person, color: Colors.white)), //fallback if there is no profile picture
//                       ),
//                     ),
// //--------------------Top Right 3 Vertical Dot Icon-------------------------------
//                     PopupMenuButton<String>(
//                         onSelected: (item) => DialogConstants.selectedItemOverflow(item),
//                         itemBuilder: (BuildContext context){
//                           return DialogConstants.dialogChoicesOverflow.map((String item) {
//                             return PopupMenuItem<String>(
//                               value: item,
//                               child: Text(item),
//                             );
//                           }).toList();
//                         }
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
          backgroundColor: Colors.white10,
          body: Stack(
              children: [
                Container(
                  color: subAccentColor,
//--------------------Home Page-------------------------------
                  //child: HomePageView(currUser: defaultUser), //displays the body of the app
                  //child: Center(child: Text("Temporary Body", style: TextStyle(fontSize: 30),)), //temporary body
                  child: FillerHomePage(),
                ),
//--------------------Bottom Navigation Page UI Design-------------------------------
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                      width: size.width,
                      height: 80,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(size.width, 80),
                            painter: BNBCustomPainter(),
                          ),

//--------------------Floating Action Button-------------------------------
                          Center(
                              heightFactor: 0.6,
                              child: GestureDetector(
                                child: FloatingActionButton(onPressed: (){print("search button pressed");},
                                  backgroundColor: themeColor,
                                  child: Icon(Icons.search), elevation: 0.1,),
                              )
                          ),

//--------------------Bottom Navigation Icons-------------------------------
                          Container(
                            width: size.width,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(icon: Icon(Icons.home),
                                  onPressed: (){
                                    setState((){
                                      controller.jumpToPage(0);
                                      print(controller.page);
                                    });
                                  },
                                  color: controller.hasClients && controller.page.toInt() == 0 ? Colors.redAccent : Colors.white,
                                ),
                                IconButton(icon: Icon(Icons.favorite),
                                  onPressed: (){
                                    print("favorites button pressed");
                                    setState((){
                                      controller.jumpToPage(1);
                                      print(controller.page);
                                    });
                                  },
                                  color: controller.hasClients && controller.page.toInt() == 1 ? Colors.redAccent : Colors.white,
                                ),
                                Container(width:size.width*0.20), //spacer for bottom icons
                                IconButton(icon: Icon(Icons.kitchen),
                                  onPressed: (){
                                    print("pantry button pressed");
                                    setState((){
                                      controller.jumpToPage(2);
                                      print(controller.page);
                                    });
                                  },
                                  color: controller.hasClients && controller.page.toInt() == 2 ? Colors.redAccent : Colors.white,
                                ),
                                IconButton(icon: Icon(Icons.shopping_basket),
                                  onPressed: (){
                                    print("shopping list button pressed");
                                    setState((){
                                      controller.jumpToPage(3);
                                      print(controller.page);
                                    });
                                  },
                                  color: controller.hasClients && controller.page.toInt() == 3 ? Colors.redAccent : Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                )
              ]
          )
      ),
    );
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

//top right buttons
class DialogConstants{
//------------OVER FLOW DIALOGUE CHOICES-----------------------
  static const String Settings = 'Settings';
  static const String Help = 'Help';
  static const String About = 'About';

  static const List<String> dialogChoicesOverflow = <String>[
    Settings,
    Help,
    About
  ];

  static void selectedItemOverflow(String item){
    if(item == DialogConstants.Settings){
      print("settings");
    }else if(item == DialogConstants.About){
      print("about");
    }else if(item == DialogConstants.Help){
      print("help");
    }
  }

//------------PROFILE ICON BUTTON DIALOGUE CHOICES--------------
  static const String ViewProfile = 'View Profile';
  static const String SignOut = 'Sign Out';

  static const List<String> dialogChoicesProfile = <String>[
    ViewProfile,
    SignOut
  ];

  static void selectedItemProfile(String item){
    if(item == DialogConstants.ViewProfile){
      print("view profile");
    }else if(item == DialogConstants.SignOut){
      print("sign out");
    }
  }
}

//bottom navigation design
class BNBCustomPainter extends CustomPainter{
  //link to bottom navigation design
  //https://www.youtube.com/watch?v=1ToqYMSnNhA
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = themeColor..style = PaintingStyle.fill; //color for bottom navigation
    Path path = Path()..moveTo(0,20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class AppBarCustomPainter extends CustomPainter{
// class AppBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = themeColor
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0,0);
    path_0.lineTo(size.width,0);
    path_0.quadraticBezierTo(size.width,size.height*0.29,size.width,size.height*0.39);
    path_0.cubicTo(size.width*1.00,size.height*0.66,size.width*0.96,size.height*0.66,size.width*0.88,size.height*0.67);
    path_0.cubicTo(size.width*0.71,size.height*0.67,size.width*0.39,size.height*0.67,size.width*0.21,size.height*0.67);
    path_0.cubicTo(size.width*0.12,size.height*0.67,size.width*0.12,size.height*1.00,0,size.height);
    path_0.quadraticBezierTo(0,size.height*0.75,0,0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HomePageView extends StatefulWidget {

  HomePageView({
    Key key,
    @required this.currUser,
    this.pageController,
  }) : super(key: key);

  final User currUser;
  final PageController pageController;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}
class _HomePageViewState extends State<HomePageView> {

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: controller,
        children: [
          Container(child: suggestions(widget.currUser)),
          Container(child: favorites(widget.currUser)),
          Container(child: pantry(widget.currUser)),
          Container(child: shopList(widget.currUser)),
        ]
    );
  }
}

class FillerHomePage extends StatefulWidget {
  @override
  _FillerHomePageState createState() => _FillerHomePageState();
}
class _FillerHomePageState extends State<FillerHomePage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: controller,
        onPageChanged: (index) { //swipe detection
          print("currently at page #${index+1}");
        },
        children: [
          Container(child: Center(child: Text("Temporary Suggestion Page", style: TextStyle(fontSize: 30),))),
          Container(child: Center(child: Text("Temporary Favorite Page", style: TextStyle(fontSize: 30),))),
          Container(child: Center(child: Text("Temporary Pantry Page", style: TextStyle(fontSize: 30),))),
          Container(child: Center(child: Text("Temporary Shopping List Page", style: TextStyle(fontSize: 30),))),
        ]
    );
  }
}
