import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pokedex/modules/pages/home/widgets/app_bar.dart';

import 'package:pokedex/modules/pages/home/widgets/pokemon_grid.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

import 'package:pokedex/theme/app_theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeApiStore = Provider.of<PokeApiStore>(context);

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            AppBarWidget(),
            Observer(
              builder: (_) {
                if (pokeApiStore.pokeApi == null) {
                  return SliverFillRemaining(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ));
                } else {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: PokemonGridWidget(pokeApiStore: pokeApiStore),
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
