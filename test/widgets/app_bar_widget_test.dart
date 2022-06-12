import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/shared/ui/widgets/app_bar.dart';
import 'package:pokedex/theme/light/light_theme.dart';

void main() {
  testWidgets("Should render app bar without Lottie animation",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          theme: lightTheme,
          home: CustomScrollView(
            slivers: [
              AppBarWidget(title: "AppBar Title"),
            ],
          ),
        ),
      ),
    );

    expect(find.text("AppBar Title"), findsOneWidget);
    expect(find.byType(AnimatedPokeballWidget), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(Lottie), findsNothing);
  });

  testWidgets("Should render app bar with Lottie animation",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          theme: lightTheme,
          home: CustomScrollView(
            slivers: [
              AppBarWidget(
                title: "AppBar Title",
                lottiePath: "/assets",
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text("AppBar Title"), findsOneWidget);
    expect(find.byType(AnimatedPokeballWidget), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(Lottie), findsOneWidget);
  });
}
