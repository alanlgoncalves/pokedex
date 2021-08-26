import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/home/home_store.dart';
import 'package:pokedex/modules/pages/home/widgets/generation_item.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonGenerationFilter extends StatelessWidget {
  static final PokeApiStore pokeApiStore = GetIt.instance<PokeApiStore>();
  final HomeStore homeStore;

  const PokemonGenerationFilter({Key? key, required this.homeStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            if (pokeApiStore.generationFilter != null)
              SliverPadding(
                padding: const EdgeInsets.only(top: 40),
                sliver: SliverToBoxAdapter(
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
              ),
          ];
        },
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 28),
          child: GridView(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3 / 2,
            ),
            children: Generation.values.map((generation) {
              Color? color = pokeApiStore.generationFilter == generation
                  ? AppTheme.colors.selectedGenerationFilter
                  : Colors.white;

              return GenerationItemWidget(
                generation: generation,
                color: color,
                onClick: () {
                  if (pokeApiStore.generationFilter != null &&
                      pokeApiStore.generationFilter == generation) {
                    pokeApiStore.clearGenerationFilter();
                  } else {
                    pokeApiStore.addGenerationFilter(generation);
                  }

                  homeStore.closeFilter();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
