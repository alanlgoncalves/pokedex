import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_pager.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel.dart';
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
  late AnimationController _animationController;

  double _progress = 0;
  double _opacityTitleAppbar = 0;
  double _opacityPokemon = 1;

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  void initState() {
    super.initState();

    _pokeApiStore = GetIt.instance<PokeApiStore>();

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
        top: _opacityTitleAppbar == 1
            ? MediaQuery.of(context).size.height
            : (MediaQuery.of(context).size.height * 0.15) - (_progress * 100),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Observer(builder: (_) {
          return AppBar(
            title: Opacity(
              opacity: _opacityTitleAppbar,
              child: Text(
                _pokeApiStore.pokemon!.name!,
                style: AppTheme.texts.pokemonDetailNumber,
              ),
            ),
            backgroundColor:
                AppTheme.colors.pokemonItem(_pokeApiStore.pokemon!.type![0]),
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
                  AppTheme.colors.pokemonItem(_pokeApiStore.pokemon!.type![0]),
            );
          }),
          PokemonPanelWidget(listener: (state) {
            _progress = state.progress;
            _opacityPokemon = 1 - interval(0.0, 0.6, _progress);
            _opacityTitleAppbar = interval(0.0, 0.6, _progress);

            setState(() {});
          }),
          Opacity(
            opacity: _opacityPokemon,
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
          Opacity(
            opacity: _opacityPokemon,
            child: Padding(
                padding: paggerPadding,
                child: PokemonPagerWidget(index: widget.index)),
          ),
          Opacity(opacity: _opacityPokemon, child: PokemonTitleInfoWidget())
        ],
      ),
    );
  }
}
