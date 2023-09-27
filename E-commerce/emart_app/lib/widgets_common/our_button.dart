import 'package:emart_app/consts/consts.dart';

Widget ourButtom({color, textColor, onPress, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: title!.text
          .fontFamily(AutofillHints.addressCity)
          .color(textColor)
          .make());
          
}
