import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styling/app_colors.dart';

class SnackHelper {

  static void show(BuildContext context,{
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 2),
  }) {
    final context = Get.overlayContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor ?? AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(color: textColor ?? AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
