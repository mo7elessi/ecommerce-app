import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MySizes {
  static const double widgetSideSpace = 16.0;
  static const double verticalSpace = 8.0;
  static const double horizontalSpace = 8.0;
  static const double title = 16.0;
  static const double subtitle = 14.0;
  static const double details = 12.0;
  static const double elevation = 0.0;
  static const double radius = 0.0;
  static const double textFieldRadius = 50.0;
  static const double borderWidth = .3;
  static const double buttonHeight = 55.0;
  static const double productImageHeight = 100.0;
  static const double productImageWidth = 100.0;
}

class MyColors {
  static const Color primaryColor = Colors.teal;
  static const Color scaffoldBackgroundColor = Color(0xFFFAF9F9);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color iconsColor = Color(0xFFC2C2C2);
  static const Color borderColor = Color(0xFFC0C0C0);
}

final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(MySizes.radius),
    borderSide: const BorderSide(
      width: MySizes.borderWidth,
      color: MyColors.borderColor,
    ));

class MyTheme {
  static ThemeData theme = ThemeData(
    primaryColor: MyColors.primaryColor,
    fontFamily: "Lato-Regular",
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
    backgroundColor: MyColors.backgroundColor,
    iconTheme: const IconThemeData(
      color: MyColors.iconsColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: MySizes.elevation,
      color: MyColors.primaryColor,
      backwardsCompatibility: false,
      centerTitle: false,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColors.primaryColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MyColors.backgroundColor,
      filled: true,
      prefixStyle: const TextStyle(color: MyColors.primaryColor),
      enabledBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
      hintStyle: const TextStyle(fontSize: 14.0),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(MySizes.radius),
        borderSide: const BorderSide(
          width: MySizes.borderWidth,
          color: MyColors.primaryColor,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: MyColors.primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedItemColor: MyColors.iconsColor,
    ),
  );
}
