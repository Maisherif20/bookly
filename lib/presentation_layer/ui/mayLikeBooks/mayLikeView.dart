import 'package:bookly/presentation_layer/ui/book_Details/bookDetailsScreen.dart';
import 'package:bookly/presentation_layer/ui/mayLikeBooks/mayLikeViewModel.dart';
import 'package:bookly/presentation_layer/ui/mayLikeBooks/mayLikeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../DI/dI.dart';
import '../customWidget/customBookDetails.dart';

class MayLikeBooksView extends StatefulWidget {
  const MayLikeBooksView({super.key});
  @override
  State<MayLikeBooksView> createState() => _MayLikeBooksViewState();
}

class _MayLikeBooksViewState extends State<MayLikeBooksView> {
  MayLikeViewModel mayLikeViewModel = getIt<MayLikeViewModel>();
  @override
  void initState() {
    mayLikeViewModel.newestBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MayLikeViewModel, MayLikeState>(
        bloc: mayLikeViewModel,
        builder: (context, state) {
          switch (state) {
            case MayLikeBooksLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case MayLikeBooksErrorState ():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage, style: TextStyle(color: Colors.white),)),
                  ],
                );
              }
            case MayLikeBooksSuccessState():
              {
                //books.items?[index].volumeInfo?.ratingsCount.toString() ??
                var books = state.items;
                return Container(
                  height: 200.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "You can also like",
                        style: TextStyle(
                            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                        scrollDirection: Axis.horizontal
                        ,itemCount: books?.length,itemBuilder: (context,index){
                          return MayLikeWidget(bookImage: books?[index].volumeInfo?.imageLinks?.thumbnail?? "No Image",
                            volumeInfo: books?[index].volumeInfo);
                        }),
                      ),
                    ],
                  ),
                );
              }
          }
        });
  }
}