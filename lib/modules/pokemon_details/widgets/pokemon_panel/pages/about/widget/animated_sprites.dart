import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class AnimatedSpritesWidget extends StatelessWidget {
  static final _pokemonStore = GetIt.instance<PokemonStore>();

  final bool isShiny;

  const AnimatedSpritesWidget({
    Key? key,
    required this.isShiny,
  }) : super(key: key);

  String get frontTitle =>
      isShiny ? "Front animated \n shiny sprite" : "Front animated \n sprite";

  String get backTitle =>
      isShiny ? "Back animated \n shiny sprite" : "Back animated \n sprite";

  String get frontUrl => isShiny
      ? _pokemonStore.pokemon!.sprites.frontShinyAnimatedSpriteUrl!
      : _pokemonStore.pokemon!.sprites.frontAnimatedSpriteUrl!;

  String get backUrl => isShiny
      ? _pokemonStore.pokemon!.sprites.backShinyAnimatedSpriteUrl!
      : _pokemonStore.pokemon!.sprites.backAnimatedSpriteUrl!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Observer(
                builder: (_) => ImageUtils.networkImage(
                  height: 65,
                  width: 65,
                  url: frontUrl,
                ),
              ),
              Text(
                frontTitle,
                style: AppTheme.texts.pokemonText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              Observer(
                builder: (_) => ImageUtils.networkImage(
                  height: 65,
                  width: 65,
                  url: backUrl,
                ),
              ),
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
