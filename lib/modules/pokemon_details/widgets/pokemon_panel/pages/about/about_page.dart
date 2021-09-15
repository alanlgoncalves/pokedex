import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/about_page_store.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/widget/animated_sprites.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/widget/breeding_info.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/widget/height_weigh_info.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/widget/pokemon_cards.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/widget/sound_player.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/about/widget/training_info.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../../pokemon_mobile_panel.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();
  late AboutPageStore _aboutPageStoreStore;
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _aboutPageStoreStore = AboutPageStore();
    _player.positionStream.listen((state) {
      _aboutPageStoreStore.setAudioProgress(state);
    });

    _player.bufferedPositionStream.listen((state) {
      _aboutPageStoreStore.setAudioBuffered(state);
    });

    _player.durationStream.listen((state) {
      if (state != null) {
        _aboutPageStoreStore.setAudioTotal(state);
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (_pokeApiStore.pokemon!.soundUrl != null) {
                  _player.setUrl(_pokeApiStore.pokemon!.soundUrl!);
                  _player.pause();
                }

                return Column(
                  children: _pokeApiStore.pokemon!.descriptions
                      .map((it) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              it,
                              style: AppTheme.texts.pokemonText,
                            ),
                          ))
                      .toList(),
                );
              }),
              Observer(builder: (_) {
                if (_pokeApiStore.pokemon!.soundUrl != null)
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SoundPlayer(
                      pokemon: _pokeApiStore.pokemon!,
                      player: _player,
                      pokeApiStore: _pokeApiStore,
                      aboutPageStore: _aboutPageStoreStore,
                    ),
                  );
                else
                  return Container();
              }),
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
        Observer(builder: (_) {
          if (_pokeApiStore.pokemon!.cards.isNotEmpty) {
            return const PokemonCardsWidget();
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
