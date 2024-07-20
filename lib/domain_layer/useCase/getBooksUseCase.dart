import 'package:bookly/domain_layer/Entities/BookModel/BookModel.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../repository_Contract/HomeRepository/homeRepository.dart';

@injectable
class GetBooksUseCase{
  @factoryMethod
  HomeRepository homeRepository;
  GetBooksUseCase({required this.homeRepository});
  Future<Either<BookModel , String>>invoke(){
    return homeRepository.fetchNewestBooks();
  }
}