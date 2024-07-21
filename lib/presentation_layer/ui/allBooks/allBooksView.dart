import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../DI/dI.dart';
import '../customWidget/customBookDetails.dart';
import 'allBooksViewModel.dart';

class AllBooksView extends StatefulWidget {
  const AllBooksView({super.key});
  @override
  State<AllBooksView> createState() => _AllBooksViewState();
}

class _AllBooksViewState extends State<AllBooksView> {
  AllBooksViewModel allBooksViewModel = getIt<AllBooksViewModel>();
  @override
  void initState() {
    allBooksViewModel.AllBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksViewModel, AllBooksState>(
        bloc: allBooksViewModel,
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
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:  books?.length,
                      itemBuilder: (context, index) {
                        return Image.network(books?[index].volumeInfo?.imageLinks?.thumbnail ?? "No Image");
                      }),
                );
              }
          }
        });
  }
}