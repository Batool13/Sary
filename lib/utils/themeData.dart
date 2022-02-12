import 'package:flutter/material.dart';

import 'dimens.dart';

class MyThemeData {
  static ThemeData myThemeData = ThemeData(
    hintColor: Colors.grey,
    scaffoldBackgroundColor: Colors.grey.shade100,
    // backgroundColor: Colors.blueGrey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Colors.purple,
        ),
      ),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: Dimens.borderRadius50all,
        borderSide: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    cardTheme: CardTheme(
      margin: Dimens.paddding10all,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: Dimens.borderRadius25all,
      ),
    ),
  );
}
