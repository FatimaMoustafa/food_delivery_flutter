import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controllers/recommended_product_controller.dart';
import '../../../../core/styling/app_colors.dart';
import '../../../../core/styling/app_styles.dart';
import '../../../../core/widgets/icon_text_row.dart';
import '../../../../core/widgets/spacing_widget.dart';
class TextPopularFoodSection extends StatelessWidget {
  final int index;
  final RecommendedProductController recommendedProduct;
  const TextPopularFoodSection(this.index, this.recommendedProduct, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r)
            ),
            color: AppColors.whiteColor
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(recommendedProduct.recommendedProductList[index].name!, style: AppStyles.titleStyle, maxLines: 1,),
              HeightSpace(height: 5),
              Text(recommendedProduct.recommendedProductList[index].description, style: AppStyles.subtitleStyle, maxLines: 1,),
              HeightSpace(height: 5),
              IconTextRow()
            ],
          ),
        ),
      ),
    );
  }
}
