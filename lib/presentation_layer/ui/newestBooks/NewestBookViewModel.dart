import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain_layer/useCase/getBooksUseCase.dart';
@injectable
class NewestBookViewModel extends Cubit<NewestBooksState> {
  GetBooksUseCase getBooksUseCase;
  @factoryMethod

  NewestBookViewModel({ required this.getBooksUseCase})
      : super(NewestBooksLoadingState());
  void newestBooks() async {
    emit(NewestBooksLoadingState());
    var newestBooks = await getBooksUseCase.invoke();
    try {
      newestBooks.fold((response) {
        emit(NewestBooksSuccessState(items: response.items));
      }, (error) {
        emit(NewestBooksErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(NewestBooksErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksSuccessState extends NewestBooksState {
  List<Items>? items;
  NewestBooksSuccessState({required this.items});
}
class NewestBooksErrorState extends NewestBooksState {
  String errorMessage;
  NewestBooksErrorState({required this.errorMessage});
}