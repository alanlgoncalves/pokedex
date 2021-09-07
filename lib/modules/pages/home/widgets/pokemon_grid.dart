import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class PokemonGridWidget extends StatelessWidget {
  final PokeApiStore pokeApiStore;

  PokemonGridWidget({Key? key, required this.pokeApiStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final _pokemon = pokeApiStore.getPokemon(index);

          return InkWell(
            onTap: () async {
              await pokeApiStore.setPokemon(index);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return PokemonDetailsPage();
                }),
              );
            },
            child: Ink(
              child: PokeItemWidget(
                pokemon: _pokemon,
              ),
            ),
          );
        },
        childCount: pokeApiStore.pokemonsSummary != null
            ? pokeApiStore.pokemonsSummary!.length
            : 0,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
