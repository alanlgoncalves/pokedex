import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/table_moves.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../../moves_store.dart';

class EggMovesTableWidget extends StatelessWidget {
  static final PokemonStore _pokemonStore = GetIt.instance<PokemonStore>();
  final MovesStore movesStore;
  final int index;

  const EggMovesTableWidget(
      {Key? key, required this.movesStore, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (movesStore.panels[index]) {
        return TableMovesWidget(
          columns: [
            Text("Move", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Type", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Cat.", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Power", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Acc.", style: AppTheme.texts.pokemonTabViewTitle),
          ],
          rows: _pokemonStore.pokemon!.moves.egg
              .map((move) => [
                    Text(move.move, style: AppTheme.texts.pokemonText),
                    PokemonTypeBadge(type: move.type, height: 16, width: 16),
                    Text(move.category, style: AppTheme.texts.pokemonText),
                    Text(move.power, style: AppTheme.texts.pokemonText),
                    Text(move.accuracy, style: AppTheme.texts.pokemonText)
                  ])
              .toList(),
        );
      } else {
        return Container();
      }
    });
  }
}
