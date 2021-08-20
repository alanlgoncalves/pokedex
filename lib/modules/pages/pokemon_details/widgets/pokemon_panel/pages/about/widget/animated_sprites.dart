import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/theme/app_theme.dart';

class AnimatedSpritesWidget extends StatelessWidget {
  final Sprites sprites;
  final bool isShiny;

  AnimatedSpritesWidget({
    Key? key,
    required this.sprites,
    required this.isShiny,
  }) : super(key: key);

  String get frontTitle =>
      isShiny ? "Back animated \n shiny sprite" : "Front animated \n sprite";

  String get backTitle =>
      isShiny ? "Back animated \n shiny sprite" : "Front animated \n sprite";

  String get frontUrl => isShiny
      ? sprites.frontShinyAnimatedSpriteUrl!
      : sprites.frontAnimatedSpriteUrl!;

  String get backUrl => isShiny
      ? sprites.backShinyAnimatedSpriteUrl!
      : sprites.backAnimatedSpriteUrl!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              CachedNetworkImage(height: 65, width: 65, imageUrl: frontUrl),
              Text(
                frontTitle,
                style: AppTheme.texts.pokemonText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              CachedNetworkImage(height: 65, width: 65, imageUrl: backUrl),
              Text(
                backTitle,
                style: AppTheme.texts.pokemonText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
