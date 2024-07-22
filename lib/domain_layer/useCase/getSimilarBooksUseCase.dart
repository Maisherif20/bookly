import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../repository_Contract/HomeRepository/bookRepository.dart';

@injectable
class GetSimilarBooksUseCase{
  @factoryMethod
  BookRepository bookRepository;
  GetSimilarBooksUseCase({required this.bookRepository});
  Future<Either<BookModel , String>>invoke(){
    return bookRepository.fetchSimilarBooks();
  }
}