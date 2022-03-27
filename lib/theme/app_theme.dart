import 'package:flutter/material.dart';

const List<MaterialColor> appAccentColors = [
  Colors.blue,
  Colors.green,
  Colors.pink,
  Colors.red,
  Colors.purple,
  Colors.yellow,
  Colors.indigo,
  Colors.cyan,
  Colors.blueGrey,
  Colors.deepOrange,
  Colors.lightBlue,
  Colors.lime,
  Colors.teal,
];

ThemeData appTheme(
  BuildContext context, {
  Brightness brightness = Brightness.light,
  required MaterialColor primarySwatch,
}) {
  return ThemeData(
    primarySwatch: primarySwatch,
    brightness: brightness,
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    ),
  );
}
