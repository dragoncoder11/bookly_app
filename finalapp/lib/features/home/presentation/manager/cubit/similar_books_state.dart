part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}
final class SimilarBooksLoaded extends SimilarBooksState {
    final List<TestModel> similarBooks;

  SimilarBooksLoaded({required this.similarBooks});

}
final class FailedToGetSimilarBooks extends SimilarBooksState {
   final String errMessage;

  FailedToGetSimilarBooks({required this.errMessage});
}

