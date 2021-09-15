import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class AppBarNavigationWidget extends StatelessWidget {
  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  AppBarNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (_pokeApiStore.index > 0)
          InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () async {
              _pokeApiStore.previousPokemon();
            },
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6, right: 5),
          child: ImageUtils.networkImage(
              height: 35,
              width: 35,
              url: _pokeApiStore.pokemon!.sprites.mainSpriteUrl),
        ),
        Text(
          _pokeApiStore.pokemon!.name,
          style: AppTheme.texts.pokemonDetailNumber,
        ),
        SizedBox(
          width: 15,
        ),
        if (_pokeApiStore.index < _pokeApiStore.pokemonsSummary!.length - 1)
          InkWell(
              onTap: () async {
                _pokeApiStore.nextPokemon();
              },
              child: Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
