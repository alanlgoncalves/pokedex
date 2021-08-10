import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get homePageTitle;

  TextStyle get pokemonItemName;
  TextStyle get pokemonItemType;
}

class AppTextStylesDefault extends AppTextStyles {
  @override
  TextStyle get homePageTitle => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF303943),
      );

  @override
  TextStyle get pokemonItemName => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      );

  @override
  TextStyle get pokemonItemType => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 8,
        fontWeight: FontWeight.normal,
        color: Color(0xFFFFFFFF),
      );
}
