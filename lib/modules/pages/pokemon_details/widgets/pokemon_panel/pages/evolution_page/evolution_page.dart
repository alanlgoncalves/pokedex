import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/empty_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/next_evolution_chain.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/previous_evolution_chain.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class EvolutionPage extends StatelessWidget {
  EvolutionPage({Key? key}) : super(key: key);

  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Observer(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_pokeApiStore.pokemon!.prevEvolution != null)
              PreviousEvolutionChainWidget(),
            if (_pokeApiStore.pokemon!.nextEvolution != null)
              NextEvolutionChainWidget(),
            if (_pokeApiStore.pokemon!.nextEvolution == null &&
                _pokeApiStore.pokemon!.prevEvolution == null)
              EmptyEvolutionChainWidget(),
          ],
        );
      }),
    );
  }
}
