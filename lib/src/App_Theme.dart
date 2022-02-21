import 'package:flutter/material.dart';

class AppTheme {

  AppTheme._();

  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightOnPrimaryColor = Colors.black;
  static const Color _lightMutedOnPrimaryColor = Color(0xFF828282);
  static const Color _lightOnPrimaryArticleTitleColor = Color(0xFF333333);
  static const Color _lightPrimaryVariantColor = Color(0xFFF7F7F7);
  static const Color _lightSecondaryColor = Color(0xFF1A1A1A);
  static const Color _lightSecondaryVariantColor = Color.fromRGBO(187, 51, 55, 0.3);
  static const Color _lightOnSecondaryIconColor = Colors.white;
  static const Color lightShimmerGrey200Color = Color(0xFFEEEEEE);
  static const Color lightShimmerGrey100Color = Color(0xFFF5F5F5);

  static final ThemeData lightTheme = ThemeData(

    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryContainer: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      secondaryContainer: _lightSecondaryVariantColor,

    ),

    iconTheme: const IconThemeData(
      color: _lightOnSecondaryIconColor,
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,

    textTheme: _lightTextTheme,

    // inputDecorationTheme: _lightInputDecorationTheme,

  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightOnPrimaryScreenHeadingTextStyle,
    caption: _lightOnPrimaryCaptionTextStyle,
    headline6: _lightOnPrimaryArticleTitleTextStyle, //Article Title
    bodyText2: _lightOnPrimaryBodyTextStyle
  );

  static const TextStyle _lightOnPrimaryScreenHeadingTextStyle = TextStyle(
      fontSize: 20.0,
      color: _lightOnPrimaryColor,
      letterSpacing: 1,
      fontWeight: FontWeight.w500);
  static const TextStyle _lightOnPrimaryArticleTitleTextStyle = TextStyle(
      fontSize: 18.0,
      color: _lightOnPrimaryArticleTitleColor,
      letterSpacing: 0.1,
      fontWeight: FontWeight.bold);
  static const TextStyle _lightOnPrimaryCaptionTextStyle = TextStyle(
      fontSize: 12.0,
      color: _lightMutedOnPrimaryColor,
      fontWeight: FontWeight.normal);

  static const TextStyle _lightOnPrimaryBodyTextStyle = TextStyle(
      fontSize: 16.0,
      letterSpacing: 0.2,
      color: _lightSecondaryColor,
      fontWeight: FontWeight.w500);

}
