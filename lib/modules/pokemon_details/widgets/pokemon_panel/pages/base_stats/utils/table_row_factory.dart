import 'package:flutter/material.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/base_stats/widgets/type_effectiveness_badge.dart';

class TableRowFactory {
  static TableRow build(BuildContext context,
      {required String title,
      required Iterable<MapEntry<String, String>> types}) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Opacity(
          opacity: 0.4,
          child: Text(title, style: textTheme.bodyText1),
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
