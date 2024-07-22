import 'package:bookly/data_layer/dataSource_Contract/getBookDataSource.dart';
import 'package:bookly/domain_layer/repository_Contract/HomeRepository/bookRepository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../domain_layer/Entities/BookModel/BookModel.dart';
@Injectable(as: BookRepository)
class HomeRepositoryImpl extends  BookRepository{
  @factoryMethod
  GetBooksDataSource getBooksDataSource;
  HomeRepositoryImpl({required this.getBooksDataSource});

  @override
  Future<Either<BookModel, String>> fetchNewestBooks() async{
    var result = await getBooksDataSource.getNewestBooks();
    return result.fold((response) {
      return Left(response.toBookModel());
    }, (error) {
      print(error);
      return Right(error);
    });
  }

  @override
  Future<Either<BookModel, String>> fetchAllBooks() async{
    var result = await getBooksDataSource.getAllBooks();
    return result.fold((response) {
      return Left(response.toBookModel());
    }, (error) {
      print(error);
      return Right(error);
    });
  }

  @override
  Future<Either<BookModel, String>> fetchSimilarBooks() async{
    var result = await getBooksDataSource.getSimilarBooks();
    return result.fold((response) {
      return Left(response.toBookModel());
    }, (error) {
      print(error);
      return Right(error);
    });
  }

  @override
  Future<Either<BookModel, String>> search(String query) async{
    var result = await getBooksDataSource.search(query);
    return result.fold((response) {
      return Left(response.toBookModel());
    }, (error) {
      print(error);
      return Right(error);
    });
  }

  // @override
  // Future<Either<BookModel, String>> fetchNewestBooks() {
  //   // TODO: implement fetchNewestBooks
  //   throw UnimplementedError();
  // }


}