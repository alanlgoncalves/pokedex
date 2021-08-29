import 'package:flutter/material.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/about/about_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/base_stats/base_stats_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution/evolution_page.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/moves/moves_page.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonMobilePanelWidget extends StatefulWidget {
  final Function(double position) listener;

  const PokemonMobilePanelWidget({
    Key? key,
    required this.listener,
  }) : super(key: key);

  @override
  _PokemonMobilePanelWidgetState createState() =>
      _PokemonMobilePanelWidgetState();
}

class _PokemonMobilePanelWidgetState extends State<PokemonMobilePanelWidget>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<PokemonMobilePanelWidget> {
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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height * 1,
      minHeight: MediaQuery.of(context).size.height * 0.50,
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
                  SliverAppBar(
                    leading: Container(),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    pinned: true,
                    centerTitle: true,
                    flexibleSpace: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: TabBar(
                            unselectedLabelColor:
                                AppTheme.colors.pokemonTabTitle,
                            labelColor: AppTheme.colors.selectPokemonTabTitle,
                            unselectedLabelStyle:
                                AppTheme.texts.pokemonTabTitle,
                            labelStyle: AppTheme.texts.selectPokemonTabTitle,
                            indicatorColor: AppTheme.colors.tabIndicator,
                            controller: _tabController,
                            tabs: [
                              Tab(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "About",
                                    style: AppTheme.texts.pokemonTabTitle,
                                  ),
                                ),
                              ),
                              Tab(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Base Stats",
                                    style: AppTheme.texts.pokemonTabTitle,
                                  ),
                                ),
                              ),
                              Tab(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Evolution",
                                    style: AppTheme.texts.pokemonTabTitle,
                                  ),
                                ),
                              ),
                              Tab(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Moves",
                                    style: AppTheme.texts.pokemonTabTitle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: EdgeInsets.only(top: 20),
                child: TabBarView(
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
