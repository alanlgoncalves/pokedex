import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/about_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/base_stats_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/evolution_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/moves_page.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonPanelWidget extends StatefulWidget {
  final Function(double position) listener;

  const PokemonPanelWidget({Key? key, required this.listener})
      : super(key: key);

  @override
  _PokemonPanelWidgetState createState() => _PokemonPanelWidgetState();
}

class _PokemonPanelWidgetState extends State<PokemonPanelWidget>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<PokemonPanelWidget> {
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);

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
            child: NestedScrollView(
              controller: scrollController,
              headerSliverBuilder: (context, value) {
                return [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverAppBar(
                      leading: Container(),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                      pinned: true,
                      centerTitle: true,
                      flexibleSpace: Container(
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
                    ),
                  )
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: const AboutPage(),
                  ),
                  SingleChildScrollView(
                    child: const BaseStatsPage(),
                  ),
                  SingleChildScrollView(
                    child: const EvolutionPage(),
                  ),
                  SingleChildScrollView(
                    child: const MovesPage(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      onPanelSlide: widget.listener,
      boxShadow: null,
    );
  }
}
