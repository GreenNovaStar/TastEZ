import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'recipe.dart';
import 'home.dart';
import 'favorites.dart';


Widget suggestions(User currUser){

  return FutureBuilder<Recipe>(
      future: currUser.getHomeSuggestion(),
      builder: (BuildContext context, AsyncSnapshot<Recipe> response) {
        Widget child;
        if (response.hasData) {
          print("data recieved");
          child = Container(child: SuggestionListTemplate(response: response, currUser: currUser,));
        }else{
          print("no data received");
        }
        return child;
      }
  );
}

class SuggestionListTemplate extends StatefulWidget {
  const SuggestionListTemplate({
    Key key,
    this.response,
    //this.suggestCount,
    this.currUser,
  }) : super(key: key);
  final AsyncSnapshot<Recipe> response;
  //final int suggestCount;
  final User currUser;

  @override
  _SuggestionListTemplateState createState() => _SuggestionListTemplateState();
}

class _SuggestionListTemplateState extends State<SuggestionListTemplate> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.currUser.getSuggestCount() > 0 ? widget.currUser.getSuggestCount() : 0,
      itemBuilder: (context, i) {
        return Card(child: ListTile(
          title: (widget.response.data.recipes.elementAt(i).title.toString() != null) ? Text(widget.response.data.recipes[i].title.toString()) : Text("PLACEHOLDER"),
          leading: (widget.response.data.recipes[i].image.toString() != "" && widget.response.data.recipes[i].image.toString() != null) ? Image.network(widget.response.data.recipes[i].image.toString()) : Image.asset('assets/nullimage.png'),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[i]))),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                int indexOfFavoritedItem = inFavoriteList(widget.currUser.favorites, widget.response.data.recipes.elementAt(i).title.toString());
                if(indexOfFavoritedItem != -1){ //if item is in the favorite list,
                  if(widget.currUser.favorites[indexOfFavoritedItem].isFavorite){ //check if the item is favorited
                    widget.currUser.favorites[indexOfFavoritedItem].isFavorite = false; //then unfavorite it
                    widget.currUser.favorites.removeAt(indexOfFavoritedItem); //then remove the item from the favorites array
                  }else{
                    //nothing should really happen here
                    print('testing to see if something happens here');
                  }
                }else{ //since item is not in the favorites list, add it to the favorites list
                  widget.currUser.favorites.add(Favorites(recipe: widget.response.data.recipes[i], isFavorite: true)); //then set it to be favorited
                }
              });
            },
            icon: (widget.currUser.favorites.length != null) ?
                      ((inFavoriteList(widget.currUser.favorites, widget.response.data.recipes.elementAt(i).title.toString())) != -1 ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded)) :
                      Icon(Icons.favorite_border_rounded),
            color: Colors.red[600],
            splashRadius: 30,
            iconSize: 25,
          ),
        ),);},);
  }
}

int inFavoriteList(List<Favorites> favoriteList, String recipeName){
  for(int i = 0; i < favoriteList.length; i++){
    if(favoriteList[i].recipe.title.toString() == recipeName){
      return i;
    }
  }
  return -1;
}

// Widget suggestions(User currUser, int _suggestCount){
//   return FutureBuilder<Recipe>(
//       future: currUser.getHomeSuggestion(),
//       builder: (BuildContext context, AsyncSnapshot<Recipe> response) {
//         Widget child;
//         if (response.hasData) {
//           child = Container(child: ListView.builder(
//             itemCount: _suggestCount,
//             itemBuilder: (context, i) {
//               return RecipeCardTemplate(response: response, index: i, currUser: currUser);
//             },
//           ));
//         }
//         return Container(child:child);
//       },
//   );
// }
//
// class RecipeCardTemplate extends StatefulWidget {
//   const RecipeCardTemplate({
//     Key key,
//     @required this.response,
//     @required this.index,
//     @required this.currUser,
//   }) : super(key: key);
//   final AsyncSnapshot<Recipe> response;
//   final int index;
//   final User currUser;
//   @override
//   _RecipeCardTemplateState createState() => _RecipeCardTemplateState();
// }
//
// class _RecipeCardTemplateState extends State<RecipeCardTemplate> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(child: ListTile(
//       title: (widget.response.data.recipes.elementAt(widget.index).title.toString() != null) ? Text(widget.response.data.recipes[widget.index].title.toString()) : Text("PLACEHOLDER"),
//       leading: (widget.response.data.recipes[widget.index].image.toString() != "" && widget.response.data.recipes[widget.index].image.toString() != null) ? Image.network(widget.response.data.recipes[widget.index].image.toString()) : Image.asset('assets/nullimage.png'),
//       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.currUser, widget.response.data.recipes[widget.index]))),
//       trailing: IconButton(
//         onPressed: () {
//           int indexOfFavoritedItem = inFavoriteList(widget.currUser.favorites, widget.response.data.recipes.elementAt(widget.index).title.toString());
//           setState(() {
//             if(indexOfFavoritedItem != -1){//check if item is in the favorites array
//
//               if(!widget.currUser.favorites[indexOfFavoritedItem].isFavorite){
//                 //if recipe isnt favorited then favorite it
//                 widget.currUser.favorites[indexOfFavoritedItem].isFavorite = true;
//               }else{
//                 //else if recipe is favorited then unfavorite it
//                 widget.currUser.favorites[indexOfFavoritedItem].isFavorite = false;
//                 widget.currUser.favorites.removeAt(indexOfFavoritedItem);
//               }
//             }else{
//               print("did i get error here? recipe = ${widget.response.data.recipes.elementAt(widget.index).title.toString()}");
//               widget.currUser.favorites.add(Favorites(recipe: widget.response.data.recipes[widget.index], isFavorite: true));
//               print(widget.currUser.favorites[0].recipe.title.toString());
//             }
//           });
//         },
//         //icon: defaultUser.favorites[i].isFavorite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded),
//         icon: (widget.currUser.favorites.length != 0) ? (widget.currUser.favorites[widget.index].isFavorite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded)) : Icon(Icons.favorite_border_rounded),
//         color: Colors.red[600],
//         splashRadius: 30,
//         iconSize: 25,
//       ),
//     ),);
//   }
// }
