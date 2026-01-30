import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/routing/app_routes.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/features/home_page/widgets/topPart/food_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/dots_indecator_widget.dart';
import 'package:get/get.dart';

class FoodViewWidget extends StatefulWidget {
  const FoodViewWidget({super.key});

  @override
  State<FoodViewWidget> createState() => _FoodViewWidgetState();
}

class _FoodViewWidgetState extends State<FoodViewWidget> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return popularProducts.isLoaded?
            SizedBox(
            height: 250.h,
            child: GestureDetector(
              onTap: (){
                final product =
                popularProducts.popularProductList[_currentIndex];
                // Get.to(()=>FoodDetailsScreen());
                GoRouter.of(context).push(
                  AppRoutes.foodDetailsScreen,
                  extra: product
                );
              },
              child: CarouselSlider.builder(
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, index, position){
                  return FoodViewItem( index, popularProducts.popularProductList[index],);
                },
                options: CarouselOptions(
                    height: 240.h,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.25,
                    viewportFraction: 0.85,
                    autoPlay: false,
                    onPageChanged: (index, reason){
                      setState(() {
                        _currentIndex = index;
                      });
                    }
                ),
              ),
            ),
          )
            :CircularProgressIndicator(
            color: AppColors.primaryColor,
          );
        }),
        DotsIndecator(currentIndex: _currentIndex),


        // GetBuilder<PopularProductController>(builder: (popularProducts){
        //   return DotsIndecator(currentIndex: _currentIndex);
        // }),

      ],
    );
  }
}


