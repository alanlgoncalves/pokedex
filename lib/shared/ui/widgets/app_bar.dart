import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/theme/app_theme.dart';

class AppBarWidget extends StatefulWidget {
  final String title;
  final String? lottiePath;

  const AppBarWidget({Key? key, required this.title, this.lottiePath})
      : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 170.0,
      collapsedHeight: 70,
      elevation: 0,
      backgroundColor: AppTheme.colors.background,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        )
      ],
      flexibleSpace: Stack(children: [
        FlexibleSpaceBar(
          centerTitle: false,
          background: widget.lottiePath != null
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Lottie.asset(widget.lottiePath!, height: 140.0),
                )
              : Container(),
          titlePadding: EdgeInsets.only(left: 15, bottom: 10),
          title: Row(
            children: [
              AnimatedPokeballWidget(
                size: 24,
                color: AppTheme.colors.pokeballLogoBlack,
              ),
              SizedBox(
                width: 5,
              ),
              Text(widget.title, style: textTheme.headline1),
            ],
          ),
        ),
      ]),
    );
  }
}
