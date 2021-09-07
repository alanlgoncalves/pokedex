import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/modules/pages/home/home_store.dart';
import 'package:pokedex/modules/pages/home/widgets/home_panel/panels/pokemon_favorites.dart';
import 'package:pokedex/modules/pages/home/widgets/home_panel/panels/pokemon_filter.dart';
import 'package:pokedex/modules/pages/home/widgets/home_panel/panels/pokemon_generation_filter.dart';
import 'package:pokedex/modules/pages/home/widgets/home_panel/panels/pokemon_type_filter.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePanelWidget extends StatelessWidget {
  final PanelController panelController;
  final HomeStore homeStore;
  final PokeApiStore pokeApiStore;

  const HomePanelWidget(
      {Key? key,
      required this.panelController,
      required this.homeStore,
      required this.pokeApiStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      late double maxHeight;

      if (homeStore.panelType == PanelType.FILTER_POKEMON_NAME_NUMBER) {
        maxHeight = 80;
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
            homeStore.closeFilter();
            pokeApiStore.clearNameNumberFilter();
          },
          onPanelOpened: () {
            homeStore.openFilter();
          },
          controller: panelController,
          panelBuilder: (scrollController) {
            if (homeStore.panelType == PanelType.FILTER_POKEMON_TYPE) {
              return PokemonTypeFilter(
                homeStore: homeStore,
                scrollController: scrollController,
              );
            }

            if (homeStore.panelType == PanelType.FILTER_POKEMON_GENERATION) {
              return PokemonGenerationFilter(
                homeStore: homeStore,
                scrollController: scrollController,
              );
            }

            if (homeStore.panelType == PanelType.FILTER_POKEMON_NAME_NUMBER) {
              return PokemonNameNumberFilterPage(
                homeStore: homeStore,
                onChanged: (value) {
                  pokeApiStore.setNameNumberFilter(value);
                },
              );
            }

            if (homeStore.panelType == PanelType.FAVORITES_POKEMONS) {
              return PokemonFavorites(
                homeStore: homeStore,
                scrollController: scrollController,
              );
            }

            return Container();
          });
    });
  }
}
