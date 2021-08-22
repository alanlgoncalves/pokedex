import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/utils/table_row_factory.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/widgets/base_stats_item.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class BaseStatsPage extends StatelessWidget {
  static final _pokeApiStore = GetIt.instance<PokeApiStore>();

  const BaseStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
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
            style: AppTheme.texts.pokemonTabViewTitle,
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) => Table(
              columnWidths: {0: const FixedColumnWidth(100)},
              children: [
                TableRowFactory.build(
                    title: "Damaged normally by",
                    types: _pokeApiStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "1")),
                TableRowFactory.build(
                    title: "Weak to",
                    types: _pokeApiStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "2")),
                TableRowFactory.build(
                    title: "Resistant to",
                    types: _pokeApiStore.pokemon!.typesEffectiveness.entries
                        .where((it) => it.value == "½" || it.value == "¼")),
                TableRowFactory.build(
                    title: "Immune to",
                    types: _pokeApiStore.pokemon!.typesEffectiveness.entries
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
