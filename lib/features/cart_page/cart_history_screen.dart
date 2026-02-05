import 'dart:convert';

import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_styles.dart';
import 'package:ecommerce_app_food_delivery/core/utils/app_constants.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/food_icon_button_widget.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app_food_delivery/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/routing/app_routes.dart';

class CartHistoryScreen extends StatelessWidget {
  const CartHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final cartHistoryList = cartController.getCartHistoryList().reversed.toList();

    // Group cart items by order time
    final Map<String, List<CartModel>> orders = {};
    for (final item in cartHistoryList) {
      orders.putIfAbsent(item.time!, () => []);
      orders[item.time!]!.add(item);
    }
    final orderTimes = orders.keys.toList();

    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            height: 80.h,
            color: AppColors.primaryColor,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Cart History",
                  style: AppStyles.titleStyle.copyWith(color: AppColors.whiteColor),
                ),
                FoodIconButtonWidget(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.whiteColor,
                  buttonColor: Colors.transparent,
                ),
              ],
            ),
          ),

          // Cart orders
          Expanded(
            child: GetBuilder<CartController>(
              builder: (_) {
                if (cartHistoryList.isEmpty) {
                  return const Center(child: Text("No cart history yet"));
                }

                return Container(
                  margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: orderTimes.length,
                      itemBuilder: (context, i) {
                        final orderTime = orderTimes[i];
                        final orderItems = orders[orderTime]!;

                        // Format date safely
                        String outputDate;
                        try {
                          final parseDate =
                          DateFormat("yyyy-MM-dd HH:mm:ss").parse(orderTime);
                          outputDate =
                              DateFormat("MM/dd/yyyy hh:mm a").format(parseDate);
                        } catch (e) {
                          outputDate = orderTime; // fallback
                        }

                        return Container(
                          height: 120.h,
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                outputDate,
                                style: AppStyles.subtitleStyle
                                    .copyWith(color: AppColors.blackColor),
                              ),
                              HeightSpace(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Images of the order (max 3)
                                  Wrap(
                                    children: List.generate(
                                      orderItems.length.clamp(0, 3),
                                          (index) {
                                        final item = orderItems[index];
                                        return Container(
                                          height: 70.h,
                                          width: 70.w,
                                          margin: EdgeInsets.only(right: 6.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.r),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    item.img!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  // Total items + "one more" button
                                  Container(
                                    height: 80.h,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Total",
                                            style: AppStyles.black15w500Style),
                                        Text("${orderItems.length} items",
                                            style: AppStyles.black16w600Style),
                                        GestureDetector(
                                          onTap: () {
                                            final Map<int, CartModel> moreOrder = {};
                                            for (final item in orderItems) {
                                              moreOrder.putIfAbsent(
                                                item.id!,
                                                    () => CartModel.fromJson(
                                                  jsonDecode(
                                                      jsonEncode(item.tojson())),
                                                ),
                                              );
                                            }
                                            cartController.setItems = moreOrder;
                                            cartController.addToCartList();
                                            context.goNamed(AppRoutes.cartScreen);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 5.h),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.primaryColor),
                                            ),
                                            child: Text(
                                              "one more",
                                              style: AppStyles.subtitleStyle.copyWith(
                                                  color: AppColors.primaryColor),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
