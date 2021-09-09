import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/ui/widgets/image_dialog.dart';
import 'package:pokedex/shared/utils/hero_dialog_route.dart';
import 'package:pokedex/theme/app_theme.dart';

class SuperEvolutionChainItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final SuperEvolution superEvolution;

  final String pokemonHeroTag = "super-evolution-item-${UniqueKey()}";
  final String superEvolutionHeroTag = "super-evolution-item-${UniqueKey()}";

  SuperEvolutionChainItemWidget(
      {Key? key, required this.pokemon, required this.superEvolution})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 83,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new HeroDialogRoute(
                        builder: (BuildContext context) {
                          return ImageDialogWidget(
                              tag: pokemonHeroTag, imageUrl: pokemon.imageUrl);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 83,
                        width: 83,
                        child: CustomPaint(
                          size: Size(83, (83 * 1.0040160642570282).toDouble()),
                          painter: PokeballLogoPainter(
                            color: AppTheme.colors.pokeballLogoGray
                                .withOpacity(0.2),
                          ),
                        ),
                      ),
                      Container(
                        height: 83,
                        width: 83,
                        child: Center(
                          child: Hero(
                            tag: pokemonHeroTag,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.imageUrl,
                              width: 76,
                              height: 71,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  pokemon.name,
                  style: AppTheme.texts.pokemonEvolutionChainName,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            child: Icon(
              Icons.arrow_forward,
            ),
          ),
          Container(
            width: 83,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new HeroDialogRoute(
                        builder: (BuildContext context) {
                          return ImageDialogWidget(
                              tag: superEvolutionHeroTag,
                              imageUrl: superEvolution.imageUrl);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 83,
                        width: 83,
                        child: CustomPaint(
                          size: Size(83, (83 * 1.0040160642570282).toDouble()),
                          painter: PokeballLogoPainter(
                            color: AppTheme.colors.pokeballLogoGray
                                .withOpacity(0.2),
                          ),
                        ),
                      ),
                      Container(
                        height: 83,
                        width: 83,
                        child: Center(
                          child: Hero(
                            tag: superEvolutionHeroTag,
                            child: CachedNetworkImage(
                              imageUrl: superEvolution.imageUrl,
                              width: 76,
                              height: 71,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  superEvolution.name,
                  style: AppTheme.texts.pokemonEvolutionChainName,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
