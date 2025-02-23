import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_mall/core/common/widgets/custom_container_body.dart';
import 'package:on_mall/core/common/widgets/custom_linear_button.dart';
import 'package:on_mall/core/functions/build_header.dart';
import 'package:on_mall/core/functions/get_text_style.dart';
import 'package:on_mall/core/functions/translate_word.dart';
import 'package:on_mall/core/language/lang_keys.dart';
import 'package:on_mall/features/store_details/presentation/manger/store_details_cubit.dart';
import 'package:on_mall/features/store_details/presentation/views/widgets/custom_toggle_button.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});

  // int value = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreDetailsCubit(),
      child: BlocConsumer<StoreDetailsCubit, StoreDetailsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          StoreDetailsCubit cubit = context.read<StoreDetailsCubit>();
          return Scaffold(
              body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildHeader(
                context,
                [],
                imgUrl:
                    "https://static.independent.co.uk/2022/05/14/16/newFile.jpg",
              ),
              CustomContainerBody(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: MediaQuery.sizeOf(context).height * .65,
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      "Store Name",
                      style: getLargeTextStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomLinearButton(
                          width: 165.w,
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(
                                  translateWord(context, Langkeys.sohag),
                                  style: getMediumTextStyle(context).copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                ),
                                Text("4.7"),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            const Row(
                              children: [
                                Icon(
                                  Icons.people_rounded,
                                ),
                                Text("120"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      elevation: 2,
                      child: CustomButtonToggle(
                        onChanged: (value) => cubit.changeValue(value),
                        value: cubit.currentValue,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    cubit.currentValue == 0
                        ? const Center(
                            child: Text("Brands"),
                          )
                        : cubit.currentValue == 1
                            ? const Center(
                                child: Text("Description"),
                              )
                            : const Center(
                                child: Text("Posts"),
                              ),
                  ],
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
