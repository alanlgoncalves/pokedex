import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pokemon_mobile_panel.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/generation_item.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonGenerationFilter extends StatelessWidget {
  static final PokemonStore pokemonStore = GetIt.instance<PokemonStore>();
  final ScrollController scrollController;
  final HomePageStore homePageStore;

  const PokemonGenerationFilter(
      {Key? key, required this.homePageStore, required this.scrollController})
      : super(key: key);

  double get topPadding {
    if (pokemonStore.pokemonFilter.generationFilter != null) {
      return kIsWeb ? 68 : 50;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
            left: horizontalPadding, right: horizontalPadding, top: 28),
        child: Stack(
          children: [
            if (pokemonStore.pokemonFilter.generationFilter != null)
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

                    Color? color = pokemonStore
                                .pokemonFilter.generationFilter ==
                            generation
                        ? AppTheme.getColors(context).selectedGenerationFilter
                        : AppTheme.getColors(context).generationFilter;

                    return GenerationItemWidget(
                      generation: generation,
                      color: color,
                      onClick: () {
                        if (pokemonStore.pokemonFilter.generationFilter !=
                                null &&
                            pokemonStore.pokemonFilter.generationFilter ==
                                generation) {
                          pokemonStore.clearGenerationFilter();
                        } else {
                          pokemonStore.addGenerationFilter(generation);
                        }

                        homePageStore.closeFilter();
                      },
                    );
                  },
                  itemCount: Generation.values.length,
                ),
              ),
            ),
            if (pokemonStore.pokemonFilter.generationFilter != null)
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Click on the selected item to clear the filter",
                      style: textTheme.bodyText1,
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
