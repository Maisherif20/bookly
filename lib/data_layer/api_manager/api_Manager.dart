import 'dart:convert';
import 'package:dio/dio.dart';
import '../model/BooksModel/BookModelDto.dart';
// import 'package:http/http.dart' as http
import 'package:injectable/injectable.dart';
@singleton
@injectable
class ApiManager{
  //api_key="AIzaSyBO9Hxt3xlvNlQmMVVKi78P1YH3ZSwXnis";
  final _baseUrl ="https://www.googleapis.com/books/v1/";
  final Dio _dio;
  ApiManager(this._dio);
  Future<Response> getRequest({required String endPoint})
  async{
    var response= await _dio.get("$_baseUrl$endPoint");
    return response;
  }
  // Future<BookModelDto>getPopularMovies()async{
  //   var uri=Uri.https(baseUrl , "/books/v1/volumes?Filtering=partial&q=action");
  //   var response = await http.get(uri);
  //   var json = jsonDecode(response.body);
  //   BookModelDto bookModelDto = BookModelDto.fromJson(json);
  //   return bookModelDto;
  // }
}