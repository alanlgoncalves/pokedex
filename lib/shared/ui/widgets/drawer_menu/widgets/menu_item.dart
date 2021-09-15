import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/theme/app_theme.dart';

class DrawerMenuItemWidget extends StatelessWidget {
  final Color color;
  final String text;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const DrawerMenuItemWidget(
      {Key? key,
      required this.color,
      required this.text,
      this.height = 60,
      this.width = 155,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Positioned(
                  top: -12,
                  right: -14,
                  child: CustomPaint(
                    size: Size(83, (83 * 1.0040160642570282).toDouble()),
                    painter: PokeballLogoPainter(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  left: -50,
                  child: CustomPaint(
                    size: Size(83, (83 * 1.0040160642570282).toDouble()),
                    painter: PokeballLogoPainter(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        text,
                        style: AppTheme.texts.drawerMenuItem,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
