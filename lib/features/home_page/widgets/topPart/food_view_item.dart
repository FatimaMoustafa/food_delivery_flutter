import 'package:ecommerce_app_food_delivery/core/utils/app_constants.dart';
import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styling/app_colors.dart';
import '../../../../core/widgets/food_item_info.dart';

class FoodViewItem extends StatelessWidget {

  final int index;
  final ProductModel popularProduct;

  const FoodViewItem(this.index, this.popularProduct, {
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          height: 180.h,
          // margin: EdgeInsets.only(left: 8.w, right: 8.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: AppColors.primaryColor,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${popularProduct.img!}"
                  ),
                  // image: AssetImage(AppAssets.foodImg1)
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FoodItemInfo(popularProduct),
        ),
      ],
    );
  }
}


