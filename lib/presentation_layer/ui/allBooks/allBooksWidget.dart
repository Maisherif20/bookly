import 'package:flutter/material.dart';

class AllBooksWidget extends StatelessWidget {
  String bookImage;
  int index;
  AllBooksWidget({required this.bookImage, required this.index});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: index,
          itemBuilder: (context, index) {
            return Image.network(bookImage);
          }),
    );
  }
}
