import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/ui/widgets/image_dialog.dart';
import 'package:pokedex/shared/utils/evolution_chain_utils.dart';
import 'package:pokedex/shared/utils/hero_dialog_route.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class SuperEvolutionChainWidget extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  SuperEvolutionChainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final megaEvolutionChain =
        EvolutionChainUtils.buildSuperEvolutionChain(_pokeApiStore.pokemon!);

    return Column(
      children: [
        if (_pokeApiStore.pokemon!.megaEvolutions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Mega Evolution${_pokeApiStore.pokemon!.megaEvolutions.length > 1 ? "s" : ""}",
                  style: AppTheme.texts.pokemonTabViewTitle,
                ),
                ...megaEvolutionChain
              ],
            ),
          ),
        if (_pokeApiStore.pokemon!.gigantamaxEvolutions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  "Gigantamax Evolution${_pokeApiStore.pokemon!.megaEvolutions.length > 1 ? "s" : ""}",
                  style: AppTheme.texts.pokemonTabViewTitle,
                ),
                ..._pokeApiStore.pokemon!.gigantamaxEvolutions.map(
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
                          style: AppTheme.texts.pokemonEvolutionChainName,
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
