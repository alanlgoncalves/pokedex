import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details_store.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_pager.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pokemon_panel.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_title_info.dart';

import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int index;

  const PokemonDetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  late PokeApiStore _pokeApiStore;
  late PokemonDetailsStore _pokemonDetailsStore;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _pokeApiStore = GetIt.instance<PokeApiStore>();
    _pokemonDetailsStore = PokemonDetailsStore();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  EdgeInsets get paggerPadding => EdgeInsets.only(
        top: _pokemonDetailsStore.opacityTitleAppbar == 1
            ? MediaQuery.of(context).size.height
            : (MediaQuery.of(context).size.height * 0.12) -
                (_pokemonDetailsStore.progress * 100),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Observer(builder: (_) {
          return AppBar(
            title: Opacity(
              opacity: _pokemonDetailsStore.opacityTitleAppbar,
              child: Text(
                _pokeApiStore.pokemon!.name,
                style: AppTheme.texts.pokemonDetailNumber,
              ),
            ),
            backgroundColor:
                AppTheme.colors.pokemonItem(_pokeApiStore.pokemon!.types[0]),
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          );
        }),
      ),
      body: Stack(
        children: [
          Observer(builder: (_) {
            return Container(
              color:
                  AppTheme.colors.pokemonItem(_pokeApiStore.pokemon!.types[0]),
            );
          }),
          PokemonPanelWidget(listener: (state) {
            _pokemonDetailsStore.setProgress(state.progress, 0.0, 0.65);
          }),
          Observer(
            builder: (_) => Opacity(
              opacity: _pokemonDetailsStore.opacityPokemon,
              child: Padding(
                padding: paggerPadding,
                child: SizedBox(
                  height: 223,
                  child: Center(
                    child: Opacity(
                      opacity: 0.2,
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: _animationController.value * 2 * pi,
                            child: child,
                          );
                        },
                        child: SvgPicture.asset(
                          AppConstants.whitePokeballLogo,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Observer(
            builder: (_) => Opacity(
              opacity: _pokemonDetailsStore.opacityPokemon,
              child: Padding(
                  padding: paggerPadding,
                  child: PokemonPagerWidget(index: widget.index)),
            ),
          ),
          Observer(
            builder: (_) => Opacity(
                opacity: _pokemonDetailsStore.opacityPokemon,
                child: PokemonTitleInfoWidget()),
          ),
        ],
      ),
    );
  }
}
