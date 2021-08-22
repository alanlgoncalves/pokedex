import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/theme/app_theme.dart';

class TrainingInfoWidget extends StatelessWidget {
  final Pokemon pokemon;

  const TrainingInfoWidget({Key? key, required this.pokemon}) : super(key: key);

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
                  "Training",
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
                            "EV yield",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.training.evYield}",
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
                            "Catch rate",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.training.catchRate}",
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
                            "Base Friendship",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.training.baseFriendship}",
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
                            "Base Exp.",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.training.baseExp}",
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
                            "Growth Rate	",
                            style: AppTheme.texts.pokemonTabViewSubTitle,
                          ),
                        ),
                        Text(
                          "${pokemon.training.growthRate}",
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
