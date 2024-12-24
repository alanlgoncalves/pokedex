import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class HeightWeightInfoWidget extends StatelessWidget {
  static final _pokemonStore = GetIt.instance<PokemonStore>();

  const HeightWeightInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).colorScheme.surface
            : AppTheme.getColors(context).panelBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.4,
                child: Text(
                  "Height",
                  style: textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Observer(
                builder: (_) => Text(
                  _pokemonStore.pokemon!.height,
                  style: textTheme.bodyLarge,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.4,
                child: Text(
                  "Weight",
                  style: textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Observer(
                builder: (_) => Text(
                  _pokemonStore.pokemon!.weight,
                  style: textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
