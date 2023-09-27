import 'package:emart_app/consts/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 25,
      ),
      10.heightBox,
      title!.text
          .fontFamily(AutofillHints.addressCity)
          .color(darkFontGrey)
          .make(),
    ],
  ).box.rounded.white.size(width, height).make();
}
