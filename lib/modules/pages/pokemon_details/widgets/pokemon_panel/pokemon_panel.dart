import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/pokemon_details_store.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/evolution_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves_page.dart';

import 'package:pokedex/theme/app_theme.dart';

class PokemonPanelWidget extends StatefulWidget {
  final bool Function(DraggableScrollableNotification notification) listener;

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
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: widget.listener,
      child: DraggableScrollableSheet(
        initialChildSize: 0.55,
        minChildSize: 0.55,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AboutPage(),
                      BaseStatsPage(),
                      SingleChildScrollView(
                        controller: scrollController,
                        child: EvolutionPage(),
                      ),
                      MovesPage(),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: TabBar(
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
                    ),
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
