import 'package:dartz/dartz.dart';
import 'package:finalapp/features/home/data/models/test_model.dart';

abstract class HomeRepo {
  Future<Either<Error, List<TestModel>>> fetchFeaturedBooks();
  Future<Either<Error, List<TestModel>>> fetchNewestBooks();
  Future<Either<Error, List<TestModel>>> fetchSimilarBooks({required String cactegory});
}
