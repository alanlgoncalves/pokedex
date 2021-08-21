import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/egg_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/evolution_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/level_up_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/technical_machines_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/technical_records_moves_table.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/widgets/tables/tutor_moves_table.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

class MovesPage extends StatelessWidget {
  final _pokeApiStore = GetIt.instance<PokeApiStore>();

  MovesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: [
              if (_pokeApiStore.pokemon!.moves.levelUp.isNotEmpty)
                LevelUpMovesTableWidget(pokemon: _pokeApiStore.pokemon!),
              if (_pokeApiStore.pokemon!.moves.technicalMachine.isNotEmpty)
                TechnicalMachinesMovesTableWidget(
                    pokemon: _pokeApiStore.pokemon!),
              if (_pokeApiStore.pokemon!.moves.technicalRecords.isNotEmpty)
                TechnicalRecordsMovesTableWidget(
                    pokemon: _pokeApiStore.pokemon!),
              if (_pokeApiStore.pokemon!.moves.evolution.isNotEmpty)
                EvolutionMovesTableWidget(pokemon: _pokeApiStore.pokemon!),
              if (_pokeApiStore.pokemon!.moves.egg.isNotEmpty)
                EggMovesTableWidget(pokemon: _pokeApiStore.pokemon!),
              if (_pokeApiStore.pokemon!.moves.tutor.isNotEmpty)
                TutorMovesTableWidget(pokemon: _pokeApiStore.pokemon!),
              SizedBox(
                height: 100,
              )
            ],
          )),
    );
  }
}
