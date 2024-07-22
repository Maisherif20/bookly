import 'package:bookly/domain_layer/Entities/BookModel/VolumeInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain_layer/Entities/BookModel/Items.dart';
import '../book_Details/bookDetailsScreen.dart';
import '../customWidget/customBookDetails.dart';

class MayLikeWidget extends StatelessWidget {
  String bookImage;
  VolumeInfo? volumeInfo;
  MayLikeWidget({required this.bookImage, required this.volumeInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookDetailsScreen(
                    bookImage: bookImage ?? "No image",
                    bookTitle: volumeInfo?.title ?? "No title",
                    bookRate: "4.7",
                    bookPrice: "1900",
                    bookAuthor: volumeInfo?.authors.toString() ?? "No authors",
                    bookYear: volumeInfo?.publishedDate ?? "No publishedDate",
                  )));
        },
        child: Container(
          width: 100.w,
          height: 120.h,
          child: Image.network(
            bookImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
