import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/Pages/ShoppingListElement.dart';
import 'package:tastez/Middleware/user.dart';
import 'package:tastez/mainmap.dart';
import 'package:tastez/maps.dart';
// class ShoppingListElement{
//   String ingredient;
//   bool   crossedOff;
//   ShoppingListElement({this.ingredient, this.crossedOff});
// }


class _ShoppingListState extends State<ShoppingList> {
  //final List<String> _shoppingList = <String>[];//create a list to store strings
  List<ShoppingListElement> _shoppingList = [];
  final TextEditingController _textFieldController = TextEditingController();//create variable to get text input

  //adds a test item
  void addTest(){
    setState(() {
      //_shoppingList.add("Apples");
    });
  }


  //adds layout which includes the button
  @override
  Widget build(BuildContext context) {
    if(widget.currUser.shopping != null){
      _shoppingList = widget.currUser.shopping;
    }

    return Scaffold(
      backgroundColor: subAccentColor,
      resizeToAvoidBottomInset: false,
        body: //ListView(children: _getItems()),
          ListView.builder(
              itemCount: (_shoppingList == null) ? 0 : _shoppingList.length,
              shrinkWrap: true,
              itemBuilder: (context, i){
                return ListTile(
                  title: (_shoppingList[i].crossedOff && _shoppingList != null && _shoppingList[i].ingredient != "") ? Text(" • " + _shoppingList[i].ingredient, style: TextStyle(decoration: TextDecoration.lineThrough)) : Text(" • " + _shoppingList[i].ingredient, style: TextStyle(decoration: TextDecoration.none)),
                  onTap: () {
                    if(_shoppingList != null){
                      setState(() {_shoppingList[i].crossedOff = true;});
                    }
                  },
                  onLongPress: (){
                    if(_shoppingList != null){
                      setState(() {_shoppingList[i].crossedOff = false;});
                    }
                  },
                );
              }
          ),
        floatingActionButton: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 80),
              child: new FloatingActionButton.extended(
                heroTag: "btn1",
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample()));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MapSample()),);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapsSampleApp()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => GoogleMapsSampleApp()));
                },
                label: Text("Nearby\nStores"),
                icon: Icon(Icons.store),
                backgroundColor: themeColor,
                foregroundColor: Colors.black,
                elevation: 1,
              ),
            ),

            // IconButton(
            //   icon: Icon(Icons.map_outlined),
            //   onPressed:() => Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => GoogleMapsSampleApp())),
            // ),

            //add ingredient button
            Padding(
              padding: const EdgeInsets.fromLTRB(98, 0, 0, 80),
              child: new FloatingActionButton.extended(
                heroTag: "btn2",
                onPressed: () => _displayDialog(context),
                icon: Icon(Icons.add),
                label: Text("New\nIngredient"),
                tooltip: 'Add Item',
                backgroundColor: themeColor,
                foregroundColor: Colors.black,
                elevation: 1,
              ),
            ),
          ],
        ),

    );
  }

  void _addShoppingItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    if(title != ""){
      setState(() {
        _shoppingList.add(ShoppingListElement(ingredient: title.trim(), crossedOff: false));
      });
    }
    _textFieldController.clear();
  }

  //make checkboxes false from the beginning
  bool _isSelected = false;
  // Generate list of item widgets
  Widget _buildShoppingItem(String title) {
    print("title = $title");
    return Column(
      children:[
        ListTile(
          title: Text(title),
          //onTap:
        ),
      ]
    );
    //   CheckboxListTile(title: Text(title),
    //   value: _isSelected,
    //   onChanged: (bool value) {
    //     setState(() {
    //       _isSelected = value;
    //     });
    //   },
    // );
  }

  // Generate a single item widget
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add an ingredient to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter ingredient here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addShoppingItem(_textFieldController.text);
                  //add a check to see whether input is empty if empty
                  //add an alert that says not valid input?
                },

              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // List<Widget> _getItems() {
  //   final List<Widget> _shopWidgets = <Widget>[];
  //   for (String title in _shoppingList) {
  //     _shopWidgets.add(_buildShoppingItem(title));
  //   }
  //   return  _shopWidgets;
  // }
}

//void main() => runApp(shopList());
class ShoppingList extends StatefulWidget {
  const ShoppingList({
    Key key,
    @required this.currUser,
  }) : super(key: key);
  final User currUser;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

@override
Widget shopList(User currUser) {
  // return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.amber,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     title: 'Shopping List', home: ShoppingList(currUser: currUser));

  return ShoppingList(currUser: currUser);
}