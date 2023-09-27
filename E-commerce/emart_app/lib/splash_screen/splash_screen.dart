import 'package:emart_app/auth_screen/login_screen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//creatin a method to chenge screen
  chengeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  void initState() {
    chengeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 250,
              )),
          20.heightBox,
          applogoWidgets(),
          10.heightBox,
          appname.text
              .fontFamily(AutofillHints.addressCity)
              .size(22)
              .white
              .make(),
          5.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(AutofillHints.addressCity).make(),
          30.heightBox,
          //splash screen Ui is completed...
        ]),
      ),
    );
  }
}
