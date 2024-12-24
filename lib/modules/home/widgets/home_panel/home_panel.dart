import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/home/widgets/home_panel/panels/pokemon_favorites.dart';
import 'package:pokedex/modules/home/widgets/home_panel/panels/pokemon_generation_filter.dart';
import 'package:pokedex/modules/home/widgets/home_panel/panels/pokemon_type_filter.dart';
import 'package:pokedex/modules/home/widgets/home_panel/panels/text_filter.dart';
import 'package:pokedex/shared/stores/item_store/item_store.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePanelWidget extends StatelessWidget {
  final PanelController panelController;
  final HomePageStore homePageStore;
  final PokemonStore pokemonStore;
  final ItemStore itemStore;

  const HomePanelWidget(
      {Key? key,
      required this.panelController,
      required this.homePageStore,
      required this.pokemonStore,
      required this.itemStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      late double maxHeight;

      if (homePageStore.panelType != null &&
          homePageStore.panelType!.isTextFilter) {
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
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.9),
              blurRadius: 10.0,
            ),
          ],
          onPanelClosed: () {
            homePageStore.closeFilter();
          },
          onPanelOpened: () {
            homePageStore.openFilter();
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
                if (homePageStore.panelType == PanelType.FILTER_POKEMON_TYPE)
                  PokemonTypeFilter(
                    homePageStore: homePageStore,
                    scrollController: scrollController,
                  ),
                if (homePageStore.panelType ==
                    PanelType.FILTER_POKEMON_GENERATION)
                  PokemonGenerationFilter(
                    homePageStore: homePageStore,
                    scrollController: scrollController,
                  ),
                if (homePageStore.panelType ==
                    PanelType.FILTER_POKEMON_NAME_NUMBER)
                  TextFilterWidget(
                    hintText: "Ex: Charizard or 006",
                    text: pokemonStore.pokemonFilter.pokemonNameNumberFilter,
                    homePageStore: homePageStore,
                    onChanged: (value) {
                      pokemonStore.setNameNumberFilter(value);
                    },
                    onClose: () {
                      panelController.close();
                      pokemonStore.clearNameNumberFilter();
                    },
                  ),
                if (homePageStore.panelType == PanelType.FILTER_ITEMS)
                  TextFilterWidget(
                    hintText: "Ex: Ultraball",
                    text: itemStore.filter,
                    homePageStore: homePageStore,
                    onChanged: (value) {
                      itemStore.setFilter(value);
                    },
                    onClose: () {
                      panelController.close();
                      itemStore.clearFilter();
                    },
                  ),
                if (homePageStore.panelType == PanelType.FAVORITES_POKEMONS)
                  PokemonFavorites(
                    homePageStore: homePageStore,
                    scrollController: scrollController,
                  ),
              ],
            );
          });
    });
  }
}
