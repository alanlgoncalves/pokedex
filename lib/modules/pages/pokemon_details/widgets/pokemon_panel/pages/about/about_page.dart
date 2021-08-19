import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/widget/height_weigh_info.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CachedNetworkImage(
                            height: 65,
                            width: 65,
                            imageUrl: _pokeApiStore
                                .pokemon!.sprites.frontAnimatedSprite!),
                        Text(
                          "Front animated \n Sprite",
                          style: AppTheme.texts.pokemonText,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CachedNetworkImage(
                            height: 65,
                            width: 65,
                            imageUrl: _pokeApiStore
                                .pokemon!.sprites.backAnimatedSprite!),
                        Text(
                          "Back animated \n Sprite",
                          style: AppTheme.texts.pokemonText,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: HeightWeightInfoWidget(),
            )
          ],
        );
      }),
    );
  }
}
