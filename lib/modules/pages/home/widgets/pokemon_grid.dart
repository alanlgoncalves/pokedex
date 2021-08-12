import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      showItemDuration: const Duration(milliseconds: 500),
      showItemInterval: const Duration(milliseconds: 0),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  pokeApiStore.setPokemon(index);

                  return PokemonDetailsPage(index: index);
                }),
              );
            },
            child: Ink(
              child: PokeItemWidget(
                pokemon: _pokemon,
                image: CachedNetworkImage(imageUrl: _pokemon.imageUrl),
                index: index,
              ),
            ),
          ),
        );
      },
      itemCount: pokeApiStore.pokeApi != null
          ? pokeApiStore.pokeApi!.pokemon!.length
          : 0,
      controller: _scrollController,
    );
  }
}
