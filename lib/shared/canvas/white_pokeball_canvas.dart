import 'package:flutter/material.dart';

class PokeballLogoPainter extends CustomPainter {
  final Color color;

  const PokeballLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.5406080);
    path_0.lineTo(size.width * 0.7405261, size.height * 0.5406080);
    path_0.cubicTo(
        size.width * 0.7209799,
        size.height * 0.6553120,
        size.width * 0.6207309,
        size.height * 0.7426560,
        size.width * 0.5000000,
        size.height * 0.7426560);
    path_0.cubicTo(
        size.width * 0.3792691,
        size.height * 0.7426560,
        size.width * 0.2790197,
        size.height * 0.6553120,
        size.width * 0.2594731,
        size.height * 0.5406080);
    path_0.lineTo(0, size.height * 0.5406080);
    path_0.cubicTo(
        size.width * 0.02091671,
        size.height * 0.7974040,
        size.width * 0.2367851,
        size.height * 0.9993080,
        size.width * 0.5000000,
        size.height * 0.9993080);
    path_0.cubicTo(
        size.width * 0.7632169,
        size.height * 0.9993080,
        size.width * 0.9790843,
        size.height * 0.7974040,
        size.width,
        size.height * 0.5406080);
    path_0.close();
    path_0.moveTo(size.width * 0.9995261, size.height * 0.4532400);
    path_0.lineTo(size.width * 0.7395301, size.height * 0.4532400);
    path_0.cubicTo(
        size.width * 0.7177791,
        size.height * 0.3412344,
        size.width * 0.6188072,
        size.height * 0.2566532,
        size.width * 0.5000000,
        size.height * 0.2566532);
    path_0.cubicTo(
        size.width * 0.3811924,
        size.height * 0.2566532,
        size.width * 0.2822189,
        size.height * 0.3412344,
        size.width * 0.2604687,
        size.height * 0.4532400);
    path_0.lineTo(size.width * 0.0004748956, size.height * 0.4532400);
    path_0.cubicTo(size.width * 0.02398406, size.height * 0.1990480,
        size.width * 0.2386534, 0, size.width * 0.5000000, 0);
    path_0.cubicTo(
        size.width * 0.7613454,
        0,
        size.width * 0.9760161,
        size.height * 0.1990480,
        size.width * 0.9995261,
        size.height * 0.4532400);
    path_0.close();
    path_0.moveTo(size.width * 0.6676707, size.height * 0.4996560);
    path_0.cubicTo(
        size.width * 0.6676707,
        size.height * 0.5918880,
        size.width * 0.5926024,
        size.height * 0.6666560,
        size.width * 0.5000000,
        size.height * 0.6666560);
    path_0.cubicTo(
        size.width * 0.4073976,
        size.height * 0.6666560,
        size.width * 0.3323281,
        size.height * 0.5918880,
        size.width * 0.3323281,
        size.height * 0.4996560);
    path_0.cubicTo(
        size.width * 0.3323281,
        size.height * 0.4074240,
        size.width * 0.4073976,
        size.height * 0.3326532,
        size.width * 0.5000000,
        size.height * 0.3326532);
    path_0.cubicTo(
        size.width * 0.5926024,
        size.height * 0.3326532,
        size.width * 0.6676707,
        size.height * 0.4074240,
        size.width * 0.6676707,
        size.height * 0.4996560);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
