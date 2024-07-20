import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../DI/dI.dart';
import '../customWidget/customBookDetails.dart';
import 'NewestBooksViewModel.dart';

class NewestBooksView extends StatefulWidget {
  const NewestBooksView({super.key});
  @override
  State<NewestBooksView> createState() => _NewestBooksViewState();
}

class _NewestBooksViewState extends State<NewestBooksView> {
  NewestBooksViewModel newestBooksViewModel = getIt<NewestBooksViewModel>();
  @override
  void initState() {
    newestBooksViewModel.newestBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksViewModel, NewestBooksState>(
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
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case NewestBooksSuccessState():
              {
                var books = state.bookModel;
                return ListView.builder(itemCount: 8,itemBuilder: (context, index){
                  return BookDetails(
                    bookImage: books.items?[index].volumeInfo?.imageLinks?.thumbnail?? "No image",
                    bookTitle: books.items?[index].volumeInfo?.title ?? "No title",
                    bookRate: books.items?[index].volumeInfo?.averageRating.toString() ?? "No averageRating",
                    bookPrice: books.items?[index].saleInfo?.listPrice?.amountInMicros.toString()??"No amountInMicros",
                    bookyear: books.items?[index].etag ?? "No etag",
                    bookAuthor:books.items?[index].volumeInfo?.authors?[index] ?? "No authors",
                  );
                });
              }
          }
        });
  }
}