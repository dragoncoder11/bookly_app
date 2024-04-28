import 'dart:convert';

class TestModel {
  final String? image;
  final String? title;
  final String? publisher;
  final String? publishedDate;
  final String? description;
   final dynamic pageCount;
  final String? saleability;
    final String? link;

  final List<dynamic>? authors;
    final List<dynamic>? categories;

 // final dynamic? amount;
  TestModel(  
      {
 required this.link,
        required this.authors,
        required this.pageCount,
      required this.saleability,
     // required this.amount,
     required this.publisher,
      required this.publishedDate,
      required this.description,
      required this.title,
      required this.image,

      required this.categories});

  factory TestModel.fromJson(json) {
    return TestModel(
      image: json["volumeInfo"]["imageLinks"]["thumbnail"],
      title: json["volumeInfo"]['title'],
      publisher: json["volumeInfo"]["publisher"],
      publishedDate: json["volumeInfo"]["publishedDate"],
      description: json["volumeInfo"]["description"],
      pageCount: json["volumeInfo"]["pageCount"],
        saleability: json["saleInfo"]["saleability"], authors:json["volumeInfo"]['authors'], categories:json["volumeInfo"]['categories'], link: json['saleInfo']['buyLink'],
      //  amount: json["saleInfo"]["listPrice"]["amount"],
    );
  }
}
