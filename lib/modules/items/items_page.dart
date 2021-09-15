import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/widgets/app_bar.dart';
import 'package:pokedex/shared/ui/widgets/drawer_menu/drawer_menu.dart';
import 'package:pokedex/theme/app_theme.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  void initState() {
    super.initState();
  }

  double getItemsPagePadding(Size size) {
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
                    horizontal: getItemsPagePadding(size),
                  ),
                  sliver: AppBarWidget(
                    title: "Items",
                    showAnimatedPokeball: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
