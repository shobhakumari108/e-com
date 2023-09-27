import 'package:emart_app/consts/consts.dart';
import '../consts/lists.dart';
import '../widgets_common/home_buttons.dart';
import 'components/featured_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: context.screenWidth,
      height: context.screenHeight,
      color: lightGrey,
      child: SafeArea(
          child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          color: lightGrey,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(Icons.search),
              filled: true,
              fillColor: whiteColor,
              hintText: searchanything,
              hintStyle: TextStyle(color: textfieldGrey),
            ),
          ),
        ),
        //swipers brands
        20.heightBox,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: slidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        slidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    }),

                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      2,
                      (index) => homeButtons(
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashsale)),
                ),
                //second swiper
                20.heightBox,
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: secondSlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondSlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    }),
                20.heightBox,
                //category buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      3,
                      (index) => homeButtons(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topCategories
                                : index == 1
                                    ? brand
                                    : topSellers,
                          )),
                ),

                //featured categories
                20.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: featuredCategories.text
                      .color(darkFontGrey)
                      .size(18)
                      .fontFamily(AutofillHints.addressCity)
                      .make(),
                ),
                20.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Column(
                        children: [
                          featuredButton(
                              icon: featuredImages1[index],
                              title: freaturedTitles1[index]),
                          10.heightBox,
                          featuredButton(
                              icon: featuredImages2[index],
                              title: freaturedTitles2[index]),
                        ],
                      ),
                    ).toList(),
                  ),
                ),

                //freatued product
                20.heightBox,

                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: redColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featuredProduct.text.white
                          .fontFamily(AutofillHints.addressCity)
                          .size(18)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            .fontFamily(
                                                AutofillHints.addressCity)
                                            .make(),
                                        10.heightBox,
                                        "\$600"
                                            .text
                                            .color(redColor)
                                            .fontWeight(FontWeight.w700)
                                            .fontFamily(
                                                AutofillHints.addressCity)
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

                //third swiper
                20.heightBox,
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: secondSlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondSlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    }),

                //all products section
                20.heightBox,
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
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
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .padding(const EdgeInsets.all(12))
                          .make();
                    })
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
