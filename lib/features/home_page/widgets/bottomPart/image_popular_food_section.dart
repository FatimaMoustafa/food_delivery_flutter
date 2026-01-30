import 'package:ecommerce_app_food_delivery/controllers/recommended_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styling/app_colors.dart';

class ImagePopularFoodSection extends StatelessWidget {
  final int index;
  final RecommendedProductController recommendedProduct;
  const ImagePopularFoodSection(this.index, this.recommendedProduct, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.primaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${recommendedProduct.recommendedProductList[index].img!}"
          )
        ),
      ),
    );
  }
}
