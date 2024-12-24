import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonTypeItemWidget extends StatelessWidget {
  final String type;
  final Color? color;
  final VoidCallback onClick;

  const PokemonTypeItemWidget(
      {Key? key,
      required this.type,
      required this.onClick,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onClick,
      enableFeedback: true,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? color
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          border: Border.fromBorderSide(
            BorderSide(color: AppTheme.getColors(context).tabDivisor),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.08),
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(
                0.0,
                4.0,
              ),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned(
                bottom: -15,
                right: -15,
                child: Container(
                  child: CustomPaint(
                    size: Size(83, (83 * 1.0040160642570282).toDouble()),
                    painter: PokeballLogoPainter(
                      color: AppTheme.getColors(context)
                          .pokeballLogoGray
                          .withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -45,
                left: -45,
                child: Container(
                  child: CustomPaint(
                    size: Size(83, (83 * 1.0040160642570282).toDouble()),
                    painter: PokeballLogoPainter(
                      color: AppTheme.getColors(context)
                          .pokeballLogoGray
                          .withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        type,
                        style: textTheme.bodyLarge,
                      ),
                      Image.asset(
                        AppConstants.pokemonTypeLogo(type, size: 60),
                        width: 60,
                        height: 60,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
