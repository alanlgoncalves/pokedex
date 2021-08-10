import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/modules/pages/home/widgets/app_bar.dart';
import 'package:pokedex/modules/pages/home/widgets/poke_item.dart';
import 'package:pokedex/modules/pages/home/widgets/pokemon_grid.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/widgets/fade_animation.dart';
import 'package:pokedex/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeApiStore = PokeApiStore();

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            AppBarWidget(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: PokemonGridWidget(pokeApiStore: pokeApiStore),
            )
          ],
        ),
      ),
    );
  }
}
