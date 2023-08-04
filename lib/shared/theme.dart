// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class MainTheme {
  MainTheme._();

  static const Color _iconColor = Colors.black12;
  static const Color _lightPrimaryColor = Color(0xB3FFFFFF);
  static const Color _lightTextColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.black45;
  static const Color _darkTextColor = Colors.white;
  static const Color _primaryButtonColor = Color(0xFF43DAFB);

  static final ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: _lightPrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 24),
          color: _lightPrimaryColor,
          iconTheme: IconThemeData(color: _lightTextColor)),
      colorScheme: const ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _lightPrimaryColor,
          onPrimary: _lightTextColor),
      iconTheme: const IconThemeData(color: _iconColor),
      textTheme: _lightTextTheme,
      dividerTheme: const DividerThemeData(color: _iconColor));

  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: _darkPrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 24),
          color: _darkPrimaryColor,
          iconTheme: IconThemeData(color: _darkTextColor)),
      colorScheme: const ColorScheme.light(
          primary: _darkPrimaryColor,
          secondary: _darkPrimaryColor,
          onPrimary: _darkTextColor),
      iconTheme: const IconThemeData(color: _iconColor),
      textTheme: _darkTextTheme,
      dividerTheme: const DividerThemeData(color: _iconColor));

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightScreenHeading1TextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkScreenHeading1TextStyle,
  );

  static const TextStyle _lightScreenHeading1TextStyle = TextStyle(
      fontSize: 26.0, fontWeight: FontWeight.w700, color: _lightTextColor);

  static final TextStyle _darkScreenHeading1TextStyle =
      _lightScreenHeading1TextStyle.copyWith(color: _darkTextColor);
}
