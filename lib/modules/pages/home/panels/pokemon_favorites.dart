import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/modules/pages/home/home_store.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonFavorites extends StatelessWidget {
  static final PokeApiStore pokeApiStore = GetIt.instance<PokeApiStore>();
  final ScrollController scrollController;
  final HomeStore homeStore;

  const PokemonFavorites(
      {Key? key, required this.homeStore, required this.scrollController})
      : super(key: key);

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

    if (pokeApiStore.favoritesPokemonsSummary.isEmpty) {
      return Container(
        height: 250,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "You do not have any favorited Pokemon yet",
              style: AppTheme.texts.pokemonText,
            ),
            Center(
              child: Lottie.asset(
                AppConstants.pikachuLottie,
              ),
            )
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
          left: horizontalPadding, right: horizontalPadding, top: 28),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [];
              },
              body: GridView.builder(
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  final _pokemon = pokeApiStore.favoritesPokemonsSummary[index];
                  final _index = pokeApiStore.pokemonsSummary!
                      .indexWhere((it) => it.number == _pokemon.number);

                  return InkWell(
                    onTap: () async {
                      await pokeApiStore.setPokemon(_index);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return PokemonDetailsPage(
                            isFavoritePokemon: true,
                          );
                        }),
                      );
                    },
                    child: Ink(
                      child: PokeItemWidget(
                        pokemon: _pokemon,
                        isFavorite: true,
                      ),
                    ),
                  );
                },
                itemCount: pokeApiStore.favoritesPokemonsSummary.length,
              ),
            ),
          ),
          Container(
            height: 40,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Favotires Pokemons",
                  style: AppTheme.texts.pokemonText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
