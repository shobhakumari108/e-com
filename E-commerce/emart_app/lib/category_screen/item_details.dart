import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/our_button.dart';

import '../consts/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: title!.text
            .color(darkFontGrey)
            .fontWeight(FontWeight.w700)
            .fontFamily(AutofillHints.addressCity)
            .make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //swiper section
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 300,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(imgFc5,
                            width: double.infinity, fit: BoxFit.cover);
                      }),
                  10.heightBox,
                  //title and details section
                  title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(AutofillHints.addressCity)
                      .fontWeight(FontWeight.w500)
                      .make(),
                  //rating
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (valu) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "\$30,000"
                      .text
                      .color(redColor)
                      .fontFamily(AutofillHints.addressCity)
                      .fontWeight(FontWeight.w700)
                      .size(18)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller"
                              .text
                              .white
                              .fontFamily(AutofillHints.addressCity)
                              .fontWeight(FontWeight.w600)
                              .make(),
                          5.heightBox,
                          "In House Brand"
                              .text
                              .fontFamily(AutofillHints.addressCity)
                              .fontWeight(FontWeight.w600)
                              .size(16)
                              .make(),
                        ],
                      )),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded, color: darkFontGrey),
                      ),
                    ],
                  )
                      .box
                      .height(60)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .color(textfieldGrey)
                      .make(),
                  20.heightBox,
                  //color section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .color(Vx.randomPrimaryColor)
                                    .roundedFull
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make()),
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child:
                                "Quantity: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              "0"
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(AutofillHints.addressCity)
                                  .fontWeight(FontWeight.w700)
                                  .make(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                              10.heightBox,
                              "(0 available)".text.color(textfieldGrey).make(),
                            ],
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //total row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(textfieldGrey).make(),
                          ),
                          "\$0.00"
                              .text
                              .color(redColor)
                              .size(16)
                              .fontFamily(AutofillHints.addressCity)
                              .fontWeight(FontWeight.w700)
                              .make(),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),

                  //description section
                  10.heightBox,
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(AutofillHints.addressCity)
                      .fontWeight(FontWeight.w600)
                      .make(),
                  10.heightBox,
                  "This is the dummy item and dummy description here.. "
                      .text
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  // buttom section
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        itemDetailButtonsList.length,
                        (index) => ListTile(
                              title: itemDetailButtonsList[index]
                                  .text
                                  .fontFamily(AutofillHints.addressCity)
                                  .fontWeight(FontWeight.w600)
                                  .make(),
                              trailing: const Icon(Icons.arrow_forward),
                            )),
                  ),

                  20.heightBox,
                  //product may like section

                  productsyoumaylike.text
                      .fontFamily(AutofillHints.addressCity)
                      .fontWeight(FontWeight.w700)
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
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
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .padding(const EdgeInsets.all(8))
                                    .make())),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButtom(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to cart",
              )),
        ],
      ),
    );
  }
}
