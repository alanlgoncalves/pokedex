import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/home_panel/panels/pokemon_favorites.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/home_panel/panels/pokemon_filter.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/home_panel/panels/pokemon_generation_filter.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/home_panel/panels/pokemon_type_filter.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonGridPanelWidget extends StatelessWidget {
  final PanelController panelController;
  final HomePageStore pokemonGridStore;
  final PokeApiStore pokeApiStore;

  const PokemonGridPanelWidget(
      {Key? key,
      required this.panelController,
      required this.pokemonGridStore,
      required this.pokeApiStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      late double maxHeight;

      if (pokemonGridStore.panelType == PanelType.FILTER_POKEMON_NAME_NUMBER) {
        maxHeight = 100;
      } else {
        maxHeight = MediaQuery.of(context).size.height * 0.75;
      }

      return SlidingUpPanel(
          maxHeight: maxHeight,
          minHeight: MediaQuery.of(context).size.height * 0.0,
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.9),
              blurRadius: 10.0,
            ),
          ],
          onPanelClosed: () {
            pokemonGridStore.closeFilter();
            pokeApiStore.clearNameNumberFilter();
          },
          onPanelOpened: () {
            pokemonGridStore.openFilter();
          },
          controller: panelController,
          panelBuilder: (scrollController) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Color(0xFFd4d4d4),
                        height: 4,
                        width: 80,
                      )
                    ],
                  ),
                ),
                if (pokemonGridStore.panelType == PanelType.FILTER_POKEMON_TYPE)
                  PokemonTypeFilter(
                    pokemonGridStore: pokemonGridStore,
                    scrollController: scrollController,
                  ),
                if (pokemonGridStore.panelType ==
                    PanelType.FILTER_POKEMON_GENERATION)
                  PokemonGenerationFilter(
                    pokemonGridStore: pokemonGridStore,
                    scrollController: scrollController,
                  ),
                if (pokemonGridStore.panelType ==
                    PanelType.FILTER_POKEMON_NAME_NUMBER)
                  PokemonNameNumberFilterPage(
                    pokemonGridStore: pokemonGridStore,
                    onChanged: (value) {
                      pokeApiStore.setNameNumberFilter(value);
                    },
                    onClose: () {
                      panelController.close();
                    },
                  ),
                if (pokemonGridStore.panelType == PanelType.FAVORITES_POKEMONS)
                  PokemonFavorites(
                    pokemonGridStore: pokemonGridStore,
                    scrollController: scrollController,
                  ),
              ],
            );
          });
    });
  }
}
