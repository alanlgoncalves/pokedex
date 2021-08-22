import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class HeightWeightInfoWidget extends StatelessWidget {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();

  const HeightWeightInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
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
              Text(
                "Height",
                style: AppTheme.texts.pokemonTabViewSubTitle,
              ),
              SizedBox(
                height: 11,
              ),
              Observer(
                builder: (_) => Text(
                  _pokeApiStore.pokemon!.height,
                  style: AppTheme.texts.pokemonText,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weight",
                style: AppTheme.texts.pokemonTabViewSubTitle,
              ),
              SizedBox(
                height: 11,
              ),
              Observer(
                builder: (_) => Text(
                  _pokeApiStore.pokemon!.weight,
                  style: AppTheme.texts.pokemonText,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
