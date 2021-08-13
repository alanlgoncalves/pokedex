import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class PokemonPagerWidget extends StatefulWidget {
  final int index;

  const PokemonPagerWidget({Key? key, required this.index}) : super(key: key);

  @override
  _PokemonPagerState createState() => _PokemonPagerState();
}

class _PokemonPagerState extends State<PokemonPagerWidget> {
  late PageController _pageController;
  late PokeApiStore _pokeApiStore;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.index);
    _pokeApiStore = GetIt.instance<PokeApiStore>();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 223,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pokeApiStore.pokeApi!.pokemon!.length,
        onPageChanged: _pokeApiStore.setPokemon,
        itemBuilder: (context, index) {
          final listPokemon = _pokeApiStore.getPokemon(index);

          return Observer(
            builder: (_) {
              return AnimatedPadding(
                padding: EdgeInsets.all(
                    _pokeApiStore.pokemon == listPokemon ? 0 : 60),
                duration: Duration(milliseconds: 300),
                child: Container(
                  child: Hero(
                    tag: "pokemon-image-${listPokemon.num}",
                    child: CachedNetworkImage(
                      imageUrl: listPokemon.imageUrl,
                      color: _pokeApiStore.pokemon == listPokemon
                          ? null
                          : Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
