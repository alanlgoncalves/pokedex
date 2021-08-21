import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/evolution_chain_utils.dart';
import 'package:pokedex/shared/widgets/image_dialog.dart';
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
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (_) => ImageDialogWidget(
                                  imageUrl: gigantamax.imageUrl),
                            );
                          },
                          child: Container(
                            width: 300,
                            child: CachedNetworkImage(
                                imageUrl: gigantamax.imageUrl),
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
