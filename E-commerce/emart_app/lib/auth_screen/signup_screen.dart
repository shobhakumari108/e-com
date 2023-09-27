import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widgets.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import '../consts/lists.dart';
import '../widgets_common/custom_textfield.dart';
import '../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidgets(),
          10.heightBox,
          "Signup to $appname"
              .text
              .fontFamily(AutofillHints.addressCity)
              .white
              .size(18)
              .make(),
          15.heightBox,
          Obx(()=>
             Column(
              children: [
                customTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                customTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
                customTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                customTextField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text
                          .fontFamily(AutofillHints.addressCity)
                          .make()),
                ),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                              fontFamily: AutofillHints.addressCity,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: termAndCond,
                            style: TextStyle(
                              fontFamily: AutofillHints.addressCity,
                              color: redColor,
                            )),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                              fontFamily: AutofillHints.addressCity,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontFamily: AutofillHints.addressCity,
                              color: redColor,
                            ))
                      ])),
                    )
                  ],
                ),
                5.heightBox,
               controller.isloading.value?const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
               ) :ourButtom(
                        color: isCheck == true ? redColor : lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: ()  async{
                          if(isCheck != false){
                            controller.isloading(true);
                            try {
                              await controller.signupMethod
                              (context:context, email:emailController.text, password:passwordController.text).then((value){
                                return controller.storeUserData(
                                  email: emailController.text, password: passwordController.text, name: nameController.text
                                );
                              }).then((value){
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(()=> Home());
                              });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              controller.isloading(false);
                            }
                          }
                        })
                    .box
                    .width(context.screenWidth)
                    .make(),
                10.heightBox,
                //wrapping into the gesture detector of velocity x
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text.color(redColor).make().onTap(() {
                      Get.back();
                    })
                  ],
                ),
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
