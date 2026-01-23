import 'package:ecommerce_app_food_delivery/core/styling/app_colors.dart';
import 'package:ecommerce_app_food_delivery/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExtendableTextWidgetState();
}

class _ExtendableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;


  double textHeight = 150.h;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?
          Text(firstHalf, style: AppStyles.subtitleStyle,):
          Column(
            children: [
              hiddenText?
                Text("$firstHalf...", style: AppStyles.subtitleStyle,):
                Text(firstHalf + secondHalf, style: AppStyles.subtitleStyle,),
              InkWell(
                onTap: (){
                  setState(() {
                    hiddenText=!hiddenText;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      hiddenText ? "Show more" : "Show less",
                      style: AppStyles.subtitleStyle.copyWith(
                          color: AppColors.primaryColor
                      ),
                    ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              )
            ],
          )
    );
  }
}
