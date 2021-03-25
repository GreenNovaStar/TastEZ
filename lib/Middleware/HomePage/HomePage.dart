import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Pages/DishPairingFromWine.dart';
import 'package:tastez/GUI/Pages/favorites.dart';
import 'package:tastez/GUI/Pages/shop.list.dart';
import 'package:tastez/GUI/Pages/suggestions.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/user.dart';
import 'package:tastez/pantry.list.dart';

// final controller = PageController(
//   initialPage: 2,
// );

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
    print("hello2");
    return new PageView(
      physics: NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        children: [
          Container(child: suggestions(widget.currUser)),
          Container(child: favorites(widget.currUser)),
          Container(child: DishPairing(widget.currUser)),
          //Container(child: pantry(widget.currUser)),
          Container(child: shopList(widget.currUser)),
        ]
    );
  }
}

class FillerHomePage extends StatefulWidget {
  final PageController pageController;
  FillerHomePage({this.pageController});

  @override
  _FillerHomePageState createState() => _FillerHomePageState();
}
class _FillerHomePageState extends State<FillerHomePage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: widget.pageController,
        onPageChanged: (index) {
          print("currently at page #${index+1}");
        },
        children: [
          Container(
              child: Center(
                // child: Text("Temporary Suggestion Page", style: TextStyle(fontSize: 30),)
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () {print("card $index pressed");},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // if you need this
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        color: subAccentColor,
                        elevation: 1,
                        child: ListTile(
                          title: Text("Card $index"),
                          leading: ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.asset('assets/TastEZ_logo.png', fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,)),
                          subtitle: Text("Approximate Cook Time: Filler Time"),
                          trailing: IconButton(
                            onPressed: () {
                              print("Favorite Icon Pressed");
                            },
                            icon: Icon(Icons.favorite_rounded),
                            color: favoriteIconColor,
                            splashRadius: 30,
                            iconSize: 25,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ),
          Container(child: Center(child: Text("Temporary Favorite Page", style: TextStyle(fontSize: 30),))),
          Container(
              // child: Center(child: Text("Temporary Pantry Page", style: TextStyle(fontSize: 30),)),
            child: DishPairing(defaultUser),
          ),
          Container(child: Center(child: Text("Temporary Shopping List Page", style: TextStyle(fontSize: 30),))),
        ]
    );
  }
}