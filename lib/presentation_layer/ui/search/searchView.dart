import 'package:bookly/presentation_layer/ui/mayLikeBooks/mayLikeWidget.dart';
import 'package:bookly/presentation_layer/ui/search/searchViewModel.dart';
import 'package:bookly/presentation_layer/ui/search/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../DI/dI.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel searchViewModel = getIt<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewModel, SearchState>(
        bloc: searchViewModel,
        builder: (context, state) {
          switch (state) {
            case SearchLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case SearchErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage, style: TextStyle(color: Colors.white))),
                  ],
                );
              }
            case SearchSuccessState():
              {
                return SearchScreen(items: state.items,);
              }
          }
        });
  }
}
// if (state.items == null) {
// // return Center(
// child: Text(
// 'Search for a book',
// style: TextStyle(color: Colors.white, fontSize: 16),
// ),
// );
// }