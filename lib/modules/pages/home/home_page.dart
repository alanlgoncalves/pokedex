import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/modules/pages/home/home_store.dart';
import 'package:pokedex/modules/pages/home/pokemon_filter.dart';
import 'package:pokedex/modules/pages/home/pokemon_generation_filter.dart';
import 'package:pokedex/modules/pages/home/pokemon_type_filter.dart';
import 'package:pokedex/modules/pages/home/widgets/animated_float_action_button.dart';
import 'package:pokedex/modules/pages/home/widgets/app_bar.dart';
import 'package:pokedex/modules/pages/home/widgets/pokemon_grid.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/shared/utils/converters.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _backgroundAnimationController;
  late Animation<double> _blackBackgroundOpacityAnimation;

  late AnimationController _fabAnimationController;
  late Animation<double> _fabRotateAnimation;
  late Animation<double> _fabSizeAnimation;

  late PokeApiStore _pokeApiStore;
  late HomeStore _homeStore;

  late PanelController _panelController;

  @override
  void initState() {
    super.initState();

    _pokeApiStore = GetIt.instance<PokeApiStore>();
    _homeStore = HomeStore();
    _panelController = PanelController();

    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _blackBackgroundOpacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_backgroundAnimationController);

    _fabAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fabRotateAnimation = Tween(begin: 180.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.easeOut, parent: _fabAnimationController));

    _fabSizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 80.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 20.0),
    ]).animate(_fabAnimationController);

    // TODO - Add on dispose()
    reaction((_) => _homeStore.isFilterOpen, (_) {
      if (_homeStore.isFilterOpen) {
        _panelController.open();
        _homeStore.showBackgroundBlack();
        _homeStore.hideFloatActionButton();
      } else {
        _panelController.close();
        _homeStore.hideBackgroundBlack();
        _homeStore.showFloatActionButton();
      }
    });

    // TODO - Add on dispose()
    reaction((_) => _homeStore.isBackgroundBlack, (_) {
      if (_homeStore.isBackgroundBlack) {
        _backgroundAnimationController.forward();
      } else {
        _backgroundAnimationController.reverse();
      }
    });

    // TODO - Add on dispose()
    reaction((_) => _homeStore.isFabVisible, (_) {
      if (_homeStore.isFabVisible) {
        _fabAnimationController.forward();
      } else {
        _fabAnimationController.reverse();
      }
    });

    // TODO - Add on dispose()
    reaction((_) => _pokeApiStore.pokemonNameNumberFilter, (_) {
      if (_pokeApiStore.pokemonNameNumberFilter == null) {
        BotToast.showText(text: "The search by name/number has been cleared");
      }
    });

    _fabAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                AppBarWidget(),
                Observer(
                  builder: (_) {
                    if (_pokeApiStore.pokemonsSummary == null) {
                      return SliverFillRemaining(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ));
                    } else {
                      if (_pokeApiStore.pokemonNameNumberFilter != null &&
                          _pokeApiStore.pokemonsSummary!.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Container(
                            height: 250,
                            width: 250,
                            child: Stack(
                              children: [
                                Center(
                                  child: Lottie.asset(
                                    AppConstants.pikachuLottie,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      "${_pokeApiStore.pokemonNameNumberFilter} was not found",
                                      style: AppTheme.texts.pokemonText,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }

                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        sliver: PokemonGridWidget(pokeApiStore: _pokeApiStore),
                      );
                    }
                  },
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              Observer(builder: (_) {
                if (_homeStore.isBackgroundBlack) {
                  return AnimatedBuilder(
                    animation: _fabAnimationController,
                    builder: (_, child) => FadeTransition(
                        opacity: _blackBackgroundOpacityAnimation,
                        child: child),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black87,
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              // TODO - Separate on new Widget file
              Observer(builder: (_) {
                late double maxHeight;

                if (_homeStore.panelType ==
                    PanelType.FILTER_POKEMON_NAME_NUMBER) {
                  maxHeight = 80;
                } else {
                  maxHeight = MediaQuery.of(context).size.height * 0.75;
                }

                return SlidingUpPanel(
                    maxHeight: maxHeight,
                    minHeight: MediaQuery.of(context).size.height * 0.0,
                    parallaxEnabled: true,
                    parallaxOffset: 0.5,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.9),
                        blurRadius: 10.0,
                      ),
                    ],
                    onPanelClosed: () {
                      _homeStore.closeFilter();
                      _pokeApiStore.clearNameNumberFilter();
                    },
                    onPanelOpened: () {
                      _homeStore.openFilter();
                    },
                    controller: _panelController,
                    panelBuilder: (scrollController) {
                      if (_homeStore.panelType ==
                          PanelType.FILTER_POKEMON_TYPE) {
                        return PokemonTypeFilter(
                          homeStore: _homeStore,
                          scrollController: scrollController,
                        );
                      }

                      if (_homeStore.panelType ==
                          PanelType.FILTER_POKEMON_GENERATION) {
                        return PokemonGenerationFilter(
                          homeStore: _homeStore,
                          scrollController: scrollController,
                        );
                      }

                      if (_homeStore.panelType ==
                          PanelType.FILTER_POKEMON_NAME_NUMBER) {
                        return PokemonNameNumberFilterPage(
                          homeStore: _homeStore,
                          onChanged: (value) {
                            _pokeApiStore.setNameNumberFilter(value);
                          },
                        );
                      }

                      return Container();
                    });
              }),
            ],
          ),
          AnimatedBuilder(
            animation: _fabAnimationController,
            builder: (_, child) => Transform(
              alignment: Alignment.bottomRight,
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(_fabRotateAnimation.value))
                ..scale(_fabSizeAnimation.value),
              child: child,
            ),
            child: AnimatedFloatActionButtonWidget(
              homeStore: _homeStore,
              backgroundAnimationController: _backgroundAnimationController,
            ),
          ),
        ],
      ),
    );
  }
}
