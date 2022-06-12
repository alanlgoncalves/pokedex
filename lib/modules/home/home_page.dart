import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/home/widgets/animated_fab/animated_float_action_button.dart';
import 'package:pokedex/modules/home/widgets/home_panel/home_panel.dart';
import 'package:pokedex/modules/items/items_page.dart';
import 'package:pokedex/modules/pokemon_grid/pokemon_grid_page.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/stores/item_store/item_store.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/ui/widgets/app_bar.dart';
import 'package:pokedex/shared/ui/widgets/drawer_menu/drawer_menu.dart';
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

  late AnimationController _fabAnimationRotationController;
  late AnimationController _fabAnimationOpenController;
  late Animation<double> _fabRotateAnimation;
  late Animation<double> _fabSizeAnimation;

  late PokemonStore _pokemonStore;
  late ItemStore _itemStore;
  late HomePageStore _homeStore;
  late PanelController _panelController;

  late List<ReactionDisposer> reactionDisposer = [];

  @override
  void initState() {
    super.initState();

    _pokemonStore = GetIt.instance<PokemonStore>();
    _itemStore = GetIt.instance<ItemStore>();
    _homeStore = GetIt.instance<HomePageStore>();
    _panelController = PanelController();

    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _blackBackgroundOpacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_backgroundAnimationController);

    _fabAnimationRotationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fabAnimationOpenController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _fabRotateAnimation = Tween(begin: 180.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.easeOut, parent: _fabAnimationRotationController));

    _fabSizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 80.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 20.0),
    ]).animate(_fabAnimationRotationController);

    reactionDisposer.add(
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
      }),
    );

    reactionDisposer.add(
      reaction((_) => _homeStore.isBackgroundBlack, (_) {
        if (_homeStore.isBackgroundBlack) {
          _backgroundAnimationController.forward();
        } else {
          _backgroundAnimationController.reverse();
        }
      }),
    );

    reactionDisposer.add(
      reaction((_) => _homeStore.isFabVisible, (_) {
        if (_homeStore.isFabVisible) {
          _fabAnimationRotationController.forward();
        } else {
          _fabAnimationRotationController.reverse();
        }
      }),
    );

    _fabAnimationRotationController.forward();
  }

  @override
  void dispose() {
    reactionDisposer.forEach((disposer) => disposer());

    super.dispose();
  }

  String _getSearchFabButtonText(String? filter) {
    if (filter != null && filter.trim().isNotEmpty) {
      return "Search: $filter";
    } else {
      return "Search";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          endDrawer: Drawer(
            child: DrawerMenuWidget(),
          ),
          body: Stack(
            children: [
              SafeArea(
                bottom: false,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      sliver: Observer(
                        builder: (_) => AppBarWidget(
                          title: _homeStore.page.description,
                          lottiePath: AppConstants.squirtleLottie,
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        switch (_homeStore.page) {
                          case HomePageType.POKEMON_GRID:
                            return PokemonGridPage();
                          case HomePageType.ITENS:
                            return ItemsPage();
                          default:
                            return PokemonGridPage();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Observer(builder: (_) {
                    if (_homeStore.isBackgroundBlack) {
                      return AnimatedBuilder(
                        animation: _fabAnimationRotationController,
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
                  HomePanelWidget(
                      panelController: _panelController,
                      homePageStore: _homeStore,
                      pokemonStore: _pokemonStore,
                      itemStore: _itemStore)
                ],
              ),
              Observer(builder: (_) {
                return AnimatedBuilder(
                  animation: _fabAnimationRotationController,
                  builder: (_, child) => Transform(
                    alignment: Alignment.bottomRight,
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(_fabRotateAnimation.value))
                      ..scale(_fabSizeAnimation.value),
                    child: child,
                  ),
                  child: AnimatedFloatActionButtonWidget(
                    homeStore: _homeStore,
                    openAnimationController: _fabAnimationOpenController,
                    buttons: [
                      if (_homeStore.page == HomePageType.POKEMON_GRID)
                        CircularFabTextButton(
                          text: _getSearchFabButtonText(_pokemonStore
                              .pokemonFilter.pokemonNameNumberFilter),
                          icon: SizedBox(
                            child: Icon(
                              Icons.search,
                              color:
                                  AppTheme.getColors(context).floatActionButton,
                            ),
                          ),
                          color: Theme.of(context).backgroundColor,
                          onClick: () {
                            _fabAnimationOpenController.reverse();
                            _homeStore.setPanelType(
                                PanelType.FILTER_POKEMON_NAME_NUMBER);
                            _homeStore.openFilter();
                            _homeStore.hideBackgroundBlack();
                          },
                        ),
                      if (_homeStore.page == HomePageType.ITENS)
                        CircularFabTextButton(
                          text: _getSearchFabButtonText(_itemStore.filter),
                          icon: SizedBox(
                            child: Icon(
                              Icons.search,
                              color:
                                  AppTheme.getColors(context).floatActionButton,
                            ),
                          ),
                          color: Theme.of(context).backgroundColor,
                          onClick: () {
                            _fabAnimationOpenController.reverse();
                            _homeStore.setPanelType(PanelType.FILTER_ITEMS);
                            _homeStore.openFilter();
                            _homeStore.hideBackgroundBlack();
                          },
                        ),
                      if (_homeStore.page == HomePageType.POKEMON_GRID)
                        CircularFabTextButton(
                          text: _pokemonStore.pokemonFilter.generationFilter ==
                                  null
                              ? "All Generations"
                              : Generation
                                  .values[_pokemonStore
                                      .pokemonFilter.generationFilter!.index]
                                  .description,
                          icon: CustomPaint(
                            size:
                                Size(20, (20 * 1.0040160642570282).toDouble()),
                            painter: PokeballLogoPainter(
                              color:
                                  AppTheme.getColors(context).floatActionButton,
                            ),
                          ),
                          color: Theme.of(context).backgroundColor,
                          onClick: () {
                            _fabAnimationOpenController.reverse();
                            _homeStore.setPanelType(
                                PanelType.FILTER_POKEMON_GENERATION);
                            _homeStore.openFilter();
                          },
                        ),
                      if (_homeStore.page == HomePageType.POKEMON_GRID)
                        CircularFabTextButton(
                          text: _pokemonStore.pokemonFilter.typeFilter == null
                              ? "All Types"
                              : _pokemonStore.pokemonFilter.typeFilter!,
                          icon: CustomPaint(
                            size:
                                Size(20, (20 * 1.0040160642570282).toDouble()),
                            painter: PokeballLogoPainter(
                              color:
                                  AppTheme.getColors(context).floatActionButton,
                            ),
                          ),
                          color: Theme.of(context).backgroundColor,
                          onClick: () {
                            _fabAnimationOpenController.reverse();
                            _homeStore
                                .setPanelType(PanelType.FILTER_POKEMON_TYPE);
                            _homeStore.openFilter();
                          },
                        ),
                      if (_homeStore.page == HomePageType.POKEMON_GRID)
                        CircularFabTextButton(
                          text: "Favorite Pokemons",
                          icon: Icon(
                            Icons.favorite,
                            color:
                                AppTheme.getColors(context).floatActionButton,
                          ),
                          color: Theme.of(context).backgroundColor,
                          onClick: () {
                            _fabAnimationOpenController.reverse();
                            _homeStore
                                .setPanelType(PanelType.FAVORITES_POKEMONS);
                            _homeStore.openFilter();
                          },
                        ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
