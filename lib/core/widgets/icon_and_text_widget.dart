import 'package:ecommerce_app_food_delivery/core/styling/app_styles.dart';
import 'package:ecommerce_app_food_delivery/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        Text(text, style: AppStyles.subtitleStyle,)
      ],
    );
  }
}
