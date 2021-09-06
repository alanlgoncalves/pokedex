import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.04385965, size.height * 0.08064516),
        size.width * 0.04385965, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.2719298, size.height * 0.08064516),
        size.width * 0.04385965, paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.08064516),
        size.width * 0.04385965, paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.7280702, size.height * 0.08064516),
        size.width * 0.04385965, paint3Fill);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.9561404, size.height * 0.08064516),
        size.width * 0.04385965, paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.04385965, size.height * 0.5000000),
        size.width * 0.04385965, paint5Fill);

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.2719298, size.height * 0.5000000),
        size.width * 0.04385965, paint6Fill);

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.04385965, paint7Fill);

    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.7280702, size.height * 0.5000000),
        size.width * 0.04385965, paint8Fill);

    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.9561404, size.height * 0.5000000),
        size.width * 0.04385965, paint9Fill);

    Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.04385965, size.height * 0.9193548),
        size.width * 0.04385965, paint10Fill);

    Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.2719298, size.height * 0.9193548),
        size.width * 0.04385965, paint11Fill);

    Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.9193548),
        size.width * 0.04385965, paint12Fill);

    Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.7280702, size.height * 0.9193548),
        size.width * 0.04385965, paint13Fill);

    Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.9561404, size.height * 0.9193548),
        size.width * 0.04385965, paint14Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
