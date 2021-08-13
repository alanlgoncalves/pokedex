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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Observer(builder: (_) {
          return AppBar(
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
          PokemonPanelWidget(),
          Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height * 0.2) -
                    MediaQuery.of(context).padding.top),
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
          PokemonPagerWidget(index: widget.index),
          PokemonTitleInfoWidget()
        ],
      ),
    );
  }
}
