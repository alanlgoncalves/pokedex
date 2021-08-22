import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/widgets/fade_animation.dart';

class PokemonGridWidget extends StatelessWidget {
  final _scrollController = ScrollController();
  final PokeApiStore pokeApiStore;

  PokemonGridWidget({Key? key, required this.pokeApiStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveSliverGrid(
      showItemDuration: const Duration(milliseconds: 50),
      showItemInterval: const Duration(milliseconds: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) {
        final _pokemon = pokeApiStore.getPokemon(index);

        return FadeTrasitionWidget(
          animation: animation,
          child: InkWell(
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
                index: index,
              ),
            ),
          ),
        );
      },
      itemCount: pokeApiStore.pokemonsSummary != null
          ? pokeApiStore.pokemonsSummary!.length
          : 0,
      controller: _scrollController,
    );
  }
}
