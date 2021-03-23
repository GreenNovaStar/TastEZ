import 'package:flutter/material.dart';
import 'package:tastez/GUI/AppBar/AppBar.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';

class AppBarV2 extends StatefulWidget implements PreferredSizeWidget{

  final Size preferredSize;
  AppBarV2({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  _AppBarV2State createState() => _AppBarV2State();

}

class _AppBarV2State extends State<AppBarV2> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MaterialButton(
        //onPressed: onLogoPressed,
        onPressed: () => bodyNavigatorKey.currentState.pushReplacementNamed('/suggestions'),
        child: SizedBox(height: 33, child: Image.asset('assets/TastEZ_whitetext.png')),
      ),
    );
  }
}
