import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain_layer/useCase/getAllBooksUseCase.dart';
@injectable
class AllBooksViewModel extends Cubit<AllBooksState> {
  GetAllBooksUseCase getAllBooksUseCase;
  @factoryMethod

  AllBooksViewModel({ required this.getAllBooksUseCase})
      : super(NewestBooksLoadingState());
  void AllBooks() async {
    emit(NewestBooksLoadingState());
    var newestBooks = await getAllBooksUseCase.invoke();
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

sealed class AllBooksState {}

class NewestBooksLoadingState extends AllBooksState {}

class NewestBooksSuccessState extends AllBooksState {
  List<Items>? items;
  NewestBooksSuccessState({required this.items});
}
class NewestBooksErrorState extends AllBooksState {
  String errorMessage;
  NewestBooksErrorState({required this.errorMessage});
}