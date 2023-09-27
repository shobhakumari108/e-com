import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/splash_screen/splash_screen.dart';
import 'package:emart_app/theme_con/theme.dart';
import 'package:emart_app/theme_screen_hunch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'consts/strings.dart';
//9 complete
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

AppThemeData theme = AppThemeData();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  theme.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppThemeData(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // we have using getX so we have to chenge this materialApp into getmaterialApp

    return ChangeNotifierProvider(
      create: (_) => AppThemeData(),
      child: Consumer<AppThemeData>(
        builder: (context, value, child) {
          var maintheme = ThemeData(
            fontFamily: 'VarelaRound',
            primarySwatch: theme.primarySwatch,
          );
          if (theme.darkMode) {
            maintheme = ThemeData(
              fontFamily: 'VarelaRound',
              brightness: Brightness.dark,
              unselectedWidgetColor: Colors.white,
              primarySwatch: theme.primarySwatch,
            );
          }
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: maintheme,
            title: appname,
            home: const SplashScreen(),
            // home: const ThemeScreen(),
          );
        },
      ),
    );
    // GetMaterialAp
    //   debugShowCheckedModeBanner: false,
    //   title: appname,
    //   theme:
    //   home: const SplashScreen(),
    // );
  }
}
