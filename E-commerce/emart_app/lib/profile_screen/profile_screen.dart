import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/auth_screen/login_screen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/profile_screen/components/details_cart.dart';
import 'package:emart_app/profile_screen/edit_profile_screen.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(ProfileController());
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirestorServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];
                  // var data = snapshot.data!.docs[0];
                  return SafeArea(
                      child: Column(
                    children: [
                      //edit profile button

                      Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            // color: whiteColor,
                            color: Colors.black,
                          )).onTap(() {
                        controller.nameController.text = data['name'];
                        // controller.passController.text = data["password"];
                        Get.to(() => EditProfileScreen(
                              data: data,
                            ));
                      }),
                      //user details section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(imgProfile2,
                                        width: 100, fit: BoxFit.cover)
                                    .box
                                    .roundedFull
                                    .clip(Clip.antiAlias)
                                    .make()
                                : Image.network(data['imageUrl'],
                                        width: 100, fit: BoxFit.cover)
                                    .box
                                    .roundedFull
                                    .clip(Clip.antiAlias)
                                    .make(),
                            10.widthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .fontFamily(AutofillHints.addressCity)
                                      .fontWeight(FontWeight.w600)
                                      // .white
                                      .black
                                      .make(),
                                  5.heightBox,
                                  "${data['email']}"
                                      .text
                                      // .white
                                      .black
                                      .make(),
                                ],
                              ),
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        // color: whiteColor,
                                        color: Colors.black)),
                                onPressed: () async {
                                  await Get.put(AuthController())
                                      .signoutMethod(context);
                                  Get.offAll(() => const LoginScreen());
                                },
                                child: "Log out"
                                    .text
                                    // .white
                                    .black
                                    .fontFamily(AutofillHints.addressCity)
                                    .fontWeight(FontWeight.w600)
                                    .make())
                          ],
                        ),
                      ),

                      20.heightBox,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                count: data['cart_count'],
                                title: "in your cart",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['wishlist_count'],
                                title: "in your wishlist",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['order_count'],
                                title: "your orders",
                                width: context.screenWidth / 3.4)
                          ],
                        ),
                      ),
                      // 40.heightBox,
                      //buttons section
                      ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: lightGrey,
                                );
                              },
                              itemCount: profileButtonsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Image.asset(
                                    profileButtonsIcon[index],
                                    width: 22,
                                  ),
                                  title: profileButtonsList[index]
                                      .text
                                      .color(darkFontGrey)
                                      .fontFamily(AutofillHints.addressCity)
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                );
                              })
                          .box
                          .white
                          .shadowSm
                          .margin(EdgeInsets.all(12))
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .rounded
                          .make()
                          .box
                          .color(redColor)
                          .make(),
                    ],
                  ));
                }
              })),
    );
  }
}
