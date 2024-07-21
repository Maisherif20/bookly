import 'package:bookly/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../allBooks/allBooksView.dart';
import '../newestBooks/NewestBookView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromRGBO(16, 11, 32, 1),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Image.asset("assets/images/Logo_1x.png"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context,RouteScreen.searchScreen);
                  },
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
                AllBooksView(),
                Text(
                  "Best Seller",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Expanded(
                //   child: ListView.builder(itemCount: 8,itemBuilder: (context, index){
                //     return BookDetails(
                //       bookImage: 'assets/images/Book 2 Hightligh.png',
                //       bookTitle: 'Harry Potter and the Goblet of Fire',
                //       bookRate: '4.7',
                //       bookPrice: '1900',
                //       bookyear: '2009', bookAuthor: 'J.K. Rowling',
                //     );
                //   }),
                // )
                Expanded(child: NewestBooksView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
