import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details_store.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/app_bar_navigation.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_pager.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pokemon_mobile_panel.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_title_info.dart';
import 'package:pokedex/shared/canvas/background_dots.dart';
import 'package:pokedex/shared/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/converters.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonDetailsPage extends StatefulWidget {
  final bool isFavoritePokemon;

  const PokemonDetailsPage({Key? key, this.isFavoritePokemon = false})
      : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  late PokeApiStore _pokeApiStore;
  late PokemonDetailsStore _pokemonDetailsStore;
  late AnimationController _animationController;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    _pokeApiStore = GetIt.instance<PokeApiStore>();
    _pokemonDetailsStore = PokemonDetailsStore();

    player = AudioPlayer();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    player.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Stack(
          children: [
            Observer(
              builder: (_) {
                return Container(
                  height: size.height,
                  width: size.width,
                  color: AppTheme.colors
                      .pokemonItem(_pokeApiStore.pokemon!.types[0]),
                );
              },
            ),
            Positioned(
              top: -30,
              left: -70,
              child: Transform.rotate(
                angle: getRadiansFromDegree(75),
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    height: 144,
                    width: 144,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 80,
              top: padding.top,
              child: Opacity(
                opacity: 0.2,
                child: CustomPaint(
                  size: Size(57, (57 * 0.543859649122807).toDouble()),
                  painter: BackgroundDotsPainter(),
                ),
              ),
            ),
            Observer(builder: (_) {
              return AppBar(
                title: AnimatedOpacity(
                    duration: Duration(milliseconds: 30),
                    opacity: _pokemonDetailsStore.opacityTitleAppbar,
                    child: AppBarNavigationWidget()),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  if (_pokeApiStore.isFavorite(_pokeApiStore.pokemon!.number))
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        _pokeApiStore.removeFavoritePokemon(
                            _pokeApiStore.pokemon!.number);

                        BotToast.showText(
                            text:
                                "${_pokeApiStore.pokemon!.name} was removed from favorites");
                      },
                    ),
                  if (!_pokeApiStore.isFavorite(_pokeApiStore.pokemon!.number))
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        _pokeApiStore
                            .addFavoritePokemon(_pokeApiStore.pokemon!.number);
                        BotToast.showText(
                            text:
                                "${_pokeApiStore.pokemon!.name} was favorited");
                      },
                    ),
                ],
              );
            }),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      child: Stack(
                        children: [
                          Observer(builder: (_) {
                            return Container(
                              color: AppTheme.colors
                                  .pokemonItem(_pokeApiStore.pokemon!.types[0]),
                            );
                          }),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: Colors.white,
                              ),
                              height: 80,
                            ),
                          ),
                          Observer(
                            builder: (_) => Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 30),
                                  opacity: _pokemonDetailsStore.opacityPokemon,
                                  child: SizedBox(
                                    height: 223,
                                    child: Center(
                                      child: AnimatedBuilder(
                                        animation: _animationController,
                                        builder: (_, child) {
                                          return Transform.rotate(
                                            angle: _animationController.value *
                                                2 *
                                                pi,
                                            child: child,
                                          );
                                        },
                                        child: CustomPaint(
                                          size: Size(
                                              200,
                                              (200 * 1.0040160642570282)
                                                  .toDouble()),
                                          painter: PokeballLogoPainter(
                                              color: Colors.white
                                                  .withOpacity(0.3)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Observer(
                            builder: (_) => Align(
                              alignment: Alignment.bottomCenter,
                              child: AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity: _pokemonDetailsStore.opacityPokemon,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Container(
                                    height: 220,
                                    child: PokemonPagerWidget(
                                      pokemonDetailStore: _pokemonDetailsStore,
                                      isFavorite: widget.isFavoritePokemon,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Observer(
                            builder: (_) => AnimatedOpacity(
                              duration: Duration(milliseconds: 30),
                              opacity: _pokemonDetailsStore.opacityPokemon,
                              child: PokemonTitleInfoWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: size.width,
            height: size.height,
            child: PokemonMobilePanelWidget(
              listener: (position) {
                _pokemonDetailsStore.setProgress(position, 0.0, 0.65);

                return true;
              },
            ),
          ),
        ],
      ),
    );
  }
}
