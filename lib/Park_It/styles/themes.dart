import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('0xff0d2331'),
  appBarTheme:  AppBarTheme(
    titleSpacing:20.0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:HexColor('0xff0d2331'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('0xff0d2331'),
    elevation: 0.0,
  ),

  textTheme:  const TextTheme(
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: Colors.white
    ),
  ),
);



/*ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: Colors.black
    ),
  ),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing:20.0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
);*/