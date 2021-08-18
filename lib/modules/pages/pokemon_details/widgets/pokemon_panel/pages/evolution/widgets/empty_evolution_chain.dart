import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class EmptyEvolutionChainWidget extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  EmptyEvolutionChainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 250,
            width: 250,
            child: Lottie.asset(
              'assets/lotties/pikachu.json',
            ),
          ),
        ),
        Text(
          "${_pokeApiStore.pokemon!.name} does not have any evolution chain",
          style: AppTheme.texts.pokemonEvolutionChainName,
        )
      ],
    );
  }
}
