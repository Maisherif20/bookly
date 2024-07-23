import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'package:bookly/presentation_layer/ui/search/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../DI/dI.dart';
import '../customWidget/customBookDetails.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _queryController;
  final SearchViewModel _searchViewModel = getIt<SearchViewModel>();

  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 11, 32, 11),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: _queryController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  hintText: "Search for books here",
                  hintStyle: const TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchViewModel.search(_queryController.text);
                    },
                    icon: const Opacity(
                      opacity: 0.8,
                      child: Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              const Text(
                "Search Result",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: BlocBuilder<SearchViewModel, SearchState>(
                  bloc: _searchViewModel,
                  builder: (context, state) {
                    if (state is SearchLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(6, 0, 79, 1),
                        ),
                      );
                    } else if (state is SearchSuccessState) {
                      return ListView.builder(
                        itemCount: state.items?.length,
                        itemBuilder: (context, index) {
                          final item = state.items?[index];
                          return BookDetails(
                            bookImage: item?.volumeInfo?.imageLinks?.thumbnail ?? "No image",
                            bookTitle: item?.volumeInfo?.title ?? "No title",
                            bookRate: '4.7',
                            bookPrice: '1900',
                            bookyear: item?.volumeInfo?.publishedDate ?? "No date",
                            bookAuthor: item?.volumeInfo?.authors?.join(", ") ?? "No author",
                          );
                        },
                      );
                    } else if (state is SearchErrorState) {
                      Fluttertoast.showToast(
                        msg: state.errorMessage,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20.0,
                      );
                      return const Center(
                        child: Text(
                          'Search for a book',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'No result for search yet',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(Icons.content_paste_search_rounded, size: 30,color: Colors.white,),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}