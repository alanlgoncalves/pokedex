import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/utils/table_row_factory.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/widgets/base_stats_item.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class BaseStatsPage extends StatelessWidget {
  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  BaseStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                BaseStatsItemWidget(
                  title: "HP",
                  value: _pokeApiStore.pokemon!.baseStats.hp,
                ),
                BaseStatsItemWidget(
                  title: "Attack",
                  value: _pokeApiStore.pokemon!.baseStats.attack,
                ),
                BaseStatsItemWidget(
                  title: "Defense",
                  value: _pokeApiStore.pokemon!.baseStats.defense,
                ),
                BaseStatsItemWidget(
                  title: "Sp. Atk",
                  value: _pokeApiStore.pokemon!.baseStats.spAtk,
                ),
                BaseStatsItemWidget(
                  title: "Sp. Def",
                  value: _pokeApiStore.pokemon!.baseStats.spDef,
                ),
                BaseStatsItemWidget(
                  title: "Speed",
                  value: _pokeApiStore.pokemon!.baseStats.speed,
                ),
                BaseStatsItemWidget(
                  title: "Total",
                  value: _pokeApiStore.pokemon!.baseStats.total,
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
            Table(
              columnWidths: {0: FixedColumnWidth(100)},
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
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
