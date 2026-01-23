import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styling/app_colors.dart';
class DotsIndecator extends StatelessWidget {
  const DotsIndecator({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (popularProducts){
      return DotsIndicator(
        dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
        position: _currentIndex.toDouble(),
        decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            size: Size.square(9.0),
            activeSize: Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
        ),
      );
    });
  }
}
