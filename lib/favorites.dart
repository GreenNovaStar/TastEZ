import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';
import 'dart:math';
import 'dart:core';
import 'recipe.dart';
import 'user.dart';

import 'package:flutter/cupertino.dart';

class Favorites {
  RecipeElement recipe;
  bool isFavorite;

  Favorites({this.recipe, this.isFavorite});

  Favorites.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipe'] = recipe.toJson();
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}

// Widget favorites(){
//   return
//     Container(
//       child:
//       ListView.builder(
//         itemCount: 5, //replace 5 with the length of the favorites array
//         itemBuilder: (context, index) {
//           return Card(
//             child: Container(
//               child: InkWell(
//                 onTap: () {
//                   print("card $index tapped");
//                   //jump to recipe page
//                 },
//                 child: ListTile(
//                   title: Text("$index title filler"), //replace text with favorite recipe name
//                   //title: (titles.elementAt(i) != null) ? Text(titles.elementAt(i)) : Text("PLACEHOLDER"),
//                   leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
//                   //leading: (images.elementAt(i) != "" && images.elementAt(i) != null) ? Image.network(images.elementAt(i)) : Image.asset('assets/nullimage.png'),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//   );
// }

Widget favorites(User currUser){
  return FavoriteTemplate(user: currUser);
}

class FavoriteTemplate extends StatefulWidget {
  const FavoriteTemplate({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  _FavoriteTemplateState createState() => _FavoriteTemplateState();
}

class _FavoriteTemplateState extends State<FavoriteTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(
        itemCount: widget.user.favorites.length, //replace 5 with the length of the favorites array
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              child: InkWell(
                onTap: () {
                  recipePage(widget.user, widget.user.favorites[index].recipe);
                  //jump to recipe page
                },
                onLongPress: () {
                  print("card $index long pressed");
                  //pop out a menu
                },
                child: ListTile(
                  title: Text("$index title filler"), //replace text with favorite recipe name
                  leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
                  trailing: IconButton(
                    onPressed: () {
                      //print("$index Unfavorited");
                      setState((){
                        widget.user.favorites[index].isFavorite ? widget.user.favorites[index].isFavorite = false : widget.user.favorites[index].isFavorite = true;
                      });

                      //remove item from the favorite list
                    },
                    icon: widget.user.favorites[index].isFavorite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded),
                    color: Colors.red[600],
                    splashRadius: 30,
                    iconSize: 25,
                  ),
                ),
              ),

            ),
          );
        },
      ),
      //),
    );
  }
}


// class _FavoriteTemplateState extends State<FavoriteTemplate> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("demo favorites")),
//       ),
//       body:
//       //Container(
//       //child:
//       ListView.builder(
//         itemCount: widget.isFavorited.length, //replace 5 with the length of the favorites array
//         itemBuilder: (context, index) {
//           return Card(
//             child: Container(
//               child: InkWell(
//                 onTap: () {
//                   print("card $index tapped");
//                   //jump to recipe page
//                 },
//                 onLongPress: () {
//                   print("card $index long pressed");
//                   //pop out a menu
//                 },
//                 child: ListTile(
//                   title: Text("$index title filler"), //replace text with favorite recipe name
//                   leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
//                   trailing: IconButton(
//                     onPressed: () {
//                       //print("$index Unfavorited");
//                       setState((){
//                         widget.isFavorited[index] ? widget.isFavorited[index] = false : widget.isFavorited[index] = true;
//                       });
//
//                       //remove item from the favorite list
//                     },
//                     icon: widget.isFavorited[index] ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded),
//                     color: Colors.red[600],
//                     splashRadius: 30,
//                     iconSize: 25,
//                   ),
//                 ),
//               ),
//
//             ),
//           );
//         },
//       ),
//       //),
//     );
//   }
// }

// Widget favorites(){
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("demo favorites"),
//     ),
//     body:
//     //Container(
//       //child:
//       ListView.builder(
//         itemCount: 5, //replace 5 with the length of the favorites array
//         itemBuilder: (context, index) {
//           return Card(
//             child: Container(
//               child: InkWell(
//                   onTap: () {
//                     print("card $index tapped");
//                     //jump to recipe page
//                   },
//                   onLongPress: () {
//                     print("card $index long pressed");
//                     //pop out a menu
//                   },
//                   child: ListTile(
//                       title: Text("$index title filler"), //replace text with favorite recipe name
//                       leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
//                       trailing: IconButton(
//                         onPressed: () {
//                           print("$index Unfavorited");
//                           //remove item from the favorite list
//                         },
//                         icon: Icon(Icons.favorite_rounded),
//                         color: Colors.red[600],
//                         splashRadius: 30,
//                         iconSize: 25,
//                       ),
//                   ),
//               ),
//
//             ),
//           );
//         },
//       ),
//     //),
//   );
// }