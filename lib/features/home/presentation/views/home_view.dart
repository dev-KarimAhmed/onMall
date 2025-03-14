import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/product_listview.dart';
import 'package:on_mall/core/functions/build_header.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/features/home/presentation/views/widgets/categories_list.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_carousel.dart';
import 'package:on_mall/features/home/presentation/views/widgets/custom_row_text_btn.dart';
import 'package:on_mall/features/home/presentation/views/widgets/home_view_header.dart';
import 'package:on_mall/features/home/presentation/views/widgets/horizontal_stores_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          buildHeader(context, [
            const HomeViewHeader(),
          ]),
          CustomContainerBody(
            // This is container the child wrapped with singleChildscrollview
            isKeyboardVisibleAgain: isKeyboardVisible,
            height: isKeyboardVisible
                ? MediaQuery.sizeOf(context).height * .30
                : MediaQuery.sizeOf(context).height * .68,
            child: Column(
              children: [
                const RSizedBox(height: 10),
                const AutoCarouselSlider(),
                const RSizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Card(
                    child: Row(
                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: CircularProgressIndicator(
                            color: getColors(context).primaryColor,
                            value: 2 / 4,
                            year2023: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const RSizedBox(height: 10),
                const CategoriesList(),
                // This is
                const RSizedBox(height: 10),
                CustomTextRowBttn(
                  text: translateWord(context, Langkeys.subscribed),
                  onpressed: () {},
                ),
                const RSizedBox(height: 10),
                const HorizontalStoresList(),
                // This is a list of products
                const RSizedBox(height: 10),
                CustomTextRowBttn(
                  text: translateWord(context, Langkeys.popular),
                  onpressed: () {},
                ),
                const RSizedBox(height: 10),
                const ProductsListView()

                // const CustomProductCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
