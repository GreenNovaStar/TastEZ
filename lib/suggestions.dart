import 'package:flutter/material.dart';
import 'user.dart';
import 'recipe.dart';
import 'home.dart';

Widget suggestions(User user){
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    user.getHomeSuggestion();
  }
  // FutureBuilder<Recipe>(
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
  //
  //
  // return Container(
  //     child:
  //         RefreshIndicator(
  //           onRefresh: refreshList,
  //           child:
  //             ListView.builder(
  //               physics: const AlwaysScrollableScrollPhysics(),
  //               itemCount: 5, //replace 5 with the length of the favorites array
  //               itemBuilder: (context, index) {
  //                 return Card(
  //                   child: Container(
  //                     child: InkWell(
  //                       onTap: () {
  //                         print("card $index tapped");
  //                         //jump to recipe page
  //                       },
  //                       child: ListTile(
  //                         title: Text("$index title filler"), //replace text with favorite recipe name
  //                         //title: (titles.elementAt(i) != null) ? Text(titles.elementAt(i)) : Text("PLACEHOLDER"),
  //                         leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
  //                         //leading: (images.elementAt(i) != "" && images.elementAt(i) != null) ? Image.network(images.elementAt(i)) : Image.asset('assets/nullimage.png'),
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //         ),
  // );
  return Image.asset('assets/nullimage.png');
}

// class Suggestions extends Home{
//   Future<List<Recipe>> _listFuture;
//
//   @override
//   void initState() {
//     //super.initState();
//
//     // initial load
//     _listFuture = updateAndGetList();
//   }
//
//   void refreshList() {
//     // reload
//     setState(() {
//       _listFuture = updateAndGetList();
//     });
//   }
//
//   Future<List<Recipe>> updateAndGetList() async {
//     await widget.getHomeSuggestion();
//
//     // return the list here
//     return widget.feeds.getList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new FutureBuilder<List<Recipe>>(
//       future: _listFuture,
//       builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return new Center(
//             child: new CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return new Text('Error: ${snapshot.error}');
//         } else {
//           final items = snapshot.data ?? <Recipe>[]; // handle the case that data is null
//
//           return new Scrollbar(
//             child: new RefreshIndicator(
//               child: ListView.builder(
//                 physics: const AlwaysScrollableScrollPhysics(), //Even if zero elements to update scroll
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Container(
//                       child: InkWell(
//                         onTap: () {
//                           print("card $index tapped");
//                           //jump to recipe page
//                         },
//                         child: ListTile(
//                           title: Text("$index title filler"), //replace text with favorite recipe name
//                           //title: (titles.elementAt(i) != null) ? Text(titles.elementAt(i)) : Text("PLACEHOLDER"),
//                           leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
//                           //leading: (images.elementAt(i) != "" && images.elementAt(i) != null) ? Image.network(images.elementAt(i)) : Image.asset('assets/nullimage.png'),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               onRefresh: refreshList,
//             ),
//           );
//         }
//       },
//     );
//   }
// }
//
//
