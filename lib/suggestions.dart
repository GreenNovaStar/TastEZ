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
          return child;
        }else{
          child = Container(height:0.0, width: 0.0);
          print("no data received");
          return Container();
        }

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

//todo: get refresh to work
Future<Null> _refreshSuggestions() async{
  user.getHomeSuggestion();
  print('refreshing recipes...');
}

// Future<Recipe> _refreshSuggestions(user) async{
//   print('refreshing recipes...');
//   return user.getHomeSuggestion();
// }

class _SuggestionListTemplateState extends State<SuggestionListTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: subAccentColor,
      child: RefreshIndicator(
        onRefresh: _refreshSuggestions(),
        //onRefresh: (widget.currUser) => {widget.currUser.getHomeSuggestion();},
        color: themeColor,
        child: ListView.builder(
          itemCount: widget.currUser.getSuggestCount() > 0 ? widget.currUser.getSuggestCount() : 0,
          itemBuilder: (context, i) {
            return Card(
              color: subAccentColor,
              elevation: 0.2,
              child: ListTile(
                title: (widget.response.data.recipes.elementAt(i).title.toString() != null) ? Text(widget.response.data.recipes[i].title.toString()) : Text("PLACEHOLDER"),
                leading: (widget.response.data.recipes[i].image.toString() != "" && widget.response.data.recipes[i].image.toString() != "null") ? Image.network(widget.response.data.recipes[i].image.toString()) : Image.asset('assets/nullimage.png'),
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
            ),);},),
      ),
    );
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
