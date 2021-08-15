import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/evolution_chain_item.dart';
import 'package:pokedex/shared/models/poke_api.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PreviousEvolutionChainWidget extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  PreviousEvolutionChainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Previous Evolution${_pokeApiStore.pokemon!.prevEvolution!.length > 1 ? "s" : ""}",
          style: AppTheme.texts.pokemonTabViewTitle,
        ),
        ..._pokeApiStore.pokemon!.prevEvolution!
            .map<Widget>((previousEvolution) {
          final previousEvolutionPokemon = _pokeApiStore.pokeApi!.pokemon!
              .firstWhere((it) => it.num == previousEvolution.num);

          return _pokemonPreviouEvolutionChain(
            pokemon: previousEvolutionPokemon,
          );
        }).toList(),
        _pokemonPreviouEvolutionChain(
          pokemon: _pokeApiStore.pokemon!,
        ),
      ],
    );
  }

  Widget _pokemonPreviouEvolutionChain({
    required Pokemon pokemon,
    Pokemon? previousEvolution,
  }) {
    if (previousEvolution == null && pokemon.prevEvolution == null) {
      return Container();
    }

    final nextPreviousPokemon = previousEvolution == null
        ? _pokeApiStore.pokeApi!.pokemon!.firstWhere((it) =>
            it.num ==
            pokemon.prevEvolution![pokemon.prevEvolution!.length - 1].num)
        : previousEvolution;

    return EvolutionChainItemWidget(
        previousEvolution: nextPreviousPokemon, nextEvolution: pokemon);
  }
}
