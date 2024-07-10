import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetails extends StatelessWidget {
  String bookImage;
  String bookTitle;
  String bookRate;
  String bookPrice;
  String bookyear;
  String bookAuthor;

  BookDetails(
      {required this.bookImage,
      required this.bookTitle,
      required this.bookRate,
      required this.bookPrice,
      required this.bookAuthor,
      required this.bookyear});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 115.h,
        width: 294.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 70.w,
              height: 115.h,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(bookImage),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  bookAuthor,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "$bookPrice €",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
