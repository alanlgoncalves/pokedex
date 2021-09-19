import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/shared/ui/widgets/pokemon_type_badge.dart';
import 'package:pokedex/theme/app_theme.dart';

void main() {
  group(
      "When water pokemon type badge widget is rendered with show text option and without border",
      () {
    final waterPokemonTypeBadge = MaterialApp(
      home: Scaffold(
        body: PokemonTypeBadge(
          width: 20,
          height: 20,
          showText: true,
          type: 'Water',
          showBorder: true,
        ),
      ),
    );

    testWidgets("Should display the type text", (WidgetTester tester) async {
      await tester.pumpWidget(waterPokemonTypeBadge);

      final typeText = find.text("Water");
      expect(typeText, findsOneWidget);
    });

    testWidgets("Should display the type background color",
        (WidgetTester tester) async {
      await tester.pumpWidget(waterPokemonTypeBadge);

      final backgroundColorContainer = find.byWidgetPredicate((widget) {
        if (widget is Container && widget.decoration != null) {
          final decoration = (widget.decoration as BoxDecoration);
          return decoration.color == AppTheme.colors.pokemonItem("Water") &&
              decoration.borderRadius == BorderRadius.circular(50) &&
              decoration.border ==
                  Border.all(color: AppTheme.colors.pokemonTabTitle);
        }

        return false;
      });

      expect(backgroundColorContainer, findsOneWidget);
    });
  });

  group(
      "When water pokemon type badge widget is rendered without show text option and without border",
      () {
    final waterPokemonTypeBadge = MaterialApp(
      home: Scaffold(
        body: PokemonTypeBadge(
          width: 20,
          height: 20,
          showText: false,
          type: 'Water',
          showBorder: false,
        ),
      ),
    );

    testWidgets("Should display the type text", (WidgetTester tester) async {
      await tester.pumpWidget(waterPokemonTypeBadge);

      final typeText = find.text("Water");
      expect(typeText, findsNothing);
    });

    testWidgets("Should display the type background color",
        (WidgetTester tester) async {
      await tester.pumpWidget(waterPokemonTypeBadge);

      final backgroundColorContainer = find.byWidgetPredicate((widget) {
        if (widget is Container && widget.decoration != null) {
          final decoration = (widget.decoration as BoxDecoration);
          return decoration.color == AppTheme.colors.pokemonItem("Water") &&
              decoration.borderRadius == BorderRadius.circular(50) &&
              decoration.border == null;
        }

        return false;
      });

      expect(backgroundColorContainer, findsOneWidget);
    });
  });
}
