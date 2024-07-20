import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain_layer/useCase/getBooksUseCase.dart';
@injectable
class NewestBooksViewModel extends Cubit<NewestBooksState> {
  GetBooksUseCase getBooksUseCase;
  @factoryMethod

  NewestBooksViewModel({ required this.getBooksUseCase})
      : super(NewestBooksLoadingState());
  void newestBooks() async {
    emit(NewestBooksLoadingState());
    var newestBooks = await getBooksUseCase.invoke();
    try {
      newestBooks.fold((response) {
        emit(NewestBooksSuccessState(bookModel: response));
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
  BookModel bookModel;
  NewestBooksSuccessState({required this.bookModel});
}
class NewestBooksErrorState extends NewestBooksState {
  String errorMessage;
  NewestBooksErrorState({required this.errorMessage});
}