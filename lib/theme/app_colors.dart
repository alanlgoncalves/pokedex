import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
  Color pokemonItem(String type);

  Color get selectPokemonTabTitle;
  Color get pokemonTabTitle;
  Color get tabDivisor;
  Color get tabIndicator;
}

class AppColorsDefault extends AppColors {
  @override
  Color get background => Color(0xFFFFFFFF);

  Color pokemonItem(String type) {
    switch (type) {
      case 'Normal':
        return Color(0xFFA7A877);
      case 'Fire':
        return Color(0xFFFB6C6C);
      case 'Water':
        return Color(0xFF77BDFE);
      case 'Grass':
        return Color(0xFF48D0B0);
      case 'Electric':
        return Color(0xFFFFCE4B);
      case 'Ice':
        return Color(0xFF99D7D8);
      case 'Fighting':
        return Color(0xFFC03128);
      case 'Poison':
        return Color(0xFF9F419F);
      case 'Ground':
        return Color(0xFFE1C068);
      case 'Flying':
        return Color(0xFFA890F0);
      case 'Psychic':
        return Color(0xFFF95887);
      case 'Bug':
        return Color(0xFFA8B91F);
      case 'Rock':
        return Color(0xFFB8A038);
      case 'Ghost':
        return Color(0xFF705998);
      case 'Dark':
        return Color(0xFF6F5848);
      case 'Dragon':
        return Color(0xFF7138F8);
      case 'Steel':
        return Color(0xFFB8B8D0);
      case 'Fairy':
        return Color(0xFFA890F0);
      default:
        return Colors.grey;
    }
  }

  @override
  Color get pokemonTabTitle => Color(0xFF303943).withOpacity(0.4);

  @override
  Color get selectPokemonTabTitle => Color(0xFF303943);

  @override
  Color get tabDivisor => Color(0xFFE4E4E4);

  @override
  Color get tabIndicator => Color(0xFF6C79DB);
}
