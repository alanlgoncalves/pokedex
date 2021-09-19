import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';

class PokeballWidget extends StatelessWidget {
  final double size;
  final Color color;

  const PokeballWidget({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(83, (83 * 1.0040160642570282).toDouble()),
      painter: PokeballLogoPainter(
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
