import 'package:flutter/material.dart';

class BottomIconNavigation extends StatefulWidget {

  Icon icon;
  PageController controller;
  BottomIconNavigation({@required icon, @required controller});

  @override
  _BottomIconNavigationState createState() => _BottomIconNavigationState();
}

class _BottomIconNavigationState extends State<BottomIconNavigation> {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: widget.icon,
      onPressed: (){
        widget.controller.jumpToPage(0);
        print(widget.controller.page);
      },
      color: widget.controller.hasClients && widget.controller.page.toInt() == 0 ? Colors.redAccent : Colors.white,
    );
  }
}
