import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styling/app_colors.dart';

class FoodIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color? buttonColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;
  final VoidCallback? onPress;

  const FoodIconButtonWidget({
    super.key,
    required this.icon,
    this.buttonColor,
    this.iconColor,
    this.size,
    this.iconSize,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 35.h,
      width: size ?? 35.w,
      decoration: BoxDecoration(
          color: buttonColor ?? AppColors.buttonBackgroundColor,
          // border: Border.all(color: Color(0xffE8ECF4), width: 1),
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Center(
        child: IconButton(
          onPressed: onPress ?? (){},
          // onPressed: (){
          //   GoRouter.of(context).pop();
          // },
          icon: Icon(
            icon,
            color: iconColor ?? AppColors.iconColor3,
            size: iconSize ?? 20.sp,
          ),
        ),
      ),
    );
  }
}
