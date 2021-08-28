import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/pages/home/home_page.dart';
import 'package:pokedex/shared/stores/pokeapi_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokeApiStore>()) {
      getIt.registerSingleton<PokeApiStore>(PokeApiStore());
    }

    return MaterialApp(
      title: 'Pokedex',
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
