import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/widgets/empty_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/widgets/next_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/widgets/previous_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/widgets/super_evolution_chain.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/evolution_chain_utils.dart';

class EvolutionPage extends StatelessWidget {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();

  const EvolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //TODO - Make it with util class
    double horizontalPadding = 0;

    if (size.width > 1200) {
      horizontalPadding = size.width * 0.28;
    } else if (size.width > 900) {
      horizontalPadding = size.width * 0.2;
    } else if (size.width > 600) {
      horizontalPadding = 28;
    } else {
      horizontalPadding = 28;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Observer(builder: (_) {
        final evolutionChain =
            EvolutionChainUtils.buildEvolutionChain(_pokeApiStore.pokemon!);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_pokeApiStore.pokemon!.previousEvolutions.isNotEmpty)
              PreviousEvolutionChainWidget(evolutionChain: evolutionChain),
            if (_pokeApiStore.pokemon!.nextEvolutions.isNotEmpty)
              NextEvolutionChainWidget(evolutionChain: evolutionChain),
            if (_pokeApiStore.pokemon!.superEvolutions.isNotEmpty)
              SuperEvolutionChainWidget(),
            if (!_pokeApiStore.pokemon!.hasEvolutions)
              EmptyEvolutionChainWidget(),
            SizedBox(
              height: 100,
            )
          ],
        );
      }),
    );
  }
}
