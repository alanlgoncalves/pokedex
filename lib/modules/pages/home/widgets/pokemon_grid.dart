import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class PokemonGridWidget extends StatefulWidget {
  final PokeApiStore pokeApiStore;

  PokemonGridWidget({Key? key, required this.pokeApiStore}) : super(key: key);

  @override
  _PokemonGridWidgetState createState() => _PokemonGridWidgetState();
}

class _PokemonGridWidgetState extends State<PokemonGridWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.extent(
      maxCrossAxisExtent: 200,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 3 / 2,
      children: [
        if (widget.pokeApiStore.pokemonsSummary != null)
          ...widget.pokeApiStore.pokemonsSummary!.map((it) {
            final index = widget.pokeApiStore.pokemonsSummary!
                .indexWhere((pokemon) => pokemon == it);

            return InkWell(
              onTap: () async {
                await widget.pokeApiStore.setPokemon(index);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return PokemonDetailsPage();
                  }),
                );
              },
              child: Ink(
                child: PokeItemWidget(
                  pokemon: widget.pokeApiStore.pokemonsSummary![index],
                  index: index,
                ),
              ),
            );
          }).toList()
      ],
    );
  }
}
