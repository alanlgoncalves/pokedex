import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/theme/app_theme.dart';

class BreedingInfoWidget extends StatelessWidget {
  final Pokemon pokemon;

  const BreedingInfoWidget({Key? key, required this.pokemon}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Text(
                  "Breeding",
                  style: AppTheme.texts.pokemonTabViewTitle,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Row(
                      children: [
                        Container(
                          width: 88,
                          child: Text(
                            "Gender",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        ...pokemon.breeding.genders.map((gender) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                if (gender.type == GenderType.MALE)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.mars,
                                      color: AppTheme.colors.marsIcon,
                                    ),
                                  ),
                                if (gender.type == GenderType.FEMALE)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.venus,
                                      color: AppTheme.colors.venusIcon,
                                    ),
                                  ),
                                if (gender.type == GenderType.UNKNOWN)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "???",
                                      style: AppTheme.texts.pokemonText,
                                    ),
                                  ),
                                Text(
                                  gender.type == GenderType.UNKNOWN
                                      ? "--%"
                                      : "${gender.percentage}",
                                  style: AppTheme.texts.pokemonText,
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Row(
                      children: [
                        Container(
                          width: 88,
                          child: Text(
                            "Egg Groups",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.breeding.egg!.groups.join(", ")}",
                          style: AppTheme.texts.pokemonText,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Row(
                      children: [
                        Container(
                          width: 88,
                          child: Text(
                            "Egg Cycle",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.breeding.egg!.cycle}",
                          style: AppTheme.texts.pokemonText,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
