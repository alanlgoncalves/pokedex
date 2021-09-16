import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonTitleInfoWidget extends StatelessWidget {
  final _pokemonStore = GetIt.instance<PokemonStore>();

  PokemonTitleInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Observer(builder: (_) {
                return Text(
                  _pokemonStore.pokemon!.name,
                  style: AppTheme.texts.pokemonDetailName,
                );
              }),
              Observer(builder: (_) {
                return Text("#${_pokemonStore.pokemon!.number}",
                    style: AppTheme.texts.pokemonDetailNumber);
              }),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Observer(builder: (_) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _pokemonStore.pokemon!.types
                      .map((type) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(
                                  type,
                                  style: AppTheme.texts.pokemonDetailType,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(38),
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                          ))
                      .toList(),
                );
              }),
              Observer(
                builder: (_) {
                  return Text("${_pokemonStore.pokemon!.specie} Pokemon",
                      style: AppTheme.texts.pokemonDetailSpecie);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
