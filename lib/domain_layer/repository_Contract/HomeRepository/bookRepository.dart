import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:either_dart/either.dart';

abstract class BookRepository{
  Future<Either<BookModel, String>> fetchNewestBooks();
  Future<Either<BookModel, String>> fetchSimilarBooks();
  Future<Either<BookModel, String>> fetchAllBooks();

}