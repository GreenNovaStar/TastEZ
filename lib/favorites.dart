import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';

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


Widget favorites(){
  return Scaffold(
    appBar: AppBar(
      title: Text("demo favorites"),
    ),
    body:
    //Container(
      //child:
      ListView.builder(
        itemCount: 5, //replace 5 with the length of the favorites array
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              child: InkWell(
                  onTap: () {
                    print("card $index tapped");
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
                          print("$index Unfavorited");
                          //remove item from the favorite list
                        },
                        icon: Icon(Icons.favorite_rounded),
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