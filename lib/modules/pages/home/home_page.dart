import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex/modules/pages/home/widgets/app_bar.dart';

import 'package:pokedex/modules/pages/home/widgets/pokemon_grid.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

import 'package:pokedex/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            AppBarWidget(),
            Observer(
              builder: (_) {
                if (_pokeApiStore.pokemonsSummary == null) {
                  return SliverFillRemaining(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ));
                } else {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: PokemonGridWidget(pokeApiStore: _pokeApiStore),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
