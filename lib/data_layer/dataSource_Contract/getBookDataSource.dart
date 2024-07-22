import 'package:bookly/data_layer/model/BooksModel/BookModelDto.dart';
import 'package:either_dart/either.dart';

abstract class GetBooksDataSource{
  Future<Either<BookModelDto, String>> getNewestBooks();
  Future<Either<BookModelDto, String>> getSimilarBooks();
  Future<Either<BookModelDto, String>> getAllBooks();
  Future<Either<BookModelDto, String>> search(String query);
}
