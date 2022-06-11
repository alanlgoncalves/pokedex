import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/moves_store.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/egg_moves_table.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/evolution_moves_table.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/level_up_moves_table.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/technical_machines_moves_table.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/technical_records_moves_table.dart';
import 'package:pokedex/modules/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/tutor_moves_table.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

import '../../pokemon_mobile_panel.dart';

class MovesPage extends StatefulWidget {
  const MovesPage({Key? key}) : super(key: key);

  @override
  _MovesPageState createState() => _MovesPageState();
}

class _MovesPageState extends State<MovesPage>
    with AutomaticKeepAliveClientMixin<MovesPage> {
  static final PokemonStore _pokemonStore = GetIt.instance<PokemonStore>();
  late MovesStore _movesStore;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _movesStore = MovesStore();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    final horizontalPadding = getDetailsPanelsPadding(size);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          Observer(
            builder: (_) {
              int counter = 0;

              int getCounter() {
                return counter;
              }

              int getCounterAndAdd() {
                return counter++;
              }

              return ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                children: [
                  if (_pokemonStore.pokemon!.moves.levelUp.isNotEmpty)
                    ExpansionPanel(
                      isExpanded: _movesStore.panels[getCounter()],
                      headerBuilder: (context, opened) => Center(
                        child: Text(
                          "Moves learnt by level up",
                          style: textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: LevelUpMovesTableWidget(
                          movesStore: _movesStore,
                          index: getCounterAndAdd(),
                        ),
                      ),
                    ),
                  if (_pokemonStore.pokemon!.moves.technicalMachine.isNotEmpty)
                    ExpansionPanel(
                      isExpanded: _movesStore.panels[getCounter()],
                      headerBuilder: (context, opened) => Center(
                        child: Text(
                          "Moves learnt by Technical Machines",
                          style: textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TechnicalMachinesMovesTableWidget(
                          movesStore: _movesStore,
                          index: getCounterAndAdd(),
                        ),
                      ),
                    ),
                  if (_pokemonStore.pokemon!.moves.technicalRecords.isNotEmpty)
                    ExpansionPanel(
                      isExpanded: _movesStore.panels[getCounter()],
                      headerBuilder: (context, opened) => Center(
                        child: Text(
                          "Moves learnt by Technical Records",
                          style: textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TechnicalRecordsMovesTableWidget(
                          movesStore: _movesStore,
                          index: getCounterAndAdd(),
                        ),
                      ),
                    ),
                  if (_pokemonStore.pokemon!.moves.evolution.isNotEmpty)
                    ExpansionPanel(
                      isExpanded: _movesStore.panels[getCounter()],
                      headerBuilder: (context, opened) => Center(
                        child: Text(
                          "Moves learnt on evolution",
                          style: textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: EvolutionMovesTableWidget(
                          movesStore: _movesStore,
                          index: getCounterAndAdd(),
                        ),
                      ),
                    ),
                  if (_pokemonStore.pokemon!.moves.egg.isNotEmpty)
                    ExpansionPanel(
                      isExpanded: _movesStore.panels[getCounter()],
                      headerBuilder: (context, opened) => Center(
                        child: Text(
                          "Egg moves",
                          style: textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: EggMovesTableWidget(
                          movesStore: _movesStore,
                          index: getCounterAndAdd(),
                        ),
                      ),
                    ),
                  if (_pokemonStore.pokemon!.moves.tutor.isNotEmpty)
                    ExpansionPanel(
                      isExpanded: _movesStore.panels[getCounter()],
                      headerBuilder: (context, opened) => Center(
                        child: Text(
                          "Tutor moves",
                          style: textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TutorMovesTableWidget(
                          movesStore: _movesStore,
                          index: getCounterAndAdd(),
                        ),
                      ),
                    ),
                ],
                expansionCallback: (index, isOpen) =>
                    _movesStore.setOpen(index),
              );
            },
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
