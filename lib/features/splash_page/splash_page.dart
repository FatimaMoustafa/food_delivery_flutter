import 'dart:async';

import 'package:ecommerce_app_food_delivery/controllers/cart_controller.dart';
import 'package:ecommerce_app_food_delivery/core/routing/app_routes.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_assets.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
    await Get.find<CartController>().getCartData();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear
    );

    Timer(
      const Duration(seconds: 3),
          () {
        context.push(AppRoutes.mainPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                AppAssets.logo1,
                width: 200.w,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              AppAssets.logo2,
              width: 200.w,
            ),
          ),
        ],
      ),
    );
  }
}
