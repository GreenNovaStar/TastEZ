import 'package:flutter/material.dart';
import 'home.dart';

class ShoppingListElement{
  String ingredient;
  bool   crossedOff;
  ShoppingListElement({this.ingredient, this.crossedOff});
}


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
    return Scaffold(
        body: //ListView(children: _getItems()),
          ListView.builder(
              itemCount: (_shoppingList == null) ? 0 : _shoppingList.length,
              itemBuilder: (context, i){
                return ListTile(
                  title: (_shoppingList[i].crossedOff && _shoppingList != null) ? Text(_shoppingList[i].ingredient, style: TextStyle(decoration: TextDecoration.lineThrough)) : Text(_shoppingList[i].ingredient, style: TextStyle(decoration: TextDecoration.none)),
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _displayDialog(context),
          icon: Icon(Icons.add),
          label: Text("New\nIngredient"),
          tooltip: 'Add Item',
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        )
    );
  }

  void _addShoppingItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    if(title != ""){
      setState(() {
        _shoppingList.add(ShoppingListElement(ingredient: title, crossedOff: false));
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
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

@override
Widget shopList() {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Shopping List', home: ShoppingList());
}