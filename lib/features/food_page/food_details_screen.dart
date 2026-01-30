import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/food_icon_button_widget.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/food_main_details.dart';
import 'package:ecommerce_app_food_delivery/features/food_page/widgets/expandable_text_widget.dart';
import 'package:ecommerce_app_food_delivery/models/popular_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/app_routes.dart';
import '../../core/styling/app_styles.dart';
import '../../core/utils/app_constants.dart';
import '../../core/widgets/bottom_add_to_cart_button.dart';
import '../../core/widgets/spacing_widget.dart';

class FoodDetailsScreen extends StatelessWidget {
  final ProductModel popularProduct;
  const FoodDetailsScreen(this.popularProduct,{super.key});

  @override
  Widget build(BuildContext context) {
    final PopularProductController controller = Get.find<PopularProductController>();
    Get.find<PopularProductController>().initProduct(popularProduct, Get.find<CartController>());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${popularProduct.img!}"
                  ),
                ),
              ),
            ),
          ),
          // icons widgets
          Positioned(
            left: 15.w,
            right: 15.w,
            top: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FoodIconButtonWidget(
                  onPress: (){
                    GoRouter.of(context).pop();
                  },
                  icon: Icons.arrow_back_ios
                ),
                // GestureDetector(
                //   onTap:(){
                //     Navigator.of(context).maybePop();
                //     // Navigator.of(context, rootNavigator: true).pop();
                //     // context.go(AppRoutes.homePageScreen);
                //     // GoRouter.of(Get.context!).pop();
                //     // Get.to(()=>HomePageScreen());
                //   },
                //   child: FoodIconButtonWidget(icon: Icons.arrow_back_ios)
                // ),
                // IconButton(
                //   icon: const Icon(Icons.arrow_back),
                //   onPressed: () {
                //     print('BACK PRESSED');
                //     Navigator.of(context).maybePop();
                //   },
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
                          right: 3,
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
            )
          ),
          // introduction of food
          Positioned(
            left: 0.h,
            right: 0.h,
            bottom: 0.h,
            top: 250.h,
            child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.r),
                  topLeft: Radius.circular(24.r),
                ),
                color: AppColors.whiteColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodMainDetails(popularProduct),
                  HeightSpace(height: 15),
                  Text("Introduce", style: AppStyles.titleStyle,),
                  HeightSpace(height: 15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: popularProduct.description!
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProducts){
            return Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: (){
                              popularProducts.setQuantity(false, context);
                            },
                          child: Icon(Icons.remove, color: AppColors.signColor,)
                        ),
                        Text(popularProducts.inCartItems.toString(), style: AppStyles.titleStyle,),
                        GestureDetector(
                            onTap: (){
                              popularProducts.setQuantity(true, context);
                            },
                            child: Icon(Icons.add, color: AppColors.signColor,)
                        ),
                      ],
                    ),
                  ),
                  BottomAddToCartButton(popularProduct, controller: controller)
                ],
              ),
            );
          }
      )
    );
  }
}

