import 'package:bookly/data_layer/api_manager/api_Manager.dart';
import 'package:bookly/data_layer/dataSource_Contract/getBookDataSource.dart';
import 'package:bookly/data_layer/model/BooksModel/BookModelDto.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetBooksDataSource)
class GetBooksDataSourceImpl  extends GetBooksDataSource{
  @factoryMethod
  ApiManager apiManager;
  GetBooksDataSourceImpl({required this.apiManager});
  @override
  Future<Either<BookModelDto, String>> getNewestBooks() async{
      try {
        var response = await apiManager.getNewestBooks();
        if (response.statusMsg != null) {
          return Right(response.message!);
        } else {
          return Left(response);
        }
      } catch (e) {
        return Right(e.toString()); // error from server
      }
  }

  @override
  Future<Either<BookModelDto, String>> getSimilarBooks() async{
     try {
    var response = await apiManager.getSimilarBooks();
    if (response.statusMsg != null) {
    return Right(response.message!);
    } else {
    return Left(response);
    }
    } catch (e) {
    return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<BookModelDto, String>> getAllBooks() async{
    try {
      var response = await apiManager.getAllBooks();
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<BookModelDto, String>> search(String query) async{
    try {
      var response = await apiManager.search(query);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }
}