import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get homePageTitle;
}

class AppTextStylesDefault extends AppTextStyles {
  @override
  TextStyle get homePageTitle => TextStyle(
        fontFamily: "CircularStd-Book",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF303943),
      );
}
