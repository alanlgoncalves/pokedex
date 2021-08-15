import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/evolution_chain_item.dart';
import 'package:pokedex/shared/models/poke_api.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class NextEvolutionChainWidget extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  NextEvolutionChainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Next Evolution${_pokeApiStore.pokemon!.nextEvolution!.length > 1 ? "s" : ""}",
          style: AppTheme.texts.pokemonTabViewTitle,
        ),
        ..._pokeApiStore.pokemon!.nextEvolution!.map<Widget>((nextEvolution) {
          final nextEvolutionPokemon = _pokeApiStore.pokeApi!.pokemon!
              .firstWhere((it) => it.num == nextEvolution.num);

          final isEvolution = nextEvolutionPokemon
                  .prevEvolution![
                      nextEvolutionPokemon.prevEvolution!.length - 1]
                  .num ==
              _pokeApiStore.pokemon!.num;

          if (isEvolution) {
            return _pokemonNextEvolutionChain(
                pokemon: _pokeApiStore.pokemon!,
                nextEvolution: nextEvolutionPokemon);
          } else {
            return Container();
          }
        }).toList(),
        ..._pokeApiStore.pokemon!.nextEvolution!.map<Widget>((nextEvolution) {
          final nextEvolutionPokemon = _pokeApiStore.pokeApi!.pokemon!
              .firstWhere((it) => it.num == nextEvolution.num);

          return _pokemonNextEvolutionChain(pokemon: nextEvolutionPokemon);
        }).toList(),
      ],
    );
  }

  Widget _pokemonNextEvolutionChain({
    required Pokemon pokemon,
    Pokemon? nextEvolution,
  }) {
    if (nextEvolution == null && pokemon.nextEvolution == null) {
      return Container();
    }

    final nextEvolutionPokemon = nextEvolution == null
        ? _pokeApiStore.pokeApi!.pokemon!
            .firstWhere((it) => it.num == pokemon.nextEvolution![0].num)
        : nextEvolution;

    return EvolutionChainItemWidget(
        previousEvolution: pokemon, nextEvolution: nextEvolutionPokemon);
  }
}
