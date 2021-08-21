import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/about_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/base_stats_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/evolution_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/moves_page.dart';

import 'package:pokedex/theme/app_theme.dart';

class PokemonPanelWidget extends StatefulWidget {
  final Function(double position) listener;

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

  double get _minSlideUpHeight => Platform.isAndroid ? 0.48 : 0.52;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      minHeight: MediaQuery.of(context).size.height * _minSlideUpHeight,
      parallaxEnabled: true,
      parallaxOffset: 0.5,
      panelBuilder: (scrollController) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
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
                      SingleChildScrollView(
                        controller: scrollController,
                        child: AboutPage(),
                      ),
                      SingleChildScrollView(
                        controller: scrollController,
                        child: BaseStatsPage(),
                      ),
                      SingleChildScrollView(
                        controller: scrollController,
                        child: EvolutionPage(),
                      ),
                      SingleChildScrollView(
                        controller: scrollController,
                        child: MovesPage(),
                      ),
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
          ),
        );
      },
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      onPanelSlide: widget.listener,
      boxShadow: null,
    );
  }
}
