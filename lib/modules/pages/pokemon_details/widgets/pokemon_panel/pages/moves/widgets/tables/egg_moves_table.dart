import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/table_moves.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

class EggMovesTableWidget extends StatelessWidget {
  final Pokemon pokemon;

  const EggMovesTableWidget({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text(
            "Egg moves",
            style: AppTheme.texts.pokemonTabViewTitle,
          ),
          SizedBox(
            height: 15,
          ),
          TableMovesWidget(
            columns: [
              Text("Move", style: AppTheme.texts.pokemonTabViewTitle),
              Text("Type", style: AppTheme.texts.pokemonTabViewTitle),
              Text("Cat.", style: AppTheme.texts.pokemonTabViewTitle),
              Text("Power", style: AppTheme.texts.pokemonTabViewTitle),
              Text("Acc.", style: AppTheme.texts.pokemonTabViewTitle),
            ],
            rows: pokemon.moves.egg
                .map((move) => [
                      Text(move.move, style: AppTheme.texts.pokemonText),
                      PokemonTypeBadge(type: move.type, height: 16, width: 16),
                      Text(move.category, style: AppTheme.texts.pokemonText),
                      Text(move.power, style: AppTheme.texts.pokemonText),
                      Text(move.accuracy, style: AppTheme.texts.pokemonText)
                    ])
                .toList(),
          ),
        ],
      ),
    );
  }
}
