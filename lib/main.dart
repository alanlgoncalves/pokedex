import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/routes/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    registerOnGetIt();

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
