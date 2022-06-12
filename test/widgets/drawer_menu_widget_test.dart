import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/shared/ui/widgets/drawer_menu/drawer_menu.dart';
import 'package:pokedex/shared/ui/widgets/drawer_menu/widgets/drawer_menu_item.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/theme/light/light_theme.dart';

class HomePageStoreMock extends Mock implements HomePageStore {}

void main() {
  group("When the drawer menu is rendered", () {
    final homePageStoreMock = HomePageStoreMock();

    setUp(() {
      GetIt getIt = GetIt.instance;

      if (!GetIt.I.isRegistered<HomePageStore>()) {
        getIt.registerSingleton<HomePageStore>(homePageStoreMock);
      }
    });

    final drawerMenu = MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        body: DrawerMenuWidget(),
      ),
    );

    testWidgets("Should display animated pokeball logo",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenu);

      final animatedPokeball = find.byWidgetPredicate((widget) {
        if (widget is AnimatedPokeballWidget) {
          return widget.color == AppTheme.colors.pokeballLogoBlack &&
              widget.size == 24;
        }
        return false;
      });
      expect(animatedPokeball, findsOneWidget);
    });

    testWidgets("Should display Pokedex title", (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenu);

      final title = find.byWidgetPredicate((widget) {
        if (widget is Text) {
          return widget.data == "Pokedex" &&
              widget.style?.fontSize ==
                  lightTheme.textTheme.headline1?.fontSize &&
              widget.style?.fontFamily ==
                  lightTheme.textTheme.headline1?.fontFamily;
        }
        return false;
      });
      expect(title, findsOneWidget);
    });

    testWidgets("Should display 6 drawer menu items",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenu);

      final drawerMenuItems = find.byType(DrawerMenuItemWidget);
      expect(drawerMenuItems, findsNWidgets(6));
    });

    testWidgets("Should go to Pokemons page when tap Pokedex drawer menu item",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenu);

      final pokedexDrawerMenuItem = find.byWidgetPredicate((widget) {
        if (widget is DrawerMenuItemWidget) {
          return widget.text == "Pokedex";
        }
        return false;
      });

      expect(pokedexDrawerMenuItem, findsOneWidget);
      await tester.tap(pokedexDrawerMenuItem);
      verify(homePageStoreMock.setPage(HomePageType.POKEMON_GRID)).called(1);
    });

    testWidgets("Should go to items take when tap Items drawer menu item",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenu);

      final pokedexDrawerMenuItem = find.byWidgetPredicate((widget) {
        if (widget is DrawerMenuItemWidget) {
          return widget.text == "Items";
        }
        return false;
      });

      expect(pokedexDrawerMenuItem, findsOneWidget);
      await tester.tap(pokedexDrawerMenuItem);
      verify(homePageStoreMock.setPage(HomePageType.ITENS)).called(1);
    });
  });
}
