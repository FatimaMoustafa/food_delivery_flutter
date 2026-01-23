import 'package:ecommerce_app_food_delivery/controllers/recommended_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_styles.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app_food_delivery/features/home_page/widgets/bottomPart/text_popular_food_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_routes.dart';
import 'image_popular_food_section.dart';

class PopularFoodView extends StatefulWidget {
  const PopularFoodView({super.key});

  @override
  State<PopularFoodView> createState() => _PopularFoodViewState();
}

class _PopularFoodViewState extends State<PopularFoodView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 2.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Recommended", style: AppStyles.titleStyle,),
              WidthSpace(width: 5),
              Text(".", style: AppStyles.titleStyle,),
              WidthSpace(width: 10),
              Text("Food pairing", style: AppStyles.subtitleStyle,)
            ],
          ),
        ),
        HeightSpace(height: 10),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProduct){
              return recommendedProduct.isLoaded ?
              GestureDetector(

                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recommendedProduct.recommendedProductList.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(
                            AppRoutes.recommendedFoodDetailsScreen,
                            extra: [
                              recommendedProduct,
                              index
                            ]
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: Row(
                            children: [
                              // Image section
                              ImagePopularFoodSection(index, recommendedProduct),
                              // Text section
                              TextPopularFoodSection(index, recommendedProduct)
                            ],
                          ),
                        ),
                      );
                    }
                ),
              )
                  : CircularProgressIndicator(
                color: AppColors.primaryColor,
              );
            }
        )

      ],
    );
  }
}


