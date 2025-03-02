import 'package:flutter/material.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_carousel.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Product Name",
            style: getLargeTextStyle(context).copyWith(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  getColors(context).primaryColor!,
                  getColors(context).gradientColor!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .3,
                  width: MediaQuery.sizeOf(context).width,
                  child: const AutoCarouselSlider(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Product Name"),
                  Text(
                    translateWord(context, Langkeys.avilableForSale),
                    style: getSmallTextStyle(context).copyWith(
                      color: getColors(context).greenColor,
                    ),
                  )
                ],
              ),
              Text(
                "Lorem ipsum Product Discription" * 15,
                style: getMediumTextStyle(context),
              ),
               CustomRowProductDetails(
                text1:translateWord(context, Langkeys.discount),

                text2: "50%",
              ),
              const CustomProductDetailsDivider(),
               CustomRowProductDetails(
                text1: translateWord(context, Langkeys.priceBeforeDiscount),
                text2: "100",
              ),
              const CustomProductDetailsDivider(),
               CustomRowProductDetails(
                text1: translateWord(context, Langkeys.priceAfterDiscount),
                text2: "50",
              ),
              const CustomProductDetailsDivider(),
               CustomRowProductDetails(
                text1: translateWord(context, Langkeys.availabeColors),
                text2: "red, green , white",
              ),
              const CustomProductDetailsDivider(),
               CustomRowProductDetails(
                text1: translateWord(context, Langkeys.storeName),
                text2: "Shiaka",
              ),
              const CustomProductDetailsDivider(),
               CustomRowProductDetails(
                text1: translateWord(context, Langkeys.address),
                text2: "Sohag-Akhmim",
              ),
              CustomLinearButton(
                width: double.infinity,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      translateWord(context, Langkeys.openStoreLocation),
                      style: getLargeTextStyle(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRowProductDetails extends StatelessWidget {
  const CustomRowProductDetails({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: getMediumTextStyle(context),
          ),
          Text(
            text2,
            style: getSmallTextStyle(context),
          ),
        ],
      ),
    );
  }
}

class CustomProductDetailsDivider extends StatelessWidget {
  const CustomProductDetailsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      width: MediaQuery.sizeOf(context).width,
      color: getColors(context).greyColor,
    );
  }
}

List<String> images = [
  "https://img.freepik.com/free-photo/field-with-grass-clouds_1112-621.jpg?t=st=1740492217~exp=1740495817~hmac=64b20e96d540fb5eb09bf0947ec90fd8d0b16791413acb3dbf64bc2b704d0f35&w=1800",
  "https://img.freepik.com/free-photo/beautiful-closeup-shot-brown-fresh-black-coffee-beans_181624-37791.jpg?t=st=1740493347~exp=1740496947~hmac=bbfe2d154e5e2d759b02c030f81ccc6b4c1584f7e69b85271c1d794c479bd1ec&w=1800",
  "https://img.freepik.com/free-photo/beautiful-wooden-pathway-going-breathtaking-colorful-trees-forest_181624-5840.jpg?t=st=1740493333~exp=1740496933~hmac=03aa5890c0881a3b48823003a06efe33a48a5b7b39d971349ec1f3c9e537fbcf&w=1800"
];
