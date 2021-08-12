import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int index;

  const PokemonDetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  late PokeApiStore _pokeApiStore;
  late PageController _pageController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _pokeApiStore = Provider.of<PokeApiStore>(context, listen: false);
    _pageController = PageController(initialPage: widget.index);

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
          SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 1.0],
              positioning: SnapPositioning.relativeToSheetHeight,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            },
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
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
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: SizedBox(
              height: 223,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pokeApiStore.pokeApi!.pokemon!.length,
                onPageChanged: _pokeApiStore.setPokemon,
                itemBuilder: (context, index) {
                  final listPokemon = _pokeApiStore.getPokemon(index);

                  return Container(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${listPokemon.num}.png",
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        _pokeApiStore.pokemon!.name!,
                        style: AppTheme.texts.pokemonDetailName,
                      );
                    }),
                    Observer(builder: (_) {
                      return Text("#${_pokeApiStore.pokemon!.num!}",
                          style: AppTheme.texts.pokemonDetailNumber);
                    }),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _pokeApiStore.pokemon!.type!
                            .map((type) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Text(
                                        type,
                                        style: AppTheme.texts.pokemonDetailType,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(38),
                                        color: Colors.white.withOpacity(0.4)),
                                  ),
                                ))
                            .toList(),
                      );
                    }),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
