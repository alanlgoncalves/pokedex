import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/shared/utils/converters.dart';
import 'package:pokedex/theme/app_theme.dart';

import '../../home_page_store.dart';

class AnimatedFloatActionButtonWidget extends StatefulWidget {
  final HomePageStore homeStore;
  final AnimationController openAnimationController;
  final List<CircularFabTextButton> buttons;

  const AnimatedFloatActionButtonWidget({
    Key? key,
    required this.buttons,
    required this.homeStore,
    required this.openAnimationController,
  }) : super(key: key);

  @override
  _AnimatedFloatActionButtonWidgetState createState() =>
      _AnimatedFloatActionButtonWidgetState();
}

class _AnimatedFloatActionButtonWidgetState
    extends State<AnimatedFloatActionButtonWidget>
    with SingleTickerProviderStateMixin {
  late bool isOpen;
  late bool showFadeBackground;

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

    blackBackgroundOpacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(widget.openAnimationController);

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(widget.openAnimationController);

    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(widget.openAnimationController);

    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.6), weight: 35.0),
      TweenSequenceItem(tween: Tween(begin: 1.6, end: 1.0), weight: 65.0),
    ]).animate(widget.openAnimationController);

    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(CurvedAnimation(
        parent: widget.openAnimationController, curve: Curves.easeOut));

    widget.openAnimationController.addListener(() {
      isOpen = widget.openAnimationController.isCompleted;

      setState(() {});
    });
  }

  List<Widget> _buildButtons() {
    List<Widget> animatedFAB = [];

    var actualFABHeight = 30;

    for (var i = 0; i < widget.buttons.length; i++) {
      Animation<double> animation;

      if (i == 0) {
        animation = degOneTranslationAnimation;
      } else if (i == widget.buttons.length - 1) {
        animation = degThreeTranslationAnimation;
      } else {
        animation = degTwoTranslationAnimation;
      }

      final fab = Positioned(
        bottom: 30,
        right: 20,
        child: AnimatedBuilder(
          animation: widget.openAnimationController,
          builder: (context, child) => Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(270),
                animation.value * (actualFABHeight += 50)),
            child: Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(rotationAnimation.value))
                ..scale(animation.value),
              alignment: Alignment.center,
              child: child,
            ),
          ),
          child: CircularFabTextButton(
            isOpened: isOpen,
            icon: widget.buttons[i].icon,
            text: widget.buttons[i].text,
            color: widget.buttons[i].color,
            onClick: widget.buttons[i].onClick,
          ),
        ),
      );

      animatedFAB.add(fab);
    }

    return animatedFAB;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            ..._buildButtons(),
            Positioned(
              bottom: 30,
              right: 20,
              child: AnimatedBuilder(
                animation: widget.openAnimationController,
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
                    if (widget.openAnimationController.isCompleted) {
                      widget.openAnimationController.reverse();
                      widget.homeStore.hideBackgroundBlack();
                    } else {
                      widget.openAnimationController.forward();
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

class CircularFabTextButton extends StatelessWidget {
  final bool isOpened;
  final Color color;
  final String text;
  final Widget icon;
  final VoidCallback onClick;

  const CircularFabTextButton({
    Key? key,
    this.isOpened = false,
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
