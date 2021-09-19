import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/shared/ui/widgets/drawer_menu/widgets/drawer_menu_item.dart';
import 'package:pokedex/shared/ui/widgets/pokeball.dart';
import 'package:pokedex/theme/app_theme.dart';

class ClickableMock extends Mock {
  onTap();
}

void main() {
  group("When the drawer menu is rendered without onTap event", () {
    final clickableMock = ClickableMock();

    final drawerMenuItemWidget = MaterialApp(
      home: Scaffold(
        body: DrawerMenuItemWidget(
          color: Colors.black,
          text: "Drawer Menu Item",
          onTap: () {
            clickableMock.onTap();
          },
        ),
      ),
    );

    testWidgets("Should display the color on the body",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final menuItemBody = find.byWidgetPredicate((widget) {
        if (widget is Container) {
          return (widget.decoration as BoxDecoration).color == Colors.black;
        }

        return false;
      });

      expect(menuItemBody, findsOneWidget);
    });

    testWidgets("Should display the menu item text",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final menuItemText = find.text("Drawer Menu Item");
      expect(menuItemText, findsOneWidget);
    });

    testWidgets("Should display the positioned pokeballs",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final positionedPokeballs = find.byWidgetPredicate((widget) {
        if (widget is Positioned && widget.child is PokeballWidget) {
          return (widget.child as PokeballWidget).size == 83 &&
              (widget.child as PokeballWidget).color ==
                  Colors.white.withOpacity(0.2);
        }

        return false;
      });

      expect(positionedPokeballs, findsNWidgets(2));
    });

    testWidgets("Should call onTap function when tap drawer menu item",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final menuItemClickable = find.byType(InkWell);
      await tester.tap(menuItemClickable);

      expect(menuItemClickable, findsOneWidget);
      verify(clickableMock.onTap()).called(1);
    });
  });

  group("When the drawer menu is rendered without onTap event", () {
    final drawerMenuItemWidget = MaterialApp(
      home: Scaffold(
        body:
            DrawerMenuItemWidget(color: Colors.black, text: "Drawer Menu Item"),
      ),
    );

    testWidgets("Should display disabled the color on the body",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final menuItemBody = find.byWidgetPredicate((widget) {
        if (widget is Container) {
          return (widget.decoration as BoxDecoration).color ==
              AppTheme.colors.drawerDisabled;
        }

        return false;
      });

      expect(menuItemBody, findsOneWidget);
    });

    testWidgets("Should display the menu item text",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final menuItemText = find.text("Drawer Menu Item");
      expect(menuItemText, findsOneWidget);
    });

    testWidgets("Should display the positioned pokeballs",
        (WidgetTester tester) async {
      await tester.pumpWidget(drawerMenuItemWidget);

      final positionedPokeballs = find.byWidgetPredicate((widget) {
        if (widget is Positioned && widget.child is PokeballWidget) {
          return (widget.child as PokeballWidget).size == 83 &&
              (widget.child as PokeballWidget).color ==
                  Colors.white.withOpacity(0.2);
        }

        return false;
      });

      expect(positionedPokeballs, findsNWidgets(2));
    });
  });
}
