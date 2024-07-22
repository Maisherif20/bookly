import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../repository_Contract/HomeRepository/bookRepository.dart';

@injectable
class SearchUseCase{
  @factoryMethod
  BookRepository bookRepository;
  SearchUseCase({required this.bookRepository});
  Future<Either<BookModel , String>>invoke(String query){
    return bookRepository.search(query);
  }
}