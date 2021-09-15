import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/table_moves.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../../moves_store.dart';

class LevelUpMovesTableWidget extends StatelessWidget {
  static final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
  final MovesStore movesStore;
  final int index;

  const LevelUpMovesTableWidget(
      {Key? key, required this.movesStore, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (movesStore.panels[index]) {
        return TableMovesWidget(
          columns: [
            Text("Lv.", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Move", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Type", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Cat.", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Power", style: AppTheme.texts.pokemonTabViewTitle),
            Text("Acc.", style: AppTheme.texts.pokemonTabViewTitle),
          ],
          rows: _pokeApiStore.pokemon!.moves.levelUp
              .map((move) => [
                    Text(move.level.toString(),
                        style: AppTheme.texts.pokemonText),
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
