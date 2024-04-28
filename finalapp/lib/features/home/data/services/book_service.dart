
import 'package:dio/dio.dart';
import 'package:finalapp/core/utils/constants.dart';

class BookService{
  final Dio dio;

  BookService({required this.dio});


  Future getBooks({required String endPoint})async{
    try {
  var response=await dio.get('$baseUrl$endPoint');
  var data=response.data;
  return data;
}catch (e) {
  // TODO
  return (e.toString());
}
  }
}