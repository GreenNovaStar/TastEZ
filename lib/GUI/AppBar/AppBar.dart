import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';

class AppBarCustomPainter extends CustomPainter{
// class AppBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = themeColor
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0,0);
    path_0.lineTo(size.width,0);
    path_0.quadraticBezierTo(size.width,size.height*0.29,size.width,size.height*0.39);
    path_0.cubicTo(size.width*1.00,size.height*0.66,size.width*0.96,size.height*0.66,size.width*0.88,size.height*0.67);
    path_0.cubicTo(size.width*0.71,size.height*0.67,size.width*0.39,size.height*0.67,size.width*0.21,size.height*0.67);
    path_0.cubicTo(size.width*0.12,size.height*0.67,size.width*0.12,size.height*1.00,0,size.height);
    path_0.quadraticBezierTo(0,size.height*0.75,0,0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}