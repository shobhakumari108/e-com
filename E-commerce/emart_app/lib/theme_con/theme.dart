import 'package:flutter/material.dart';

class AppThemeData extends ChangeNotifier {
  //
  // Dark mode flag
  //
  bool darkMode = false;

  //
  // colors
  //
  Color colorGrey = const Color.fromARGB(255, 209, 210, 205);

  // Color colorPrimary = Color(0xff009688);
  Color colorPrimary = const Color(0xff191a1c);
  Color colorCompanion = const Color(0xffebeaee);
  Color colorCompanion2 = const Color(0xffb1d4e2);
  Color colorCompanion3 = const Color(0xff77bed6);
  Color colorCompanion4 = const Color(0xff3ea8ca);

  late Color colorBackground;
  late Color colorBackgroundGray;
  late Color colorDefaultText;
  late Color colorBackgroundDialog;
  late MaterialColor primarySwatch;
  List<Color> colorsGradient = [];
  Color colorDarkModeLight =
      Color.fromARGB(255, 0, 0, 0); // for dialog background in dark mode

  //
  late TextStyle text10white;
  late TextStyle text12bold;
  late TextStyle text12grey;
  late TextStyle text14;
  late TextStyle text14primary;
  late TextStyle text14blue;
  late TextStyle text14grey;
  late TextStyle text14bold;
  late TextStyle text14boldPimary;
  late TextStyle text14boldWhite;
  late TextStyle text14boldWhiteShadow;
  late TextStyle text16;
  late TextStyle text16bold;
  late TextStyle text16boldWhite;
  late TextStyle text16Primary;
  late TextStyle text16boldPrimary;
  late TextStyle text18boldPrimary;
  late TextStyle text18bold;
  late TextStyle text20;
  late TextStyle text20bold;
  late TextStyle text20boldPrimary;
  late TextStyle text20boldWhite;

  

  late TextStyle text20negative;
  late TextStyle text22primaryShadow;

  changeDarkMode() {
    darkMode = !darkMode;

    init();
    notifyListeners();
  }

  init() {
    if (darkMode) {
      colorBackground = _backgroundDarkColor;
      colorDefaultText = _backgroundColor;
      colorBackgroundGray = Colors.white.withOpacity(0.1);
      primarySwatch = black;
      colorBackgroundDialog = colorDarkModeLight;
      Color color2 = const Color.fromARGB(80, 80, 80, 80);
      colorsGradient = [color2, Colors.black];
    } else {
      Color color2 = Color.fromARGB(
          80, colorPrimary.red, colorPrimary.green, colorPrimary.blue);
      colorsGradient = [color2, colorPrimary];
      colorBackgroundDialog = _backgroundColor;
      colorBackgroundGray = Colors.black.withOpacity(0.01);
      colorBackground = _backgroundColor;
      colorDefaultText = _backgroundDarkColor;
      primarySwatch = white;
    }

    text10white = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );

    text12bold = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w800,
      fontSize: 12,
    );

    text12grey = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );

    text14 = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    text14primary = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    text14blue = const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    
    text14bold = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w800,
      fontSize: 14,
    );

    text14boldPimary = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w800,
      fontSize: 14,
    );

    text14grey = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    text14boldWhite = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 14,
    );

    text14boldWhiteShadow = const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 14,
        shadows: [
          Shadow(offset: Offset(1, 1), color: Colors.black, blurRadius: 1),
        ]);

    text16bold = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    );

    text16boldWhite = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    );

    text16 = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

    text16Primary = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

    text16boldPrimary = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    );

    text18boldPrimary = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w800,
      fontSize: 18,
    );

    text18bold = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w800,
      fontSize: 18,
    );

    text20bold = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w800,
      fontSize: 20,
    );

    text20boldPrimary = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w800,
      fontSize: 20,
    );

    text20 = TextStyle(
      color: colorDefaultText,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    );

    text20boldWhite = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 20,
    );

    text20negative = TextStyle(
      // text negative color
      color: colorBackground,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    );

    text22primaryShadow = TextStyle(
      color: colorPrimary,
      fontWeight: FontWeight.w800,
      fontSize: 22,
      // ignore: prefer_const_literals_to_create_immutables
      shadows: [
        const Shadow(
          offset: Offset(1, 1),
          color: Colors.black,
          blurRadius: 1,
        ),
      ],
    );
  }
}

//
// Colors
//
var _backgroundColor = Colors.white;
var _backgroundDarkColor = const Color(0xff191a1c);

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

const MaterialColor black = MaterialColor(
  0xFF000000,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(0xFF000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
