import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
      fontFamily: "Gothic",
      scaffoldBackgroundColor: const Color(0xffEEEEEE),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        toolbarHeight: 80,
      ));
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Gothic",
    scaffoldBackgroundColor: const Color(0xff181818),
  );
  static ThemeData currentTheme = lightTheme;

  void switchTheme() {
    currentTheme = lightTheme == currentTheme ? darkTheme : lightTheme;
  }
}
