import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/shared/models/poke_api.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokeItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final int index;
  final Widget image;

  const PokeItemWidget(
      {Key? key,
      required this.pokemon,
      required this.index,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.pokemonItem(pokemon.type![0]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -15,
            right: -3,
            child: Container(
              child: Opacity(
                opacity: 0.3,
                child: SvgPicture.asset(
                  AppConstants.whitePokeballLogo,
                  height: 83,
                  width: 83,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 7, bottom: 3),
              child: Container(
                child: image,
                height: 71,
                width: 76,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name!,
                  style: AppTheme.texts.pokemonItemName,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: pokemon.type!
                      .map((type) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(
                                  type,
                                  style: AppTheme.texts.pokemonItemType,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(38),
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
