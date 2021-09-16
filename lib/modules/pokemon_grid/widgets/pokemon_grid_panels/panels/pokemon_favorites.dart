import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/pokemon_details/pokemon_details.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pokemon_mobile_panel.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/poke_item.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonFavorites extends StatelessWidget {
  static final PokemonStore pokemonStore = GetIt.instance<PokemonStore>();
  final ScrollController scrollController;
  final HomePageStore pokemonGridStore;

  const PokemonFavorites(
      {Key? key,
      required this.pokemonGridStore,
      required this.scrollController})
      : super(key: key);

  double get topPadding {
    if (pokemonStore.favoritesPokemonsSummary.isNotEmpty) {
      return kIsWeb ? 68 : 10;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    if (pokemonStore.favoritesPokemonsSummary.isEmpty) {
      return Container(
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
                width: 400,
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
            padding: EdgeInsets.only(top: topPadding),
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
                  final _pokemon = pokemonStore.favoritesPokemonsSummary[index];
                  final _index = pokemonStore.pokemonsSummary!
                      .indexWhere((it) => it.number == _pokemon.number);

                  return InkWell(
                    onTap: () async {
                      await pokemonStore.setPokemon(_index);

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
                itemCount: pokemonStore.favoritesPokemonsSummary.length,
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
