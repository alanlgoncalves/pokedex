import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get homePageTitle;

  TextStyle get pokemonItemName;
  TextStyle get pokemonItemType;

  TextStyle get pokemonDetailName;
  TextStyle get pokemonDetailNumber;
  TextStyle get pokemonDetailType;
  TextStyle get pokemonDetailKind;
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

  @override
  // TODO: implement pokemonDetailKind
  TextStyle get pokemonDetailKind => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xFFFFFFFF),
      );

  @override
  // TODO: implement pokemonDetailName
  TextStyle get pokemonDetailName => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Color(0xFFFFFFFF),
      );

  @override
  TextStyle get pokemonDetailNumber => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      );

  @override
  TextStyle get pokemonDetailType => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      );
}
