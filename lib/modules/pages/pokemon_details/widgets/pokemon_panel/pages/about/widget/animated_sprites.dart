import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class AnimatedSpritesWidget extends StatelessWidget {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();

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
      ? _pokeApiStore.pokemon!.sprites.frontShinyAnimatedSpriteUrl!
      : _pokeApiStore.pokemon!.sprites.frontAnimatedSpriteUrl!;

  String get backUrl => isShiny
      ? _pokeApiStore.pokemon!.sprites.backShinyAnimatedSpriteUrl!
      : _pokeApiStore.pokemon!.sprites.backAnimatedSpriteUrl!;

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
                builder: (_) => CachedNetworkImage(
                    height: 65, width: 65, imageUrl: frontUrl),
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
                builder: (_) => CachedNetworkImage(
                    height: 65, width: 65, imageUrl: backUrl),
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
