import 'package:bookly/data_layer/dataSource_Contract/getBookDataSource.dart';
import 'package:bookly/domain_layer/repository_Contract/HomeRepository/homeRepository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../domain_layer/Entities/BookModel/BookModel.dart';
@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends  HomeRepository{
  @factoryMethod
  GetBooksDataSource getBooksDataSource;
  HomeRepositoryImpl({required this.getBooksDataSource});

  @override
  Future<Either<BookModel, String>> fetchFeatureBooks() async{
    var result = await getBooksDataSource.getNewestBooks();
    return result.fold((response) {
      return Left(response.toBookModel());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<BookModel, String>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }


}