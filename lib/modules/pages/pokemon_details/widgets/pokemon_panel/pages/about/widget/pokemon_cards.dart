import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/hero_dialog_route.dart';
import 'package:pokedex/shared/widgets/image_dialog.dart';
import 'package:pokedex/theme/app_theme.dart';

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

    _pageController = PageController(initialPage: 0, viewportFraction: 0.65);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 28),
                child: Observer(
                  builder: (_) => Text(
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    child: CachedNetworkImage(
                                      width: 245,
                                      height: 342,
                                      imageUrl: card.imageUrl,
                                    ),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF000000).withAlpha(60),
                                        blurRadius: 6.0,
                                        spreadRadius: 3.0,
                                        offset: Offset(
                                          0.0,
                                          5.0,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${card.number} - ${card.name}",
                                style: AppTheme.texts.pokemonText,
                              ),
                              Text(
                                "${card.expansionName}",
                                style: AppTheme.texts.pokemonText,
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
