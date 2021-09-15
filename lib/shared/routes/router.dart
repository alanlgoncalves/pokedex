import 'package:flutter/material.dart';
import 'package:pokedex/modules/items/items_page.dart';
import 'package:pokedex/modules/pokemon_grid/pokemon_grid_page.dart';

abstract class Router {
  static String home = "/";
  static String items = "/items";

  static Map<String, WidgetBuilder> getRoutes(context) {
    return {
      home: (context) => PokemonGridPage(),
      items: (context) => ItemsPage(),
    };
  }
}
