part of 'newest_books_cubit.dart';

sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksSuccess extends NewestBooksState {
  final List<TestModel> newestBooks;

  NewestBooksSuccess({required this.newestBooks});
}
final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksFailure({required this.errMessage});
}