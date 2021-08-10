import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 170.0,
      collapsedHeight: 70,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 17),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
        )
      ],
      backgroundColor: AppTheme.colors.background,
      flexibleSpace: Stack(children: [
        const FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: EdgeInsets.only(left: 26, bottom: 10),
          title: Text(
            "Pokedex",
            style: TextStyle(
              fontFamily: "CircularStd-Book",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303943),
            ),
          ),
        ),
      ]),
    );
  }
}
