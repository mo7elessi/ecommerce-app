import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sizes {
  static const double widgetSidePadding = 16.0;
  static const double verticalPadding = 8.0;
  static const double horizontalPadding = 8.0;
  static const double title = 16.0;
  static const double subtitle = 14.0;
  static const double details = 12.0;
  static const double elevation = 0.0;
  static const double radius = 0.0;
  static const double borderWith = .3;
}

class MyColors {
  static const Color primaryColor = Color(0xFF00A2B7);
  static const Color scaffoldBackgroundColor = Color(0xFFF6F6F6);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color iconsColor = Color(0xFFC2C2C2);
  static const Color borderColor = Color(0xFFA9A9A9);
}

class Themes {
  static ThemeData theme = ThemeData(
    primaryColor: MyColors.primaryColor,
    scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
    backgroundColor: MyColors.backgroundColor,
    iconTheme: const IconThemeData(
      color: MyColors.iconsColor,
    ),
    appBarTheme: const AppBarTheme(
        elevation: Sizes.elevation,
        color: MyColors.primaryColor,
        backwardsCompatibility: false,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MyColors.primaryColor,
        )),
  );
}
