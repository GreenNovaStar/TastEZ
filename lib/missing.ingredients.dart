import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

import 'package:flutter/cupertino.dart';

Widget missingIngredient(){
  return Scaffold(
    appBar: AppBar(
      title: Text('demo missing ingredients'),
    ),
    body:
    Container(
      child:
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
                child: ListTile(
                  title: (index % 3 == 0) ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
                  leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
                  trailing: (index % 3 == 0) ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}