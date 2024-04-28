import 'package:bloc/bloc.dart';
import 'package:finalapp/features/home/data/models/test_model.dart';
import 'package:finalapp/features/home/data/repos/home_repo.dart';

import '../../../data/models/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  Future  fetchFeaturedBooks()async{
    try {
      emit(FeaturedBooksLoading());
  var result=await homeRepo.fetchFeaturedBooks();
  result.fold((failure) {
emit(FeaturedBooksFailure(errMessage: failure.toString()));
  }, (featuredBooks) {
    emit(FeaturedBooksSuccess(featuredBooks: featuredBooks));
  });
}  catch (e) {
  // TODO
  return (e.toString());
}
    
  }
}
