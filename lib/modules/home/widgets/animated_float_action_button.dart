import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:pokedex/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/shared/utils/converters.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../home_page_store.dart';

class AnimatedFloatActionButtonWidget extends StatefulWidget {
  final HomePageStore homeStore;
  final AnimationController backgroundAnimationController;

  const AnimatedFloatActionButtonWidget({
    Key? key,
    required this.homeStore,
    required this.backgroundAnimationController,
  }) : super(key: key);

  @override
  _AnimatedFloatActionButtonWidgetState createState() =>
      _AnimatedFloatActionButtonWidgetState();
}

class _AnimatedFloatActionButtonWidgetState
    extends State<AnimatedFloatActionButtonWidget>
    with SingleTickerProviderStateMixin {
  static final PokemonStore pokemonStore = GetIt.instance<PokemonStore>();

  late bool isOpen;
  late bool showFadeBackground;

  late AnimationController animationController;
  late Animation<double> blackBackgroundOpacityAnimation;
  late Animation<double> degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();

    isOpen = false;
    showFadeBackground = false;

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    blackBackgroundOpacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);

    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);

    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.6), weight: 35.0),
      TweenSequenceItem(tween: Tween(begin: 1.6, end: 1.0), weight: 65.0),
    ]).animate(animationController);

    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      isOpen = animationController.isCompleted;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 30,
              right: 20,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degOneTranslationAnimation.value * 80.0),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: child,
                  ),
                ),
                child: _CircularTextButton(
                  isOpened: isOpen,
                  text: "Search",
                  icon: SizedBox(
                    child: Icon(
                      Icons.search,
                      color: AppTheme.colors.floatActionButton,
                    ),
                  ),
                  color: Colors.white,
                  onClick: () {
                    animationController.reverse();
                    widget.homeStore
                        .setPanelType(PanelType.FILTER_POKEMON_NAME_NUMBER);
                    widget.homeStore.openFilter();
                    widget.homeStore.hideBackgroundBlack();
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degTwoTranslationAnimation.value * 130.0),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: child,
                  ),
                ),
                child: _CircularTextButton(
                  isOpened: isOpen,
                  text: pokemonStore.pokemonFilter.generationFilter == null
                      ? "All Generations"
                      : pokemonStore
                          .pokemonFilter.generationFilter!.description,
                  icon: CustomPaint(
                    size: Size(20, (20 * 1.0040160642570282).toDouble()),
                    painter: PokeballLogoPainter(
                      color: AppTheme.colors.floatActionButton,
                    ),
                  ),
                  color: Colors.white,
                  onClick: () {
                    animationController.reverse();
                    widget.homeStore
                        .setPanelType(PanelType.FILTER_POKEMON_GENERATION);
                    widget.homeStore.openFilter();
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degTwoTranslationAnimation.value * 180.0),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: child,
                  ),
                ),
                child: _CircularTextButton(
                  isOpened: isOpen,
                  text: pokemonStore.pokemonFilter.typeFilter == null
                      ? "All Types"
                      : pokemonStore.pokemonFilter.typeFilter!,
                  icon: CustomPaint(
                    size: Size(20, (20 * 1.0040160642570282).toDouble()),
                    painter: PokeballLogoPainter(
                      color: AppTheme.colors.floatActionButton,
                    ),
                  ),
                  color: Colors.white,
                  onClick: () {
                    animationController.reverse();
                    widget.homeStore
                        .setPanelType(PanelType.FILTER_POKEMON_TYPE);
                    widget.homeStore.openFilter();
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degThreeTranslationAnimation.value * 230),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degThreeTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: child,
                  ),
                ),
                child: _CircularTextButton(
                  isOpened: isOpen,
                  text: "Favorite Pokemons",
                  icon: Icon(
                    Icons.favorite,
                    color: AppTheme.colors.floatActionButton,
                  ),
                  color: Colors.white,
                  onClick: () {
                    animationController.reverse();
                    widget.homeStore.setPanelType(PanelType.FAVORITES_POKEMONS);
                    widget.homeStore.openFilter();
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: child,
                ),
                child: _CircularButton(
                  heigth: 60,
                  width: 60,
                  icon: isOpen
                      ? Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        )
                      : Image.asset(
                          AppConstants.fabIcon,
                          width: 20,
                          height: 20,
                        ),
                  color: AppTheme.colors.floatActionButton,
                  onClick: () {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                      widget.homeStore.hideBackgroundBlack();
                    } else {
                      animationController.forward();
                      widget.homeStore.showBackgroundBlack();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CircularButton extends StatelessWidget {
  final double heigth;
  final double width;
  final Color color;
  final Widget icon;
  final VoidCallback onClick;

  const _CircularButton({
    Key? key,
    required this.heigth,
    required this.width,
    required this.color,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: true,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 3.0,
              offset: Offset(-3.0, -3.0),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: icon,
        ),
      ),
    );
  }
}

class _CircularTextButton extends StatelessWidget {
  final bool isOpened;
  final Color color;
  final String text;
  final Widget icon;
  final VoidCallback onClick;

  const _CircularTextButton({
    Key? key,
    required this.isOpened,
    required this.color,
    required this.text,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: true,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(33)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Row(
              children: [
                if (isOpened)
                  Text(
                    text,
                  ),
                if (isOpened)
                  SizedBox(
                    width: 10,
                  ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: icon,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
