import 'package:emart_app/auth_screen/signup_screen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widgets.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets_common/bg_widgets.dart';
import '../widgets_common/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidgets(),
          10.heightBox,
          "Login to $appname"
              .text
              .fontFamily(AutofillHints.addressCity)
              .white
              .size(18)
              .make(),
          15.heightBox,
          Obx(()=>
             Column(
              children: [
                customTextField(
                    hint: emailHint,
                    title: email,
                    isPass: false,
                    controller: controller.emailController),
                customTextField(
                    hint: passwordHint,
                    title: password,
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text
                          .fontFamily(AutofillHints.addressCity)
                          .make()),
                ),
                5.heightBox,
               controller.isloading.value?const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
               ): ourButtom(
                  color: redColor,
                  title: login,
                  textColor: whiteColor,
                  onPress: () async {
                    controller.isloading(true);
                    await controller.loginMethod(context: context).then((value) {
                      if (value != null) {
                        VxToast.show(context, msg: loggedin);
                        Get.offAll(() => const Home());
                      }else{
                        controller.isloading(false);
                      }
                    });
                    // Get.to(() => const Home());
                  },
                ).box.width(context.screenWidth).make(),
                5.heightBox,
                createNewAccount.text
                    .color(fontGrey)
                    .fontFamily(AutofillHints.addressCity)
                    .make(),
                5.heightBox,
                ourButtom(
                    color: lightgolden,
                    title: signup,
                    textColor: redColor,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    }).box.width(context.screenWidth).make(),
                10.heightBox,
                loginWith.text
                    .color(fontGrey)
                    .fontFamily(AutofillHints.addressCity)
                    .make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      socialIconList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 20,
                              child:
                                  Image.asset(socialIconList[index], width: 30),
                            ),
                          )),
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ),
          // 5.heightBox,
        ],
      )),
    ));
  }
}
