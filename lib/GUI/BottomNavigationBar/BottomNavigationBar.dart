import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';

class BNBCustomPainter extends CustomPainter{
  //link to bottom navigation design
  //https://www.youtube.com/watch?v=1ToqYMSnNhA
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = themeColor..style = PaintingStyle.fill; //color for bottom navigation
    Path path = Path()..moveTo(0,20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}