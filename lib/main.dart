import 'package:ecommerce_app_food_delivery/controllers/popular_product_controller.dart';
import 'package:ecommerce_app_food_delivery/controllers/recommended_product_controller.dart';
import 'package:ecommerce_app_food_delivery/core/routing/router_generation_config.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        color: AppColors.whiteColor,
        title: 'Food Delivery App',
        routerConfig: RouterGenerationConfig.goRouter,
      ),
    );
  }
}
