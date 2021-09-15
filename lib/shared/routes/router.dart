import 'package:flutter/material.dart';
import 'package:pokedex/modules/home/home_page.dart';
import 'package:pokedex/modules/items/items_page.dart';

abstract class Router {
  static String home = "/";
  static String items = "/items";

  static Map<String, WidgetBuilder> getRoutes(context) {
    return {
      home: (context) => HomePage(),
      items: (context) => ItemsPage(),
    };
  }
}
