import 'package:flutter/cupertino.dart';
import 'package:mortage_calculator/helpers/custom_colors.dart';

class ProgressCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var strokeWidth = 10.0;
    Paint outerCircle = Paint();
    ..strokeWidth = strokeWidth;
    ..color = CustomColors.lightPurple;
    ..style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
