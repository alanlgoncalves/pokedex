import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class TrainingInfoWidget extends StatelessWidget {
  static final _pokemonStore = GetIt.instance<PokemonStore>();

  const TrainingInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Text(
                "Training",
                style: AppTheme.texts.pokemonTabViewTitle,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.evYield}",
                                style: AppTheme.texts.pokemonText,
                              ),
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
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.catchRate}",
                                style: AppTheme.texts.pokemonText,
                              ),
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
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.baseFriendship}",
                                style: AppTheme.texts.pokemonText,
                              ),
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
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.baseExp}",
                                style: AppTheme.texts.pokemonText,
                              ),
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
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.growthRate}",
                                style: AppTheme.texts.pokemonText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
