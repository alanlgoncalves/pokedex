import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/modules/pages/home/widgets/app_bar.dart';
import 'package:pokedex/shared/utils/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -(249 / 3),
            top: -38,
            child: Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                AppConstants.blackPokeballLogo,
                width: 249,
                height: 249,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: statusBarPadding,
              ),
              AppBarWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        ),
                        ListTile(
                          title: Text("Pokémon"),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
