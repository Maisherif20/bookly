import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../DI/dI.dart';
import '../customWidget/customBookDetails.dart';
import 'NewestBookViewModel.dart';

class NewestBooksView extends StatefulWidget {
  const NewestBooksView({super.key});
  @override
  State<NewestBooksView> createState() => _NewestBooksViewState();
}

class _NewestBooksViewState extends State<NewestBooksView> {
  NewestBookViewModel newestBooksViewModel = getIt<NewestBookViewModel>();
  @override
  void initState() {
    newestBooksViewModel.newestBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookViewModel, NewestBooksState>(
        bloc: newestBooksViewModel,
        builder: (context, state) {
          switch (state) {
            case NewestBooksLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case NewestBooksErrorState ():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage, style: TextStyle(color: Colors.white),)),
                  ],
                );
              }
            case NewestBooksSuccessState():
              {
                //books.items?[index].volumeInfo?.ratingsCount.toString() ??
                var books = state.items;
                return ListView.builder(itemCount: books?.length,itemBuilder: (context, index){
                  return BookDetails(
                    bookImage: books?[index].volumeInfo?.imageLinks?.thumbnail?? "No image",
                    bookTitle: books?[index].volumeInfo?.title ?? "No title",
                    bookRate:  "4.7",
                    bookPrice: books?[index].saleInfo?.retailPrice?.amountInMicros.toString()??"1900",
                    bookyear: books?[index].volumeInfo?.publishedDate ?? "No publishedDate",
                    bookAuthor:books?[index].volumeInfo?.authors.toString() ?? "No authors",
                  );
                });
              }
          }
        });
  }
}