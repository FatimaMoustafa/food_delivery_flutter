import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:ecommerce_app_food_delivery/controllers/recommended_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_styles.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/bottom_add_to_cart_button.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/food_icon_button_widget.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app_food_delivery/features/food_page/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/app_routes.dart';
import '../../core/utils/app_constants.dart';

class RecommendedFoodDetailsScreen extends StatelessWidget {
  final RecommendedProductController recommendedProduct;
  final int index;

  const RecommendedFoodDetailsScreen(this.recommendedProduct, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final product = recommendedProduct.recommendedProductList[index];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FoodIconButtonWidget(
                  onPress: (){
                    GoRouter.of(context).pop();
                  },
                  icon: Icons.clear
                ),
                // GestureDetector(
                //   onTap: ()=> GoRouter.of(context).pop(),
                //   child:
                // ),
                GetBuilder<PopularProductController>(
                    builder: (controller){
                      return Stack(
                        children: [
                          FoodIconButtonWidget(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1 ?
                          Positioned(
                            right: 0,
                            top: 0,
                            child: FoodIconButtonWidget(
                              onPress: (){
                                GoRouter.of(context).push(
                                    AppRoutes.cartScreen
                                );
                              },
                              icon: Icons.circle,
                              size: 20.sp,
                              iconColor: Colors.transparent,
                              buttonColor: AppColors.primaryColor,
                            ),
                          ) :
                          Container(),
                          Get.find<PopularProductController>().totalItems >= 1 ?
                          Positioned(
                              right: 4,
                              top: 2,
                              child: Text(
                                Get.find<PopularProductController>().totalItems.toString(),
                                style: AppStyles.white24w600Style.copyWith(fontSize: 12.sp),
                              )
                          ) :
                          Container()
                        ],
                      );
                    }
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(15.h),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r)
                  )
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                child: Center(child: Text(product.name!, style: AppStyles.titleStyle,)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 220.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img!}",

                // product.img!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ExpandableTextWidget(
                    text: product.description!
                  ),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodIconButtonWidget(
                        onPress: (){
                          controller.setQuantity(false, context);
                        },
                        iconSize: 24.sp,
                        icon: Icons.remove,
                        iconColor: AppColors.whiteColor,
                        buttonColor: AppColors.primaryColor,
                      ),
                      Text("\$ ${product.price} x ${controller.inCartItems}", style: AppStyles.titleStyle,),
                      FoodIconButtonWidget(
                        onPress: (){
                          controller.setQuantity(true, context);
                        },
                        iconSize: 24.sp,
                        icon: Icons.add,
                        iconColor: AppColors.whiteColor,
                        buttonColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                HeightSpace(height: 10),
                Container(
                  height: 120.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      color: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26.r),
                          topRight: Radius.circular(26.r)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: AppColors.whiteColor
                        ),
                        child: Icon(Icons.favorite, color: AppColors.primaryColor,),
                      ),
                      BottomAddToCartButton(product, controller: controller,)
                    ],
                  ),
                )
              ],
            );
          }
      )
    );
  }
}
