part of 'featured_books_cubit.dart';

 class FeaturedBooksState {}


final class FeaturedBooksInitial extends FeaturedBooksState {}
final class FeaturedBooksLoading extends FeaturedBooksState {}
final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<TestModel> featuredBooks;

  FeaturedBooksSuccess({required this.featuredBooks});
}
final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailure({required this.errMessage});
}
