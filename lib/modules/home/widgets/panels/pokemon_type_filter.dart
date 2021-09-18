import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/pokemon_type_item.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonTypeFilter extends StatelessWidget {
  static final PokemonStore pokemonStore = GetIt.instance<PokemonStore>();

  final ScrollController scrollController;
  final HomePageStore homePageStore;

  const PokemonTypeFilter(
      {Key? key, required this.homePageStore, required this.scrollController})
      : super(key: key);

  double get topPadding {
    if (pokemonStore.pokemonFilter.typeFilter != null) {
      return kIsWeb ? 68 : 10;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
        child: Stack(
          children: [
            if (pokemonStore.pokemonFilter.typeFilter != null)
              SizedBox(
                height: 40,
              ),
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
                    String type = AppConstants.types[index];

                    Color? color;

                    if (pokemonStore.pokemonFilter.typeFilter == null) {
                      color = AppTheme.colors.pokemonItem(type);
                    } else {
                      color = pokemonStore.pokemonFilter.typeFilter == type
                          ? AppTheme.colors.pokemonItem(type)
                          : Colors.grey[400];
                    }

                    return PokemonTypeItemWidget(
                      type: type,
                      color: color,
                      onClick: () {
                        if (pokemonStore.pokemonFilter.typeFilter != null &&
                            pokemonStore.pokemonFilter.typeFilter == type) {
                          pokemonStore.clearTypeFilter();
                        } else {
                          pokemonStore.addTypeFilter(type);
                        }

                        homePageStore.closeFilter();
                      },
                    );
                  },
                  itemCount: AppConstants.types.length,
                ),
              ),
            ),
            if (pokemonStore.pokemonFilter.typeFilter != null)
              Container(
                height: 40,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Click on the selected item to clear the filter",
                      style: AppTheme.texts.pokemonText,
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}
