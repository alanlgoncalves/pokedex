import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/home/home_store.dart';
import 'package:pokedex/modules/pages/home/widgets/pokemon_type_item.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonTypeFilter extends StatelessWidget {
  static final PokeApiStore pokeApiStore = GetIt.instance<PokeApiStore>();

  final ScrollController scrollController;
  final HomeStore homeStore;

  const PokemonTypeFilter(
      {Key? key, required this.homeStore, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
        child: Stack(
          children: [
            NestedScrollView(
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

                  if (pokeApiStore.typeFilter == null) {
                    color = AppTheme.colors.pokemonItem(type);
                  } else {
                    color = pokeApiStore.typeFilter == type
                        ? AppTheme.colors.pokemonItem(type)
                        : Colors.grey[400];
                  }

                  return PokemonTypeItemWidget(
                    type: type,
                    color: color,
                    onClick: () {
                      if (pokeApiStore.typeFilter != null &&
                          pokeApiStore.typeFilter == type) {
                        pokeApiStore.clearTypeFilter();
                      } else {
                        pokeApiStore.addTypeFilter(type);
                      }

                      homeStore.closeFilter();
                    },
                  );
                },
                itemCount: AppConstants.types.length,
              ),
            ),
            if (pokeApiStore.typeFilter != null)
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
