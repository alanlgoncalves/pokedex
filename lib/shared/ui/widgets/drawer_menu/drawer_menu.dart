import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/shared/ui/widgets/drawer_menu/widgets/drawer_menu_item.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class DrawerMenuWidget extends StatefulWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
    with TickerProviderStateMixin {
  final HomePageStore _homeStore = GetIt.instance<HomePageStore>();

  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  AppConstants.pokedexIcon,
                  width: 100,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedPokeballWidget(
                        color: AppTheme.colors.pokeballLogoBlack, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Pokedex", style: AppTheme.texts.homePageTitle),
                  ],
                ),
              ],
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 70),
              children: [
                DrawerMenuItemWidget(
                  color: AppTheme.colors.drawerPokedex,
                  text: "Pokedex",
                  onTap: () {
                    Navigator.pop(context);

                    _homeStore.setPage(HomePageType.POKEMON_GRID);
                  },
                ),
                DrawerMenuItemWidget(
                  color: AppTheme.colors.drawerItems,
                  text: "Items",
                  onTap: () {
                    Navigator.pop(context);

                    _homeStore.setPage(HomePageType.ITENS);
                  },
                ),
                DrawerMenuItemWidget(
                    color: AppTheme.colors.drawerMoves, text: "Moves"),
                DrawerMenuItemWidget(
                    color: AppTheme.colors.drawerAbilities, text: "Abilities"),
                DrawerMenuItemWidget(
                    color: AppTheme.colors.drawerTypeCharts,
                    text: "Type Charts"),
                DrawerMenuItemWidget(
                    color: AppTheme.colors.drawerLocations, text: "Locations"),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Lottie.asset(
            AppConstants.diglettLottie,
            height: 200.0,
          ),
        ),
      ],
    );
  }
}
