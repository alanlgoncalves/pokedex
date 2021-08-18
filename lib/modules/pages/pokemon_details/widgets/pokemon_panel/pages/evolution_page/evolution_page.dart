import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/empty_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/next_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/previous_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/super_evolution_chain.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/evolution_chain_utils.dart';

class EvolutionPage extends StatelessWidget {
  EvolutionPage({Key? key}) : super(key: key);

  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
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
              height: 50,
            )
          ],
        );
      }),
    );
  }
}
