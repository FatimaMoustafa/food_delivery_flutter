import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app_food_delivery/features/home_page/widgets/bottomPart/popular_food_view.dart';
import 'package:ecommerce_app_food_delivery/features/home_page/widgets/topPart/food_view_widget.dart';
import 'package:ecommerce_app_food_delivery/features/home_page/widgets/topPart/home_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            children: [
             HomePageHeader(),
             HeightSpace(height: 20),
             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     FoodViewWidget(),
                     HeightSpace(height: 20),
                     PopularFoodView(),
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      )
    );
  }
}
