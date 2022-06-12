import 'dart:math';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pokedex/modules/pokemon_details/pokemon_details_store.dart';
import 'package:pokedex/modules/pokemon_details/widgets/app_bar_navigation.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_pager.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pokemon_mobile_panel.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_title_info.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/ui/canvas/background_dots.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/ui/enums/device_screen_type.dart';
import 'package:pokedex/shared/utils/converters.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../../theme/dark/dark_theme.dart';
import '../../theme/light/light_theme.dart';

class PokemonDetailsPage extends StatefulWidget {
  final bool isFavoritePokemon;

  const PokemonDetailsPage({Key? key, this.isFavoritePokemon = false})
      : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  late PokemonStore _pokemonStore;
  late PokemonDetailsStore _pokemonDetailsStore;
  late AnimationController _animationController;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    _pokemonStore = GetIt.instance<PokemonStore>();
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
    if (getDeviceScreenType(context) == DeviceScreenType.CELLPHONE) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
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
                          .pokemonItem(_pokemonStore.pokemon!.types[0]),
                    );
                  },
                ),
                Positioned(
                  top: -83 + padding.top,
                  left: -70,
                  child: Transform.rotate(
                    angle: getRadiansFromDegree(75),
                    child: Opacity(
                      opacity: 0.1,
                      child: Container(
                        height: 144,
                        width: 144,
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
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
                      icon: Icon(Icons.arrow_back,
                          color: AppTheme.getColors(context)
                              .pokemonDetailsTitleColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      if (_pokemonStore
                          .isFavorite(_pokemonStore.pokemon!.number))
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: AppTheme.getColors(context)
                                .pokemonDetailsTitleColor,
                          ),
                          onPressed: () {
                            _pokemonStore.removeFavoritePokemon(
                                _pokemonStore.pokemon!.number);

                            BotToast.showText(
                                text:
                                    "${_pokemonStore.pokemon!.name} was removed from favorites");
                          },
                        ),
                      if (!_pokemonStore
                          .isFavorite(_pokemonStore.pokemon!.number))
                        IconButton(
                          icon: Icon(Icons.favorite_border,
                              color: AppTheme.getColors(context)
                                  .pokemonDetailsTitleColor),
                          onPressed: () {
                            _pokemonStore.addFavoritePokemon(
                                _pokemonStore.pokemon!.number);
                            BotToast.showText(
                                text:
                                    "${_pokemonStore.pokemon!.name} was favorited");
                          },
                        ),
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: ThemeSwitcher(builder: (context) {
                          return InkWell(
                            onTap: () {
                              ThemeSwitcher.of(context)?.changeTheme(
                                  theme: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? darkTheme
                                      : lightTheme);
                            },
                            child: Icon(
                                Theme.of(context).brightness == Brightness.light
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                color: AppTheme.getColors(context)
                                    .pokemonDetailsTitleColor),
                          );
                        }),
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
                                  color: AppTheme.colors.pokemonItem(
                                      _pokemonStore.pokemon!.types[0]),
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
                                    color: Theme.of(context).backgroundColor,
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
                                      opacity:
                                          _pokemonDetailsStore.opacityPokemon,
                                      child: SizedBox(
                                        height: 223,
                                        child: Center(
                                          child: AnimatedBuilder(
                                            animation: _animationController,
                                            builder: (_, child) {
                                              return Transform.rotate(
                                                angle:
                                                    _animationController.value *
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
                                                  color: Theme.of(context)
                                                      .backgroundColor
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
                                    opacity:
                                        _pokemonDetailsStore.opacityPokemon,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Container(
                                        height: 220,
                                        child: PokemonPagerWidget(
                                          pokemonDetailStore:
                                              _pokemonDetailsStore,
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
      }),
    );
  }
}
