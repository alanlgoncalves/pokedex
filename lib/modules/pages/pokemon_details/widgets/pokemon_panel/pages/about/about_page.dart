import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/animated_sprites.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/breeding_info.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/height_weigh_info.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/pokemon_cards.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/training_info.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Observer(
                  builder: (_) => Column(
                        children: _pokeApiStore.pokemon!.descriptions
                            .map((it) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    it,
                                    style: AppTheme.texts.pokemonText,
                                  ),
                                ))
                            .toList(),
                      )),
              Observer(builder: (_) {
                if (_pokeApiStore.pokemon!.hasAnimatedSprites)
                  return const AnimatedSpritesWidget(
                    isShiny: false,
                  );
                else
                  return Container();
              }),
              Observer(builder: (_) {
                if (_pokeApiStore.pokemon!.hasAnimatedShinySprites)
                  return const AnimatedSpritesWidget(
                    isShiny: true,
                  );
                else
                  return Container();
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const HeightWeightInfoWidget(),
              ),
              const BreedingInfoWidget(),
              const TrainingInfoWidget(),
            ],
          ),
        ),
        const PokemonCardsWidget(),
      ],
    );
  }
}
