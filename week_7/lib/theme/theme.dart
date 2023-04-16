import 'package:flutter/material.dart';

class MyTheme {
  static final baseTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
  );

  static final myTextTheme = TextTheme(
    headline1: baseTextStyle.copyWith(fontSize: 32),
    headline2: baseTextStyle.copyWith(fontSize: 20),
    bodyText1: baseTextStyle.copyWith(fontSize: 16),
    bodyText2: baseTextStyle.copyWith(fontSize: 14),
  ).apply(
    fontFamily: baseTextStyle.fontFamily,
    bodyColor: baseTextStyle.color,
    displayColor: baseTextStyle.color,
  );
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(16, 16, 57, 1),
      toggleableActiveColor: Color.fromRGBO(234, 184, 69, 1),
      appBarTheme: AppBarTheme(color: Color.fromRGBO(42, 45, 77, 0.85)),
      primaryColor: Color.fromRGBO(42, 45, 77, 0.85),
      textTheme: myTextTheme);

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(229, 227, 236, 1.0),
      appBarTheme: AppBarTheme(color: Color.fromRGBO(158, 158, 239, 1.0)),
      primaryColor: Color.fromRGBO(158, 158, 239, 1.0),
      textTheme: myTextTheme);
}
