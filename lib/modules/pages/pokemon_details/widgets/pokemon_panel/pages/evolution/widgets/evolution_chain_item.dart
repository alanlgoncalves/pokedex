import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class EvolutionChainItemWidget extends StatelessWidget {
  final EvolutionChain previousEvolution;
  final EvolutionChain nextEvolution;

  const EvolutionChainItemWidget(
      {Key? key, required this.previousEvolution, required this.nextEvolution})
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
                        imageUrl: previousEvolution.image,
                        width: 76,
                        height: 71,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                previousEvolution.name,
                style: AppTheme.texts.pokemonEvolutionChainName,
              ),
              Text(
                "#${previousEvolution.number}",
                style: AppTheme.texts.pokemonEvolutionChainNumber,
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.arrow_forward,
              ),
              Container(
                width: 100,
                child: Text(
                  nextEvolution.requirement!,
                  style: AppTheme.texts.pokemonEvolutionChainRequirement,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
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
                        imageUrl: nextEvolution.image,
                        width: 76,
                        height: 71,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                nextEvolution.name,
                style: AppTheme.texts.pokemonEvolutionChainName,
              ),
              Text(
                "#${nextEvolution.number}",
                style: AppTheme.texts.pokemonEvolutionChainNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
