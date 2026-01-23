import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styling/app_colors.dart';
import '../../../../core/styling/app_styles.dart';
class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Egypt", style: AppStyles.titleStyle.copyWith(color: AppColors.primaryColor),),
            Row(
              children: [
                Text("Cairo", style: AppStyles.subtitleStyle,),
                Icon(Icons.arrow_drop_down_rounded,)
              ],
            )
          ],
        ),
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.primaryColor,
          ),
          child: Icon(Icons.search, color: AppColors.whiteColor,),
        )
      ],
    );
  }
}
