import 'package:flutter/material.dart';
import 'package:pokedex/theme/light/app_colors_light.dart';

import 'dark/app_colors_dark.dart';

abstract class AppColors {
  const AppColors();

  Color get panelBackground;
  Color get pokeballLogoBlack;
  Color get pokeballLogoGray;
  Color get pokemonDetailsTitleColor;
  Color get appBarButtons;

  Color get floatActionButton => Color(0xFF6C79DB);

  Color get selectPokemonTabTitle;
  Color get pokemonTabTitle;
  Color get tabDivisor => Color(0xFFE4E4E4);
  Color get tabIndicator => Color(0xFF6C79DB);

  Color get marsIcon => Color(0xFF919BE4);
  Color get venusIcon => Color(0xFFF38EB3);

  Color get unknownIcon => Color(0xFF303943);

  Color get generationFilter;
  Color get selectedGenerationFilter;

  Color get drawerAbilities => Color(0xFF59ABF6);
  Color get drawerItems => Color(0xFFFFCE4B);
  Color get drawerLocations => Color(0xFF7C538C);
  Color get drawerMoves => Color(0xFFFF8D82);
  Color get drawerPokedex => Color(0xFF50C1A6);
  Color get drawerTypeCharts => Color(0xFFB1736C);
  Color get drawerDisabled => Color(0xFF999999);

  Color baseStatsBar(double percentage) {
    if (percentage < 0.1666) {
      return Color(0xFFF34544);
    } else if (percentage < 0.3332) {
      return Color(0xFFFF7F0F);
    } else if (percentage < 0.4998) {
      return Color(0xFFFFDD57);
    } else if (percentage < 0.6664) {
      return Color(0xFFA1E515);
    } else if (percentage < 0.833) {
      return Color(0xFF22CD5E);
    } else {
      return Color(0xFF00C2B7);
    }
  }

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
}

class AppTheme {
  static AppColors get colors => const AppColorsLight();

  static AppColors getColors(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const AppColorsLight()
        : const AppColorsDark();
  }
}
