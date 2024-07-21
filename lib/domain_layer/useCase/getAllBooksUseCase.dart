import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../repository_Contract/HomeRepository/bookRepository.dart';

@injectable
class GetAllBooksUseCase{
  @factoryMethod
  BookRepository bookRepository;
  GetAllBooksUseCase({required this.bookRepository});
  Future<Either<BookModel , String>>invoke(){
    return bookRepository.fetchAllBooks();
  }
}