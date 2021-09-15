import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/pokemon_grid.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonGridPage extends StatefulWidget {
  PokemonGridPage({Key? key}) : super(key: key);

  @override
  _PokemonGridPageState createState() => _PokemonGridPageState();
}

class _PokemonGridPageState extends State<PokemonGridPage> {
  late PokeApiStore _pokeApiStore;

  @override
  void initState() {
    super.initState();

    _pokeApiStore = GetIt.instance<PokeApiStore>();
  }

  double getHomePadding(Size size) {
    double horizontalPadding = 0;

    if (size.width > 1200) {
      horizontalPadding = size.width * 0.15;
    } else {
      horizontalPadding = 10;
    }

    return horizontalPadding;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) {
        if (_pokeApiStore.pokemonsSummary == null) {
          return SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          );
        } else {
          if (_pokeApiStore.pokemonFilter.pokemonNameNumberFilter != null &&
              _pokeApiStore.pokemonsSummary!.isEmpty) {
            return SliverToBoxAdapter(
              child: Container(
                height: 250,
                width: 250,
                child: Stack(
                  children: [
                    Center(
                      child: Lottie.asset(
                        AppConstants.pikachuLottie,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          "${_pokeApiStore.pokemonFilter.pokemonNameNumberFilter} was not found",
                          style: AppTheme.texts.pokemonText,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: getHomePadding(size)),
            sliver: PokemonGridWidget(pokeApiStore: _pokeApiStore),
          );
        }
      },
    );
  }
}
