import 'package:bookly/presentation_layer/ui/book_Details/bookDetailsWidget.dart';
import 'package:bookly/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../book_Details/bookDetailsScreen.dart';

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
      child: InkWell(
        onTap: (){
          // BookDetailsWidget(
          //   bookImage: bookImage,
          //   bookTitle: bookTitle,
          //   bookRate: bookRate,
          //   bookPrice: bookPrice,
          //   bookAuthor: bookyear,
          //   bookyear: bookyear,)));
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BookDetailsScreen(bookImage: bookImage,
              bookTitle: bookTitle,
              bookRate: bookRate,
              bookPrice: bookPrice,
              bookAuthor: bookAuthor,
              bookYear: bookyear))
          ) ;},
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
                  child: Image.network(bookImage, fit: BoxFit.fill,)),
              // Container(
              //   width: 70.w,
              //   height: 115.h,
              //   decoration: BoxDecoration(
              //     // borderRadius: BorderRadius.circular(16),
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: Image.network(bookImage),
              //     ),
              //   ),
              // ),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      bookTitle,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,fontFamily: "GTSectraFine"),
                    ),
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
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "$bookPrice €",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                    
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        // Spacer(),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
