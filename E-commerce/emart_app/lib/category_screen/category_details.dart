import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: title!.text
            .fontFamily(AutofillHints.addressCity)
            .fontWeight(FontWeight.w700)
            .white
            .make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .fontFamily(AutofillHints.addressCity)
                        .color(darkFontGrey)
                        .size(12)
                        .makeCentered()
                        .box
                        .white
                        .roundedSM
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,

// item Container
            Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          "Laptop 4GB/64GB"
                              .text
                              .color(darkFontGrey)
                              .fontFamily(AutofillHints.addressCity)
                              .make(),
                          10.heightBox,
                          "\$600"
                              .text
                              .color(redColor)
                              .fontWeight(FontWeight.w700)
                              .fontFamily(AutofillHints.addressCity)
                              .make(),
                        ],
                      )
                          .box
                          .white
                          .roundedSM
                          .outerShadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .padding(const EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Get.to(() => ItemDetails(
                              title: 'Dummy title',
                            ));
                      });
                    })))
          ],
        ),
      ),
    ));
  }
}
