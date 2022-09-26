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
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

import '../../pokemon_mobile_panel.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static final _pokemonStore = GetIt.instance<PokemonStore>();
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
    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (_pokemonStore.pokemon!.soundUrl != null) {
                  _player.setUrl(_pokemonStore.pokemon!.soundUrl!);
                  _player.pause();
                }

                return Column(
                  children: _pokemonStore.pokemon!.descriptions
                      .map((it) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              it,
                              style: textTheme.bodyText1,
                            ),
                          ))
                      .toList(),
                );
              }),
              Observer(builder: (_) {
                if (_pokemonStore.pokemon!.soundUrl != null)
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SoundPlayer(
                      pokemon: _pokemonStore.pokemon!,
                      player: _player,
                      pokemonStore: _pokemonStore,
                      aboutPageStore: _aboutPageStoreStore,
                    ),
                  );
                else
                  return Container();
              }),
              Observer(builder: (_) {
                if (_pokemonStore.pokemon!.hasAnimatedSprites)
                  return const AnimatedSpritesWidget(
                    isShiny: false,
                  );
                else
                  return Container();
              }),
              Observer(builder: (_) {
                if (_pokemonStore.pokemon!.hasAnimatedShinySprites)
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
          if (_pokemonStore.pokemon!.cards.isNotEmpty) {
            return const PokemonCardsWidget();
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
