import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/theme/app_theme.dart';

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
              Column(
                children: [
                  Text(
                    "Moves learnt by level up",
                    style: AppTheme.texts.pokemonTabViewTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(.1),
                        1: FractionColumnWidth(.3),
                        2: FractionColumnWidth(.18),
                        3: FractionColumnWidth(.18),
                        4: FractionColumnWidth(.14),
                        5: FractionColumnWidth(.1),
                      },
                      children: [
                        TableRow(children: [
                          Text(
                            "Lv.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Move",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Type",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Cat.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Power",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Acc.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                        ]),
                        ..._pokeApiStore.pokemon!.moves.levelUp.map(
                          (move) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.level.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.move),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.type),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.category),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.power),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.accuracy),
                            ),
                          ], decoration: BoxDecoration()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Moves learnt by Technical Machines",
                    style: AppTheme.texts.pokemonTabViewTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(.1),
                        1: FractionColumnWidth(.3),
                        2: FractionColumnWidth(.18),
                        3: FractionColumnWidth(.18),
                        4: FractionColumnWidth(.14),
                        5: FractionColumnWidth(.1),
                      },
                      children: [
                        TableRow(children: [
                          Text(
                            "TM",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Move",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Type",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Cat.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Power",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Acc.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                        ]),
                        ..._pokeApiStore.pokemon!.moves.technicalMachine.map(
                          (move) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.technicalMachine.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.move),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.type),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.category),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.power),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.accuracy),
                            ),
                          ], decoration: BoxDecoration()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Moves learnt by Technical Machines",
                    style: AppTheme.texts.pokemonTabViewTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(.1),
                        1: FractionColumnWidth(.3),
                        2: FractionColumnWidth(.18),
                        3: FractionColumnWidth(.18),
                        4: FractionColumnWidth(.14),
                        5: FractionColumnWidth(.1),
                      },
                      children: [
                        TableRow(children: [
                          Text(
                            "TR",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Move",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Type",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Cat.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Power",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Acc.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                        ]),
                        ..._pokeApiStore.pokemon!.moves.technicalRecords.map(
                          (move) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.technicalRecord.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.move),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.type),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.category),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.power),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.accuracy),
                            ),
                          ], decoration: BoxDecoration()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Egg moves",
                    style: AppTheme.texts.pokemonTabViewTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(.4),
                        1: FractionColumnWidth(.18),
                        2: FractionColumnWidth(.18),
                        3: FractionColumnWidth(.14),
                        4: FractionColumnWidth(.1),
                      },
                      children: [
                        TableRow(children: [
                          Text(
                            "Move",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Type",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Cat.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Power",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Acc.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                        ]),
                        ..._pokeApiStore.pokemon!.moves.egg.map(
                          (move) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.move),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.type),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.category),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.power),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.accuracy),
                            ),
                          ], decoration: BoxDecoration()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Move Tutor moves",
                    style: AppTheme.texts.pokemonTabViewTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(.4),
                        1: FractionColumnWidth(.18),
                        2: FractionColumnWidth(.18),
                        3: FractionColumnWidth(.14),
                        4: FractionColumnWidth(.1),
                      },
                      children: [
                        TableRow(children: [
                          Text(
                            "Move",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Type",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Cat.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Power",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                          Text(
                            "Acc.",
                            style: AppTheme.texts.pokemonTabViewTitle,
                          ),
                        ]),
                        ..._pokeApiStore.pokemon!.moves.tutor.map(
                          (move) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.move),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.type),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.category),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.power),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(move.accuracy),
                            ),
                          ], decoration: BoxDecoration()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              )
            ],
          )),
    );
  }
}
