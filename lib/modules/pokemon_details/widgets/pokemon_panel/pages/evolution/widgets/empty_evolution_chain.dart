import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';

class EmptyEvolutionChainWidget extends StatelessWidget {
  final PokemonStore _pokemonStore = GetIt.instance<PokemonStore>();

  EmptyEvolutionChainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Center(
          child: Container(
            height: 250,
            width: 250,
            child: Lottie.asset(
              AppConstants.pikachuLottie,
              width: 400,
            ),
          ),
        ),
        Text(
          "${_pokemonStore.pokemon!.name} does not have any evolution chain",
          style: textTheme.bodyText1,
        )
      ],
    );
  }
}
