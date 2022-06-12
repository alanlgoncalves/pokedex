import 'package:flutter/material.dart';

import '../app_theme.dart';

class AppColorsLight extends AppColors {
  const AppColorsLight();

  @override
  Color get pokemonTabTitle => Color(0xFF303943).withOpacity(0.4);

  @override
  Color get selectPokemonTabTitle => Color(0xFF303943);

  @override
  Color get selectedGenerationFilter => Color(0xFF666666).withOpacity(0.4);

  @override
  Color get pokeballLogoBlack => Color(0xFF303943);

  @override
  Color get pokeballLogoGray => Color(0xFF303943).withOpacity(0.1);

  @override
  Color get generationFilter => Color(0xFFFFFFFF);

  @override
  Color get panelBackground => Color(0xFFE9E9E9);

  @override
  Color get pokemonDetailsTitleColor => Color(0xFFFFFFFF);

  @override
  Color get appBarButtons => Color(0xFF000000);
}
