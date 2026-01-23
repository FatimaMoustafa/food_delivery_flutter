import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';
import '../styling/app_styles.dart';
class BottomAddToCartButton extends StatelessWidget {
  final ProductModel popularProduct;
  final PopularProductController? controller;
  const BottomAddToCartButton(this.popularProduct,{
    super.key,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller?.addItem(context, popularProduct);
      },
      child: Container(
        width: 180.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.primaryColor
        ),
        child: Text(
          "\$ ${popularProduct.price} | Add to cart",
          style: AppStyles.titleStyle,
        ),
      ),
    );
  }
}
