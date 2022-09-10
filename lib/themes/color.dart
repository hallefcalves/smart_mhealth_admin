import 'package:flutter/material.dart';

const primaryColor =  Color.fromARGB(255, 130, 197, 187);

const appBarColor = Color.fromARGB(255, 226, 231, 234);

const secondaryColor =  Color.fromARGB(255, 232, 225, 255);

const background = Color.fromARGB(255, 240, 240, 240);
const textColor =  Color.fromARGB(255, 0, 0, 0);

const facebookColor =  Color.fromRGBO(59, 89, 152, 1);

const infoDefault = Color.fromARGB(255, 0, 125, 215);
const infoHover = Color.fromARGB(255, 2, 104, 177);
const infoPressed = Color.fromARGB(255, 4, 97, 164);
const infoSurface = Color.fromARGB(255, 232, 244, 252);

const succesfulDefault = Color.fromARGB(255, 24, 159, 0);
const succesfulHover = Color.fromARGB(255, 22, 146, 0);
const succesfulPressed = Color.fromARGB(255, 24, 128, 6);
const succesfulSurface = Color.fromARGB(255, 213, 255, 205);

const noticeDefault = Color.fromARGB(255, 243, 156, 54);
const noticeHover = Color.fromARGB(255, 229, 151, 0);
const noticePressed = Color.fromARGB(255, 229, 124, 0);
const noticeSurface = Color.fromARGB(255, 253, 212, 133);

const errorDefault = Color.fromARGB(255, 211, 47, 47);
const errorHover = Color.fromARGB(255, 209, 6, 6);
const errorPressed = Color.fromARGB(255, 195, 6, 6);
const errorSurface = Color.fromARGB(255, 255, 208, 208);

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
      backgroundColor:background, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: facebookColor),
    );
  }
}