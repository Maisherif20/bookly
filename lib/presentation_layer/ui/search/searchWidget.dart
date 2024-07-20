import 'package:bookly/presentation_layer/ui/search/searchViewBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../customWidget/customBookDetails.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,toolbarHeight: 30.h,leading:  Icon(Icons.keyboard_backspace,color: Colors.white,),),
      backgroundColor: Color.fromRGBO(16, 11, 32, 11),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.close,color: Colors.white,)),
            SizedBox(
              height: 15.h,
            ),
            SearchViewBody(),
            SizedBox(
              height: 15.h,
            ),
            Text(
              textAlign: TextAlign.start,
              "Search Result",
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,fontSize: 17.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: ListView.builder(itemCount: 8,itemBuilder: (context, index){
                return BookDetails(
                  bookImage: 'assets/images/Book 2 Hightligh.png',
                  bookTitle: 'Harry Potter and the Goblet of Fire',
                  bookRate: '4.7',
                  bookPrice: '1900',
                  bookyear: '2009', bookAuthor: 'J.K. Rowling',
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}
