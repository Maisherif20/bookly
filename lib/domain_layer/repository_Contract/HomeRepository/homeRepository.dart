import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepository{
  Future<Either<BookModel, String>> fetchNewestBooks();
  Future<Either<BookModel, String>> fetchFeatureBooks();
}