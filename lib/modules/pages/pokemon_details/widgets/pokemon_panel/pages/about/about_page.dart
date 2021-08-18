import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Observer(builder: (_) {
        return Column(
          children: [
            ..._pokeApiStore.pokemon!.descriptions
                .map((it) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        it,
                        style: AppTheme.texts.pokemonText,
                      ),
                    ))
                .toList(),
          ],
        );
      }),
    );
  }
}
