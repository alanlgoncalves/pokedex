import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class SuperEvolutionChainItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final SuperEvolution superEvolution;

  const SuperEvolutionChainItemWidget(
      {Key? key, required this.pokemon, required this.superEvolution})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 83,
                    width: 83,
                    child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(
                        AppConstants.blackPokeballLogo,
                      ),
                    ),
                  ),
                  Container(
                    height: 83,
                    width: 83,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: pokemon.image,
                        width: 76,
                        height: 71,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                pokemon.name,
                style: AppTheme.texts.pokemonEvolutionChainName,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward,
          ),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 83,
                    width: 83,
                    child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(AppConstants.blackPokeballLogo),
                    ),
                  ),
                  Container(
                    height: 83,
                    width: 83,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: superEvolution.image,
                        width: 76,
                        height: 71,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                superEvolution.name,
                style: AppTheme.texts.pokemonEvolutionChainName,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
