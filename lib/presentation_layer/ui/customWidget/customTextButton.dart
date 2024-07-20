import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  String text;
  Color textColor;
  BorderRadius borderRadius;
  Color backgroundColor;
  CustomTextButton({required this.backgroundColor,required this.text, required this.textColor, required this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:48.h ,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16)
            )
        )
        ,onPressed: () {},
        child:Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold
          ),
        ),),
    );
  }
}
