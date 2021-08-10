import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get homePageTitle;
  TextStyle get pokemonName;
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
  TextStyle get pokemonName => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      );
}
