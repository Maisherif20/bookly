import 'package:bookly/presentation_layer/ui/mayLikeBooks/mayLikeView.dart';
import 'package:bookly/presentation_layer/ui/mayLikeBooks/mayLikeWidget.dart';
import 'package:bookly/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bookDetailsWidget.dart';

class BookDetailsScreen extends StatelessWidget {
  String bookImage;
  String bookTitle;
  String bookRate;
  String bookPrice;
  String bookYear;
  String bookAuthor;
  BookDetailsScreen(
      {required this.bookImage,
        required this.bookTitle,
        required this.bookRate,
        required this.bookPrice,
        required this.bookAuthor,
        required this.bookYear});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(16, 11, 32, 1),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 10.sp, top: 20.sp),
              child: Icon(Icons.close, size: 25.sp,),
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: 10.sp, top: 20.sp),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        body: Padding(
          padding:  EdgeInsets.only(left: 30.sp,right: 30.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BookDetailsWidget(
                bookImage: bookImage,
                bookTitle: bookTitle,
                bookRate: bookRate,
                bookPrice: bookPrice,
                bookAuthor: bookAuthor,
                bookyear: bookYear,),
              SizedBox(
                height: 70.h,
              ),
              MayLikeBooksView(),
            ]
          ),
        ),
      ),
    );
  }
}
