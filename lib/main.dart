import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/routes/router.dart' as router;
import 'package:pokedex/theme/light/light_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetItRegister.register();

    final botToastBuilder = BotToastInit();

    return ThemeProvider(
        initTheme: lightTheme,
        builder: (context, theme) {
          return MaterialApp(
            title: 'Pokedex',
            builder: (context, child) {
              child = botToastBuilder(context, child);

              return child;
            },
            theme: theme,
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            routes: router.Router.getRoutes(context),
            initialRoute: "/",
          );
        });
  }
}
