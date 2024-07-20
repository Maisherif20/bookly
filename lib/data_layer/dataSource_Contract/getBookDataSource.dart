import 'package:bookly/data_layer/model/BooksModel/BookModelDto.dart';
import 'package:either_dart/either.dart';

abstract class GetBooksDataSource{
  Future<Either<BookModelDto, String>> getNewestBooks();
}
