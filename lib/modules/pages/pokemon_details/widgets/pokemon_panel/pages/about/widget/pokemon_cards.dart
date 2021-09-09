import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/ui/widgets/image_dialog.dart';
import 'package:pokedex/shared/utils/hero_dialog_route.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../../../pokemon_mobile_panel.dart';

class PokemonCardsWidget extends StatefulWidget {
  const PokemonCardsWidget({Key? key}) : super(key: key);

  @override
  _PokemonCardsWidgetState createState() => _PokemonCardsWidgetState();
}

class _PokemonCardsWidgetState extends State<PokemonCardsWidget> {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double getViewportFraction(Size size) {
    double? viewportFraction = 0;

    if (size.width > 1200) {
      viewportFraction = 0.18;
    } else if (size.width > 900) {
      viewportFraction = 0.22;
    } else if (size.width > 600) {
      viewportFraction = 0.35;
    } else {
      viewportFraction = 0.5;
    }

    return viewportFraction;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double? viewportFraction = getViewportFraction(size);
    final horizontalPadding = getDetailsPanelsPadding(size);

    _pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    "${_pokeApiStore.pokemon!.name} Cards",
                    style: AppTheme.texts.pokemonTabViewTitle,
                  ),
                ),
              ),
              SizedBox(height: 9),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Observer(
                  builder: (_) => PageView.builder(
                    controller: _pageController,
                    itemCount: _pokeApiStore.pokemon!.cards.length,
                    itemBuilder: (context, index) {
                      final card = _pokeApiStore.pokemon!.cards[index];

                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new HeroDialogRoute(
                                builder: (BuildContext context) {
                                  return ImageDialogWidget(
                                      tag: "${card.name}-" +
                                          "${card.number}- " +
                                          "${card.expansionName}",
                                      imageUrl: card.imageUrl);
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Hero(
                                tag: "${card.name}-" +
                                    "${card.number}- " +
                                    "${card.expansionName}",
                                child: Container(
                                  width: 230,
                                  height: 280,
                                  child: CachedNetworkImage(
                                    width: 225,
                                    height: 342,
                                    imageUrl: card.imageUrl,
                                  ),
                                ),
                              ),
                              Text(
                                "${card.number} - ${card.name}",
                                style: AppTheme.texts.pokemonText,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "${card.expansionName}",
                                  style: AppTheme.texts.pokemonText,
                                ),
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ],
      ),
    );
  }
}
