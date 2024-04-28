import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finalapp/features/home/data/models/book_model.dart';
import 'package:finalapp/features/home/data/models/test_model.dart';
import 'package:finalapp/features/home/data/repos/home_repo.dart';
import 'package:finalapp/features/home/data/services/book_service.dart';
import 'package:flutter/material.dart';

class HomeRepoImplement implements HomeRepo{
  BookService bookService=BookService(dio: Dio());
  @override
  Future<Either<Error, List<TestModel>>> fetchFeaturedBooks()async {
  try {
  var data = await bookService.getBooks(endPoint:'volumes?Filtering=free-ebooks&q=anime');
  List<TestModel>featuredBooks=[];
  for(var i in data["items"]){
 featuredBooks.add(TestModel.fromJson(i));
  }
  return right(featuredBooks);
}  catch (e) {
  // TODO
return left(e.toString() as Error);
}
  
  }

  @override
  Future<Either<Error, List<TestModel>>> fetchNewestBooks()async {
    try {
  var data = await bookService.getBooks(endPoint:'volumes?Filtering=free-ebooks&q=programming&Sorting=newest');
  List<TestModel>newestBooks=[];
  for(var i in data["items"]){
 newestBooks.add(TestModel.fromJson(i));
  }
  return right(newestBooks);
}  catch (e) {
  // TODO
return left(e.toString() as Error);
}
  }
  
  @override
  Future<Either<Error, List<TestModel>>> fetchSimilarBooks({required String cactegory})async {
    try {
  var data = await bookService.getBooks(endPoint:'volumes?Filtering=free-ebooks&q=$cactegory&Sorting=newest');
  List<TestModel>similarBooks=[];
  for(var i in data["items"]){
 similarBooks.add(TestModel.fromJson(i));
  }
  return right(similarBooks);
}  catch (e) {
  // TODO
return left(e.toString() as Error);
}
}
}