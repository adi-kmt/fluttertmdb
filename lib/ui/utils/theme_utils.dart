import 'package:flutter/material.dart';

class ThemeUtils {
  ThemeUtils._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purpleAccent,
    scaffoldBackgroundColor: const Color(0xff211F26),
    iconTheme: const IconThemeData(
      color: Color(0xff211F26),
    ),
  );
}
