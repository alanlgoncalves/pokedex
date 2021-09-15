import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pokemon_mobile_panel.dart';
import 'package:pokedex/modules/pokemon_grid/pokemon_grid_store.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/generation_item.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonGenerationFilter extends StatelessWidget {
  static final PokeApiStore pokeApiStore = GetIt.instance<PokeApiStore>();
  final ScrollController scrollController;
  final PokemonGridStore pokemonGridStore;

  const PokemonGenerationFilter(
      {Key? key,
      required this.pokemonGridStore,
      required this.scrollController})
      : super(key: key);

  double get topPadding {
    if (pokeApiStore.pokemonFilter.generationFilter != null) {
      return kIsWeb ? 68 : 10;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
            left: horizontalPadding, right: horizontalPadding, top: 28),
        child: Stack(
          children: [
            if (pokeApiStore.pokemonFilter.generationFilter != null)
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
                    final generation = Generation.values[index];

                    Color? color =
                        pokeApiStore.pokemonFilter.generationFilter ==
                                generation
                            ? AppTheme.colors.selectedGenerationFilter
                            : Colors.white;

                    return GenerationItemWidget(
                      generation: generation,
                      color: color,
                      onClick: () {
                        if (pokeApiStore.pokemonFilter.generationFilter !=
                                null &&
                            pokeApiStore.pokemonFilter.generationFilter ==
                                generation) {
                          pokeApiStore.clearGenerationFilter();
                        } else {
                          pokeApiStore.addGenerationFilter(generation);
                        }

                        pokemonGridStore.closeFilter();
                      },
                    );
                  },
                  itemCount: Generation.values.length,
                ),
              ),
            ),
            if (pokeApiStore.pokemonFilter.generationFilter != null)
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
