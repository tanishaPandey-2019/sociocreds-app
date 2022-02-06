import 'package:flutter/material.dart';

const red = Color(0xFFFC257E);
const purple = Color(0xFFA41BE4);
const orange = Color(0xFFFC7B22);
const darkBlue = Color(0xFF4E1569);
const grey = Color(0xFFE7E7E7);

final radius4 = BorderRadius.circular(4);
final radius12 = BorderRadius.circular(12);

final pageTransition = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  },
);

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  accentColor: red,
  primaryColor: purple,
  primaryColorDark: purple,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  applyElevationOverlayColor: true,
  brightness: Brightness.light,
  pageTransitionsTheme: pageTransition,
);
