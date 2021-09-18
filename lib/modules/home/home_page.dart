import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/modules/items/items_page.dart';
import 'package:pokedex/modules/pokemon_grid/pokemon_grid_page.dart';
import 'package:pokedex/modules/home/widgets/animated_float_action_button.dart';
import 'package:pokedex/modules/home/widgets/home_panel.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
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

  late AnimationController _fabAnimationController;
  late Animation<double> _fabRotateAnimation;
  late Animation<double> _fabSizeAnimation;

  late PokemonStore _pokemonStore;
  late HomePageStore _homeStore;
  late PanelController _panelController;

  late List<ReactionDisposer> reactionDisposer = [];

  @override
  void initState() {
    super.initState();

    _pokemonStore = GetIt.instance<PokemonStore>();
    _homeStore = HomePageStore();
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
          _fabAnimationController.forward();
        } else {
          _fabAnimationController.reverse();
        }
      }),
    );

    reactionDisposer.add(
      reaction((_) => _pokemonStore.pokemonFilter.pokemonNameNumberFilter, (_) {
        if (_pokemonStore.pokemonFilter.pokemonNameNumberFilter == null) {
          BotToast.showText(text: "The search by name/number has been cleared");
        }
      }),
    );

    _fabAnimationController.forward();
  }

  @override
  void dispose() {
    reactionDisposer.forEach((disposer) => disposer());

    super.dispose();
  }

  double getHomePadding(Size size) {
    double horizontalPadding = 0;

    if (size.width > 1200) {
      horizontalPadding = size.width * 0.15;
    } else {
      horizontalPadding = 10;
    }

    return horizontalPadding;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      endDrawer: Drawer(
        child: DrawerMenuWidget(homeStore: _homeStore),
      ),
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getHomePadding(size),
                  ),
                  sliver: Observer(
                    builder: (_) => AppBarWidget(
                      title: _homeStore.page.description,
                      showAnimatedPokeball: true,
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
              HomePanelWidget(
                panelController: _panelController,
                homePageStore: _homeStore,
                pokemonStore: _pokemonStore,
              )
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
