import 'package:bookly/presentation_layer/ui/customWidget/customTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsWidget extends StatelessWidget {
  String bookImage;
  String bookTitle;
  String bookRate;
  String bookPrice;
  String bookyear;
  String bookAuthor;
  BookDetailsWidget(
      {required this.bookImage,
        required this.bookTitle,
        required this.bookRate,
        required this.bookPrice,
        required this.bookAuthor,
        required this.bookyear});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(16, 11, 32, 1),
      child: Column(
        children: [
          Image.asset(bookImage, width: 300.w,height: 300.h,),
          Text(
            textAlign: TextAlign.center,
            bookTitle,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "GTSectraFine"),
          ),
          SizedBox(height: 5.h,),
          Text(
            textAlign: TextAlign.center,
            bookAuthor,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(bookRate,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              SizedBox(
                width: 10.w,
              ),
              Text("($bookyear)",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ],
          ),
          SizedBox(
            height: 20.w,
          ),
          Row(
            children: [
             Expanded(
               child: CustomTextButton(text: "1900 €", textColor: Colors.black, borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(12),
                 bottomLeft: Radius.circular(12)
               ), backgroundColor: Colors.white,),
             ),
              Expanded(
                child: CustomTextButton(text: "Free preview", textColor: Colors.white, borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                ), backgroundColor: Color.fromRGBO(239, 130, 98, 1),),
              )
            ],
          ),
        ],
      ),
    );
  }
}
