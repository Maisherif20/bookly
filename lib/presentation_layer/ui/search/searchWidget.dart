import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../customWidget/customBookDetails.dart';

class SearchScreen extends StatefulWidget {
  List<Items>? items;
  SearchScreen({required this.items});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController queryController;
  @override
  void initState() {
    queryController = TextEditingController();
    super.initState();
  }

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
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
            SizedBox(
              height: 15.h,
            ),
            TextField(
              controller: queryController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "Search for books here",
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Opacity(
                    opacity: 0.8,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              textAlign: TextAlign.start,
              "Search Result",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            widget.items == null
                ? Text(
                    'Search for a book',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return BookDetails(
                            bookImage: widget.items[index].volumeInfo?.imageLinks?.thumbnail ?? "No image",
                            bookTitle: widget.items[index].volumeInfo?.title ?? "No title",
                            bookRate: '4.7',
                            bookPrice: '1900',
                            bookyear: widget.items[index].volumeInfo?.publishedDate ?? "No date",
                            bookAuthor: widget.items[index].volumeInfo?.authors.toString() ?? "No author",
                          );
                        }),
                  )
          ],
        ),
      )),
    );
  }
}
