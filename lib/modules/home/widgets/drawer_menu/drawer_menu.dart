import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/modules/home/widgets/drawer_menu/widgets/menu_item.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class DrawerMenuWidget extends StatefulWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _controller.value * 2 * pi,
                          child: child,
                        );
                      },
                      child: CustomPaint(
                        size: Size(
                            24,
                            (24 * 1.0040160642570282)
                                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: PokeballLogoPainter(
                          color: AppTheme.colors.pokeballLogoBlack,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Pokedex", style: AppTheme.texts.homePageTitle),
                  ],
                ),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 70),
                  children: [
                    DrawerMenuItemWidget(
                        color: Color(0xFF50C1A6), text: "Pokedex"),
                    DrawerMenuItemWidget(
                        color: Color(0xFFFF8D82), text: "Moves"),
                    DrawerMenuItemWidget(
                        color: Color(0xFF59ABF6), text: "Abilities"),
                    DrawerMenuItemWidget(
                        color: Color(0xFFFFCE4B), text: "Items"),
                    DrawerMenuItemWidget(
                        color: Color(0xFF7C538C), text: "Locations"),
                    DrawerMenuItemWidget(
                        color: Color(0xFFB1736C), text: "Type Charts"),
                  ],
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Lottie.asset(
            AppConstants.diglettLottie,
            height: 200.0,
          ),
        ),
      ],
    );
  }
}
