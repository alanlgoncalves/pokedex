import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/about_page_store.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pokemon_mobile_panel.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class SoundPlayer extends StatelessWidget {
  final AboutPageStore aboutPageStore;
  final PokeApiStore pokeApiStore;
  final AudioPlayer player;
  final Pokemon pokemon;

  const SoundPlayer(
      {Key? key,
      required this.aboutPageStore,
      required this.player,
      required this.pokemon,
      required this.pokeApiStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.play,
                color: AppTheme.colors.pokemonItem(pokemon.types[0]),
              ),
              onPressed: () async {
                player.seek(Duration.zero);
                player.play();
              },
            ),
            SizedBox(
              child: Observer(
                builder: (_) => ProgressBar(
                  progress: aboutPageStore.audioProgress,
                  buffered: aboutPageStore.audioBuffered,
                  total: aboutPageStore.audioTotal,
                  progressBarColor: AppTheme.colors
                      .pokemonItem(pokeApiStore.pokemon!.types[0]),
                  baseBarColor: AppTheme.colors
                      .pokemonItem(pokeApiStore.pokemon!.types[0])
                      .withOpacity(0.1),
                  bufferedBarColor: AppTheme.colors
                      .pokemonItem(pokeApiStore.pokemon!.types[0])
                      .withOpacity(0.1),
                  thumbColor: AppTheme.colors
                      .pokemonItem(pokeApiStore.pokemon!.types[0]),
                  timeLabelLocation: TimeLabelLocation.sides,
                  onSeek: (duration) {
                    player.seek(duration);
                  },
                ),
              ),
              width: size.width * 0.65 - horizontalPadding,
            )
          ],
        ),
      ),
    );
  }
}
