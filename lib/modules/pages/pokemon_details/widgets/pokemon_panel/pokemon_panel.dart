import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves_page.dart';

import 'package:pokedex/theme/app_theme.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonPanelWidget extends StatefulWidget {
  final void Function(SheetState) listener;

  const PokemonPanelWidget({Key? key, required this.listener})
      : super(key: key);

  @override
  _PokemonPanelWidgetState createState() => _PokemonPanelWidgetState();
}

class _PokemonPanelWidgetState extends State<PokemonPanelWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      listener: widget.listener,
      elevation: 0,
      cornerRadius: 30,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.65, 1.0],
        positioning: SnapPositioning.relativeToSheetHeight,
      ),
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height - 130,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    leadingWidth: 0,
                    toolbarHeight: 100,
                    centerTitle: true,
                    leading: Container(),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TabBar(
                          unselectedLabelColor: AppTheme.colors.pokemonTabTitle,
                          labelColor: AppTheme.colors.selectPokemonTabTitle,
                          unselectedLabelStyle: AppTheme.texts.pokemonTabTitle,
                          labelStyle: AppTheme.texts.selectPokemonTabTitle,
                          indicatorColor: AppTheme.colors.tabIndicator,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: "About",
                            ),
                            Tab(
                              text: "Base Stats",
                            ),
                            Tab(
                              text: "Evolution",
                            ),
                            Tab(
                              text: "Moves",
                            ),
                          ],
                        ),
                      ],
                    )),
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    AboutPage(),
                    BaseStatsPage(),
                    EvolutionPage(),
                    MovesPage(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 75),
                child: Container(
                  height: 1,
                  color: AppTheme.colors.tabDivisor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
