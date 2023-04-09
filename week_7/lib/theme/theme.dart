import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(16, 16, 57, 1),
      toggleableActiveColor: Color.fromRGBO(234, 184, 69, 1),
      appBarTheme: AppBarTheme(color: Color.fromRGBO(42, 45, 77, 0.85)),
      primaryColor: Color.fromRGBO(42, 45, 77, 0.85));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(229, 227, 236, 1.0),
      appBarTheme: AppBarTheme(color: Color.fromRGBO(158, 158, 239, 1.0)),
      primaryColor: Color.fromRGBO(158, 158, 239, 1.0));
}
