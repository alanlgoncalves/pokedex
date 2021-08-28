import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/moves_store.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/egg_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/evolution_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/level_up_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/technical_machines_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/technical_records_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/tutor_moves_table.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

class MovesPage extends StatefulWidget {
  const MovesPage({Key? key}) : super(key: key);

  @override
  _MovesPageState createState() => _MovesPageState();
}

class _MovesPageState extends State<MovesPage>
    with AutomaticKeepAliveClientMixin<MovesPage> {
  static final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
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

    return Column(
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
                if (_pokeApiStore.pokemon!.moves.levelUp.isNotEmpty)
                  ExpansionPanel(
                    isExpanded: _movesStore.panels[getCounter()],
                    headerBuilder: (context, opened) => Center(
                      child: Text(
                        "Moves learnt by level up",
                        style: AppTheme.texts.pokemonTabViewTitle,
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
                if (_pokeApiStore.pokemon!.moves.technicalMachine.isNotEmpty)
                  ExpansionPanel(
                    isExpanded: _movesStore.panels[getCounter()],
                    headerBuilder: (context, opened) => Center(
                      child: Text(
                        "Moves learnt by Technical Machines",
                        style: AppTheme.texts.pokemonTabViewTitle,
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
                if (_pokeApiStore.pokemon!.moves.technicalRecords.isNotEmpty)
                  ExpansionPanel(
                    isExpanded: _movesStore.panels[getCounter()],
                    headerBuilder: (context, opened) => Center(
                      child: Text(
                        "Moves learnt by Technical Records",
                        style: AppTheme.texts.pokemonTabViewTitle,
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
                if (_pokeApiStore.pokemon!.moves.evolution.isNotEmpty)
                  ExpansionPanel(
                    isExpanded: _movesStore.panels[getCounter()],
                    headerBuilder: (context, opened) => Center(
                      child: Text(
                        "Moves learnt on evolution",
                        style: AppTheme.texts.pokemonTabViewTitle,
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
                if (_pokeApiStore.pokemon!.moves.egg.isNotEmpty)
                  ExpansionPanel(
                    isExpanded: _movesStore.panels[getCounter()],
                    headerBuilder: (context, opened) => Center(
                      child: Text(
                        "Egg moves",
                        style: AppTheme.texts.pokemonTabViewTitle,
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
                if (_pokeApiStore.pokemon!.moves.tutor.isNotEmpty)
                  ExpansionPanel(
                    isExpanded: _movesStore.panels[getCounter()],
                    headerBuilder: (context, opened) => Center(
                      child: Text(
                        "Tutor moves",
                        style: AppTheme.texts.pokemonTabViewTitle,
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
              expansionCallback: (index, isOpen) => _movesStore.setOpen(index),
            );
          },
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
