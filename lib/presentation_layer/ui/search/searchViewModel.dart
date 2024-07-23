import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'package:bookly/domain_layer/useCase/searchUseCase.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain_layer/useCase/getSimilarBooksUseCase.dart';
@injectable
class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase searchUseCase;
  @factoryMethod

  SearchViewModel({ required this.searchUseCase})
      : super(InitialState());
  void search(String query) async {
    emit(SearchLoadingState());
    var newestBooks = await searchUseCase.invoke(query);
    try {
      newestBooks.fold((response) {
        emit(SearchSuccessState(items: response.items));
      }, (error) {
        emit(SearchErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class SearchState {}

class InitialState extends SearchState {}
class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  List<Items>? items;
  SearchSuccessState({required this.items});
}
class SearchErrorState extends SearchState {
  String errorMessage;
  SearchErrorState({required this.errorMessage});
}