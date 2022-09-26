import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/routes/router.dart' as router;
import 'package:pokedex/theme/dark/dark_theme.dart';
import 'package:pokedex/theme/light/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((instance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    WidgetsFlutterBinding.ensureInitialized();

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Pokédex by Alan Santos');
      setWindowMinSize(const Size(1366, 768));
    }

    runApp(MyApp(prefs));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp(this.prefs);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetItRegister.register();

    final botToastBuilder = BotToastInit();

    return ThemeProvider(
      initTheme:
          this.prefs.getBool("darkTheme") ?? false ? darkTheme : lightTheme,
      child: MaterialApp(
        title: 'Pokedex',
        builder: (context, child) {
          child = botToastBuilder(context, child);

          return child;
        },
        theme: lightTheme,
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        routes: router.Router.getRoutes(context),
        initialRoute: "/",
      ),
    );
  }
}
