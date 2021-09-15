import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/widgets/type_effectiveness_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

class TableRowFactory {
  static TableRow build(
      {required String title,
      required Iterable<MapEntry<String, String>> types}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: AppTheme.texts.pokemonTabViewSubTitle,
        ),
      ),
      if (types.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            children: types
                .map((it) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: TypeEffectivenessWidget(
                        type: it.key,
                        value: it.value,
                      ),
                    ))
                .toList(),
          ),
        ),
      if (types.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            children: [
              TypeEffectivenessWidget(
                hasNone: true,
              ),
            ],
          ),
        )
    ]);
  }
}
