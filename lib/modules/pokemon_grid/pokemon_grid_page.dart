import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/modules/pokemon_grid/widgets/pokemon_grid.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';

class PokemonGridPage extends StatefulWidget {
  PokemonGridPage({Key? key}) : super(key: key);

  @override
  _PokemonGridPageState createState() => _PokemonGridPageState();
}

class _PokemonGridPageState extends State<PokemonGridPage> {
  late PokemonStore _pokemonStore;

  @override
  void initState() {
    super.initState();

    _pokemonStore = GetIt.instance<PokemonStore>();

    _fetchPokemonData();
  }

  Future<void> _fetchPokemonData() async {
    await _pokemonStore.fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Observer(
      builder: (_) {
        if (_pokemonStore.pokemonsSummary == null) {
          return SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          );
        } else {
          if (_pokemonStore.pokemonFilter.pokemonNameNumberFilter != null &&
              _pokemonStore.pokemonsSummary!.isEmpty) {
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
                          "${_pokemonStore.pokemonFilter.pokemonNameNumberFilter} was not found",
                          style: textTheme.bodyText1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            sliver: PokemonGridWidget(pokemonStore: _pokemonStore),
          );
        }
      },
    );
  }
}
