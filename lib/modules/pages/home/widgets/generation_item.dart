import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/theme/app_theme.dart';

class GenerationItemWidget extends StatelessWidget {
  final Generation generation;
  final Color color;
  final VoidCallback onClick;

  const GenerationItemWidget(
      {Key? key,
      required this.generation,
      required this.onClick,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: true,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: Border.fromBorderSide(
              BorderSide(color: AppTheme.colors.tabDivisor),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF000000).withOpacity(0.08),
                blurRadius: 4.0,
                spreadRadius: 3.0,
                offset: Offset(
                  0.0,
                  4.0,
                ),
              ),
            ]),
        child: Stack(
          children: [
            Positioned(
              bottom: -15,
              right: -3,
              child: Container(
                child: CustomPaint(
                  size: Size(83, (83 * 1.0040160642570282).toDouble()),
                  painter: PokeballLogoPainter(
                    color: AppTheme.colors.pokeballLogoGray,
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
                      generation.description,
                      style: AppTheme.texts.pokemonTabTitle,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/pokemons_generations/generation_${generation.number}/1.png",
                          width: 46,
                          height: 46,
                        ),
                        Image.asset(
                          "assets/images/pokemons_generations/generation_${generation.number}/2.png",
                          width: 46,
                          height: 46,
                        ),
                        Image.asset(
                          "assets/images/pokemons_generations/generation_${generation.number}/3.png",
                          width: 46,
                          height: 46,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
