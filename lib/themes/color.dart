import 'package:flutter/material.dart';

const primaryColor =  Color.fromARGB(255, 130, 197, 187);

const appBarColor = Color.fromARGB(255, 226, 231, 234);

const secondaryColor =  Color.fromARGB(255, 232, 225, 255);

const background = Color.fromARGB(255, 240, 240, 240);
const textColor =  Color.fromARGB(255, 0, 0, 0);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        color: appBarColor,
      ),
      primaryColor: primaryColor,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: background,
      cardColor: background,
      backgroundColor:background,
    );
  }
}