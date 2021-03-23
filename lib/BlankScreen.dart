import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {

  String routeName;
  BlankScreen({this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("Filler Page from $routeName")));
  }
}
