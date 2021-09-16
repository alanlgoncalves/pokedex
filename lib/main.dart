import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/routes/router.dart' as router;
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokemonStore>()) {
      getIt.registerSingleton<PokemonStore>(PokemonStore());
    }

    final botToastBuilder = BotToastInit();

    return MaterialApp(
      title: 'Pokedex',
      builder: (context, child) {
        child = botToastBuilder(context, child);

        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: router.Router.getRoutes(context),
      initialRoute: "/",
    );
  }
}
