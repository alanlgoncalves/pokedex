import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/ui/widgets/image_dialog.dart';
import 'package:pokedex/shared/utils/evolution_chain_utils.dart';
import 'package:pokedex/shared/utils/hero_dialog_route.dart';
import 'package:pokedex/shared/utils/image_utils.dart';

class SuperEvolutionChainWidget extends StatelessWidget {
  final PokemonStore _pokemonStore = GetIt.instance<PokemonStore>();

  SuperEvolutionChainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final megaEvolutionChain =
        EvolutionChainUtils.buildSuperEvolutionChain(_pokemonStore.pokemon!);

    return Column(
      children: [
        if (_pokemonStore.pokemon!.megaEvolutions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Mega Evolution${_pokemonStore.pokemon!.megaEvolutions.length > 1 ? "s" : ""}",
                  style: textTheme.bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                ...megaEvolutionChain
              ],
            ),
          ),
        if (_pokemonStore.pokemon!.gigantamaxEvolutions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  "Gigantamax Evolution${_pokemonStore.pokemon!.megaEvolutions.length > 1 ? "s" : ""}",
                  style: textTheme.bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                ..._pokemonStore.pokemon!.gigantamaxEvolutions.map(
                  (gigantamax) => Center(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new HeroDialogRoute(
                                builder: (BuildContext context) {
                                  return ImageDialogWidget(
                                      tag:
                                          "super-evolution-chain-${gigantamax.name}",
                                      imageUrl: gigantamax.imageUrl);
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 300,
                            child: Hero(
                              tag: "super-evolution-chain-${gigantamax.name}",
                              child: ImageUtils.networkImage(
                                url: gigantamax.imageUrl,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          gigantamax.name,
                          style: textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
