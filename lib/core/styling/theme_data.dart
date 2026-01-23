import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';

class AppTheme{
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFont,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadlineStyle as TextStyle?,
      titleMedium: AppStyles.subtitleStyle as TextStyle?,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor
    )
  );
}

