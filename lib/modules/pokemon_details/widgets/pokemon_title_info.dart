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
    final TextTheme textTheme = Theme.of(context).textTheme;

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
                  style: textTheme.headline1?.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.getColors(context).pokemonDetailsTitleColor,
                  ),
                );
              }),
              Observer(builder: (_) {
                return Text("#${_pokemonStore.pokemon!.number}",
                    style: textTheme.headline4?.copyWith(
                      color:
                          AppTheme.getColors(context).pokemonDetailsTitleColor,
                    ));
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
                                child: Text(type,
                                    style: textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.getColors(context)
                                          .pokemonDetailsTitleColor,
                                    )),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(38),
                                  color: AppTheme.getColors(context)
                                      .pokemonDetailsTitleColor
                                      .withOpacity(0.4)),
                            ),
                          ))
                      .toList(),
                );
              }),
              Observer(
                builder: (_) {
                  return Text("${_pokemonStore.pokemon!.specie} Pokemon",
                      style: textTheme.bodyText1?.copyWith(
                        color: AppTheme.getColors(context)
                            .pokemonDetailsTitleColor,
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
