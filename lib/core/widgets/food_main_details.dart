import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/popular_products_model.dart';
import '../styling/app_colors.dart';
import '../styling/app_styles.dart';
import 'icon_text_row.dart';

class FoodMainDetails extends StatelessWidget {
  final ProductModel popularProduct;

  const FoodMainDetails(this.popularProduct,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(popularProduct.name!, style: AppStyles.titleStyle,),
        HeightSpace(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(
                  5, (index) => Icon(
                Icons.star,
                color: AppColors.primaryColor,
                size: 15.sp,
              )
              ),
            ),
            Text(popularProduct.stars!.toString(), style: AppStyles.subtitleStyle,),
            Text("1287 Comments", style: AppStyles.subtitleStyle,)
          ],
        ),
        HeightSpace(height: 10),
        IconTextRow()
      ],
    );
  }
}
