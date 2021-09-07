import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/home/home_store.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class PokemonNameNumberFilterPage extends StatelessWidget {
  static final PokeApiStore pokeApiStore = GetIt.instance<PokeApiStore>();

  final ValueChanged<String> onChanged;
  final HomeStore homeStore;

  const PokemonNameNumberFilterPage(
      {Key? key, required this.homeStore, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 10),
      child: Column(
        children: [
          TextFormField(
            onChanged: onChanged,
            autofocus: true,
            minLines: 1,
            textAlign: TextAlign.center,
            style: AppTheme.texts.pokemonText,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Ex: Charizard or 006",
              fillColor: Color(0xFFE1E1E1),
              filled: true,
              //hintStyle: AppTheme.textStyles.stepperHintTextField,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
