import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/base_stats/utils/table_row_factory.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/base_stats/widgets/base_stats_item.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

import '../../pokemon_mobile_panel.dart';

class BaseStatsPage extends StatelessWidget {
  static final _pokemonStore = GetIt.instance<PokemonStore>();

  const BaseStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const BaseStatsItemWidget(
                title: "HP",
              ),
              const BaseStatsItemWidget(
                title: "Attack",
              ),
              const BaseStatsItemWidget(
                title: "Defense",
              ),
              const BaseStatsItemWidget(
                title: "Sp. Atk",
              ),
              const BaseStatsItemWidget(
                title: "Sp. Def",
              ),
              const BaseStatsItemWidget(
                title: "Speed",
              ),
              const BaseStatsItemWidget(
                title: "Total",
                maxValue: 1200,
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            "Type Effectiveness",
            style: textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) => Table(
              columnWidths: {0: const FixedColumnWidth(100)},
              children: [
                TableRowFactory.build(context,
                    title: "Damaged normally by",
                    types: _pokemonStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "1")),
                TableRowFactory.build(context,
                    title: "Weak to",
                    types: _pokemonStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "2")),
                TableRowFactory.build(context,
                    title: "Resistant to",
                    types: _pokemonStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "½" || it.value == "¼")),
                TableRowFactory.build(context,
                    title: "Immune to",
                    types: _pokemonStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "0")),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
