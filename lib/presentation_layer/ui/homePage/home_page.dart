import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../customWidget/customBookDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(16, 11, 32, 1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset("assets/images/Logo_1x.png"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Image.asset("assets/images/Book 2 Hightligh.png");
                    }),
              ),
              Text(
                "Best Seller",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20.sp),
              ),
              BookDetails(
                bookImage: 'assets/images/Book 2 Hightligh.png',
                bookTitle: 'Monkey',
                bookRate: '4.7',
                bookPrice: '1900',
                bookyear: '2009', bookAuthor: 'J.K. Rowling',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
