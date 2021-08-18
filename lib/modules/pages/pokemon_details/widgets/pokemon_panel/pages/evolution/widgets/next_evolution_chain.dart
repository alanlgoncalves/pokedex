import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/widgets/evolution_chain_item.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class NextEvolutionChainWidget extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  final List<EvolutionChainItemWidget> evolutionChain;

  NextEvolutionChainWidget({
    Key? key,
    required this.evolutionChain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Next Evolution${_pokeApiStore.pokemon!.nextEvolutions.length > 1 ? "s" : ""}",
          style: AppTheme.texts.pokemonTabViewTitle,
        ),
        ...evolutionChain
            .where((element) =>
                element.previousEvolution.number
                    .compareTo(_pokeApiStore.pokemon!.number) >=
                0)
            .toList(),
      ],
    );
  }
}
