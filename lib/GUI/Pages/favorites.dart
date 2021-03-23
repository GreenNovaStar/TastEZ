import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/user.dart';
import 'recipe.dart';

import 'package:flutter/cupertino.dart';

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

    //widget.user.favorites.sort((a,b) => a.recipe.title.toLowerCase().compareTo(b.recipe.title.toLowerCase())); //alphabetically sort the favorites list

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(child: ListView.builder(
        itemCount: widget.user.favorites.length, //replace 5 with the length of the favorites array
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            color: subAccentColor,
            child: Container(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => recipePage(widget.user, widget.user.favorites[index].recipe))),
                //jump to recipe page

                onLongPress: () {
                  print("card $index long pressed");
                  //pop out a menu
                },
                child: ListTile(
                  title: Text("${widget.user.favorites[index].recipe.title}"), //replace text with favorite recipe name
                  leading: (widget.user.favorites[index].recipe.image.toString() != "" && widget.user.favorites[index].recipe.image.toString() != null) ? Image.network(widget.user.favorites[index].recipe.image.toString()) : Image.asset('assets/nullimage.png'),
                  trailing: IconButton(
                    onPressed: () {
                      //print("$index Unfavorited");
                      setState((){
                        if(widget.user.favorites[index].isFavorite){
                          widget.user.favorites[index].isFavorite = false;
                          widget.user.favorites.removeAt(index);
                        }else{
                          //widget.user.favorites[index].isFavorite = true;
                        }
                        //widget.user.favorites[index].isFavorite ? widget.user.favorites[index].isFavorite = false : widget.user.favorites[index].isFavorite = true;
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
      ),
    );
  }
}

