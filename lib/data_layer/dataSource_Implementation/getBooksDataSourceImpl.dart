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
        var response = await apiManager.getRequest(endPoint: "volumes?Filtering=free-ebooks&q=programming&orderBy=newest");
        if (response.statusMessage != null) {
          return Right(response.statusMessage!);
        } else {
          return Left(BookModelDto.fromJson(response.data));
        }
      } catch (e) {
        return Right(e.toString()); // error from server
      }
  }
}