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
                    textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
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
                                style: textTheme.bodyText1?.copyWith(
                                    color: Color(0xFF303943).withOpacity(0.4)),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.evYield}",
                                style: textTheme.bodyText1,
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
                                style: textTheme.bodyText1?.copyWith(
                                    color: Color(0xFF303943).withOpacity(0.4)),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.catchRate}",
                                style: textTheme.bodyText1,
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
                                style: textTheme.bodyText1?.copyWith(
                                    color: Color(0xFF303943).withOpacity(0.4)),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.baseFriendship}",
                                style: textTheme.bodyText1,
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
                                style: textTheme.bodyText1?.copyWith(
                                    color: Color(0xFF303943).withOpacity(0.4)),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.baseExp}",
                                style: textTheme.bodyText1,
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
                                style: textTheme.bodyText1?.copyWith(
                                    color: Color(0xFF303943).withOpacity(0.4)),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.training.growthRate}",
                                style: textTheme.bodyText1,
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
