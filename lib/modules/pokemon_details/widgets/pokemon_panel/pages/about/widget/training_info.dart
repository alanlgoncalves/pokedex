import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

class TrainingInfoWidget extends StatelessWidget {
  static final _pokemonStore = GetIt.instance<PokemonStore>();

  const TrainingInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
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
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "EV yield",
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.evYield}",
                                style: textTheme.bodyLarge,
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
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "Catch rate",
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.catchRate}",
                                style: textTheme.bodyLarge,
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
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "Base Friendship",
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.baseFriendship}",
                                style: textTheme.bodyLarge,
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
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "Base Exp.",
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.baseExp}",
                                style: textTheme.bodyLarge,
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
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "Growth Rate",
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.growthRate}",
                                style: textTheme.bodyLarge,
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
