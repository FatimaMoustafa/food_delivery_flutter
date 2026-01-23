import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_assets.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_styles.dart';
import 'package:ecommerce_app_food_delivery/core/utils/app_constants.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/food_icon_button_widget.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/styling/app_colors.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40.h, left: 20.w,right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FoodIconButtonWidget(
                  onPress: (){
                    GoRouter.of(context).pop();
                  },
                  icon: Icons.arrow_back_ios,
                  iconColor: AppColors.whiteColor,
                  buttonColor: AppColors.primaryColor,
                  iconSize: 24.sp,
                  size: 35.sp,
                ),
                WidthSpace(width: 80),
                FoodIconButtonWidget(
                  // onPress: (){
                  //   GoRouter.of(context).pop();
                  // },
                  onPress: () {
                    while (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    }
                  },
                  icon: Icons.home_outlined,
                  iconColor: AppColors.whiteColor,
                  buttonColor: AppColors.primaryColor,
                  iconSize: 24.sp,
                  size: 35.sp,
                ),
                FoodIconButtonWidget(
                  icon: Icons.shopping_cart,
                  iconColor: AppColors.whiteColor,
                  buttonColor: AppColors.primaryColor,
                  iconSize: 24.sp,
                  size: 35.sp,
                ),
              ],
            ),
          ),
          Positioned(
            top: 75.h,
            left: 20.w,
            right: 20.w,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              // color: AppColors.primaryColor,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController){
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index){
                          return SizedBox(
                            width: double.maxFinite,
                            height: 100.h,
                            child: Row(
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 80.h,
                                  margin: EdgeInsets.only(bottom: 10.h, left: 5.w),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img.toString()
                                          )
                                      ),
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.white
                                  ),
                                ),
                                WidthSpace(width: 10),
                                Expanded(
                                    child: Container(
                                      height: 100.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(cartController.getItems[index].name!, style: AppStyles.titleStyle,),
                                          Text("Spicy", style: AppStyles.subtitleStyle,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("\$ ${cartController.getItems[index].price}", style: AppStyles.black18w600Style.copyWith(color: Colors.red),),
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12.r),
                                                    color: Colors.white
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: (){
                                                          // popularProducts.setQuantity(false, context);
                                                        },
                                                        child: Icon(Icons.remove, color: AppColors.signColor,)
                                                    ),
                                                    Text("0", style: AppStyles.titleStyle,),
                                                    GestureDetector(
                                                        onTap: (){
                                                          //popularProducts.setQuantity(true, context);
                                                        },
                                                        child: Icon(Icons.add, color: AppColors.signColor,)
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          );
                        }
                    );
                  }
                )
              ),
            )
          ),

        ],
      ),
    );
  }
}
