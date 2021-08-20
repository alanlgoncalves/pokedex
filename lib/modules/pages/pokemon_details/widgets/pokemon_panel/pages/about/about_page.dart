import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/breeding_info.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/height_weigh_info.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/animated_sprites.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Observer(builder: (_) {
        return Column(
          children: [
            ..._pokeApiStore.pokemon!.descriptions
                .map((it) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        it,
                        style: AppTheme.texts.pokemonText,
                      ),
                    ))
                .toList(),
            if (_pokeApiStore.pokemon!.hasAnimatedSprites)
              AnimatedSpritesWidget(
                sprites: _pokeApiStore.pokemon!.sprites,
                isShiny: false,
              ),
            if (_pokeApiStore.pokemon!.hasAnimatedShinySprites)
              AnimatedSpritesWidget(
                sprites: _pokeApiStore.pokemon!.sprites,
                isShiny: true,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: HeightWeightInfoWidget(),
            ),
            BreedingInfoWidget(pokemon: _pokeApiStore.pokemon!)
          ],
        );
      }),
    );
  }
}
