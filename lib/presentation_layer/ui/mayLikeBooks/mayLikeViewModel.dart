import 'package:bookly/domain_layer/Entities/BookModel/Items.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain_layer/useCase/getSimilarBooksUseCase.dart';
@injectable
class MayLikeViewModel extends Cubit<MayLikeState> {
  GetSimilarBooksUseCase getSimilarBooksUseCase;
  @factoryMethod

  MayLikeViewModel({ required this.getSimilarBooksUseCase})
      : super(MayLikeBooksLoadingState());
  void newestBooks() async {
    emit(MayLikeBooksLoadingState());
    var newestBooks = await getSimilarBooksUseCase.invoke();
    try {
      newestBooks.fold((response) {
        emit(MayLikeBooksSuccessState(items: response.items));
      }, (error) {
        emit(MayLikeBooksErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(MayLikeBooksErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class MayLikeState {}

class MayLikeBooksLoadingState extends MayLikeState {}

class MayLikeBooksSuccessState extends MayLikeState {
  List<Items>? items;
  MayLikeBooksSuccessState({required this.items});
}
class MayLikeBooksErrorState extends MayLikeState {
  String errorMessage;
  MayLikeBooksErrorState({required this.errorMessage});
}