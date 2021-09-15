import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/evolution/widgets/evolution_chain_item.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PreviousEvolutionChainWidget extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  final List<EvolutionChainItemWidget> evolutionChain;

  PreviousEvolutionChainWidget({Key? key, required this.evolutionChain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Previous Evolution${_pokeApiStore.pokemon!.previousEvolutions.length > 1 ? "s" : ""}",
          style: AppTheme.texts.pokemonTabViewTitle,
        ),
        ...evolutionChain
            .where((element) =>
                element.previousEvolution.type.index
                    .compareTo(_pokeApiStore.pokemon!.evolutionType.index) ==
                -1)
            .toList(),
      ],
    );
  }
}
