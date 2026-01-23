import 'package:ecommerce_app_food_delivery/core/widgets/food_main_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/popular_products_model.dart';
import '../styling/app_colors.dart';
class FoodItemInfo extends StatelessWidget {
  final ProductModel popularProduct;
  const FoodItemInfo(this.popularProduct, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 5.0,
                offset: Offset(0, 5)
            )
          ]
      ),
      child: Container(
        padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
        child: FoodMainDetails(popularProduct)
      ),
    );
  }
}
