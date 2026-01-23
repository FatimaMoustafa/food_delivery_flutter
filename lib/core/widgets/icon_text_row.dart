import 'package:flutter/material.dart';

import '../styling/app_colors.dart';
import 'icon_and_text_widget.dart';
class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndTextWidget(
          icon: Icons.circle_sharp,
          iconColor: AppColors.iconColor1,
          text: "Normal",
        ),
        IconAndTextWidget(
          icon: Icons.location_on,
          iconColor: AppColors.primaryColor,
          text: "1.7Km",
        ),
        IconAndTextWidget(
          icon: Icons.access_time_rounded,
          iconColor: AppColors.iconColor2,
          text: "32min",
        ),
      ],
    );
  }
}
