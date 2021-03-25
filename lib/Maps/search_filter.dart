import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Maps/places_search_map.dart';

class SearchFilter extends StatefulWidget {
  final Function updateKeyword;

  SearchFilter(this.updateKeyword);

  @override
  State<StatefulWidget> createState() {
    return _SearchFilter(updateKeyword);
  }
}

class _SearchFilter extends State<SearchFilter> {
  static final List<String> filterOptions = <String>[
    "Bakery",
    "Bar",
    "Cafe",
    "Restaurant",
    "Supermarket"
  ];

  static const String _KEY_SELECTED_POSITION = "position";
  static const String _KEY_SELECTED_VALUE = "value";

  int _selectedPosition = 0;
  final Function updateKeyword;

  _SearchFilter(this.updateKeyword);

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: subAccentColor,
        appBar: AppBar(
          backgroundColor: themeColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: Text('Place preferences'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              selected: _selectedPosition == 0,
              leading: Icon(Icons.cake, color: accentColor,),
              title: _selectedPosition == 0 ? Text(filterOptions[0], style: TextStyle(color: accentColor,)) : Text(filterOptions[0], style: TextStyle(color: Colors.black,)),
              onTap: () {
                _saveKeywordPreference(0);
                Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       backgroundColor: subAccentColor,
                //       behavior: SnackBarBehavior.floating,
                //       duration: Duration(seconds: 5,),
                //       content: Text("${filterOptions[0]} selected.", style: TextStyle(color: Colors.black,),),
                //       action: SnackBarAction(
                //         label: "Dismiss",
                //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                //       ),
                //     )
                // );
                // searchNearby(latitude, longitude);
              },
              trailing: _getIcon(0),
            ),
            ListTile(
              selected: _selectedPosition == 1,
              leading: Icon(Icons.local_bar, color: accentColor),
              title: _selectedPosition == 1 ? Text(filterOptions[1], style: TextStyle(color: accentColor,)) : Text(filterOptions[1], style: TextStyle(color: Colors.black,)),
              onTap: () {
                _saveKeywordPreference(1);
                Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       backgroundColor: subAccentColor,
                //       behavior: SnackBarBehavior.floating,
                //       duration: Duration(seconds: 5,),
                //       content: Text("${filterOptions[1]} selected.", style: TextStyle(color: Colors.black,),),
                //       action: SnackBarAction(
                //         label: "Dismiss",
                //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                //       ),
                //     )
                // );
              },
              trailing: _getIcon(1),
            ),
            ListTile(
              selected: _selectedPosition == 2,
              leading: Icon(Icons.local_cafe, color: accentColor),
              title: _selectedPosition == 2 ? Text(filterOptions[2], style: TextStyle(color: accentColor,)) : Text(filterOptions[2], style: TextStyle(color: Colors.black,)),
              onTap: () {
                _saveKeywordPreference(2);
                Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       backgroundColor: subAccentColor,
                //       behavior: SnackBarBehavior.floating,
                //       duration: Duration(seconds: 5,),
                //       content: Text("${filterOptions[2]} selected.", style: TextStyle(color: Colors.black,),),
                //       action: SnackBarAction(
                //         label: "Dismiss",
                //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                //       ),
                //     )
                // );
              },
              trailing: _getIcon(2),
            ),
            ListTile(
              selected: _selectedPosition == 3,
              leading: Icon(Icons.local_dining, color: accentColor),
              title: _selectedPosition == 3 ? Text(filterOptions[3], style: TextStyle(color: accentColor,)) : Text(filterOptions[3], style: TextStyle(color: Colors.black,)),
              onTap: () {
                _saveKeywordPreference(3);
                Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       backgroundColor: subAccentColor,
                //       behavior: SnackBarBehavior.floating,
                //       duration: Duration(seconds: 5,),
                //       content: Text("${filterOptions[3]} selected.", style: TextStyle(color: Colors.black,),),
                //       action: SnackBarAction(
                //         label: "Dismiss",
                //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                //       ),
                //     )
                // );
              },
              trailing: _getIcon(3),
            ),
            ListTile(
              selected: _selectedPosition == 4,
              leading: Icon(Icons.local_grocery_store, color: accentColor),
              title: _selectedPosition == 4 ? Text(filterOptions[4], style: TextStyle(color: accentColor,)) : Text(filterOptions[4], style: TextStyle(color: Colors.black,)),
              onTap: () {
                _saveKeywordPreference(4);
                Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       backgroundColor: subAccentColor,
                //       behavior: SnackBarBehavior.floating,
                //       duration: Duration(seconds: 5,),
                //       content: Text("${filterOptions[4]} selected.", style: TextStyle(color: Colors.black,),),
                //       action: SnackBarAction(
                //         label: "Dismiss",
                //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                //       ),
                //     )
                // );
              },
              trailing: _getIcon(4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon(int value) {
    return Builder(
      builder: (BuildContext context) {
        if (value == _selectedPosition) {
          return Icon(Icons.check, color: accentColor,);
        } else {
          return SizedBox(
            width: 50,
          );
        }
      },
    );
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPosition = prefs.getInt(_KEY_SELECTED_POSITION) ?? 0;
    });
  }

  void _saveKeywordPreference(int position) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedPosition = position;
      prefs.setString(_KEY_SELECTED_VALUE, filterOptions[position]);
      prefs.setInt(_KEY_SELECTED_POSITION, position);
      updateKeyword(filterOptions[position]);
    });
  }
}
