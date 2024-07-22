import 'dart:convert';
import 'package:dio/dio.dart';
import '../model/BooksModel/BookModelDto.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
@singleton
@injectable
class ApiManager{
  //api_key="AIzaSyBO9Hxt3xlvNlQmMVVKi78P1YH3ZSwXnis";
  final _baseUrl ="www.googleapis.com";
  // final Dio _dio;
  // ApiManager(this._dio);
  // Future<Response> getRequest({required String endPoint})
  // async{
  //   var response= await _dio.get("$_baseUrl$endPoint");
  //   return response;
  // }
  Future<BookModelDto>getNewestBooks()async{
    var uri=Uri.https(_baseUrl ,  "/books/v1/volumes",
    {
      "q":"programming",
      "Filtering":"free-ebooks",
      "orderBy":"newest",
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    BookModelDto bookModelDto = BookModelDto.fromJson(json);
    return bookModelDto;
  }
  Future<BookModelDto>getSimilarBooks()async{
    var uri=Uri.https(_baseUrl ,  "/books/v1/volumes",
        {
          "q":"programming",
          "Filtering":"free-ebooks",
          "orderBy":"relevance",
        });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    BookModelDto bookModelDto = BookModelDto.fromJson(json);
    return bookModelDto;
  }
  Future<BookModelDto>getAllBooks()async{
    var uri=Uri.https(_baseUrl ,  "/books/v1/volumes",
        {
          "q":"programming",
          "Filtering":"ebooks",
        });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    BookModelDto bookModelDto = BookModelDto.fromJson(json);
    return bookModelDto;
  }
  Future<BookModelDto>search(String query)async{
    var uri=Uri.https(_baseUrl ,  "/books/v1/volumes",
        {
          "q":query,
        });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    BookModelDto bookModelDto = BookModelDto.fromJson(json);
    return bookModelDto;
  }
}