import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/test_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future fetchSimilarBooks({required String cactegory}) async {
    try {
      emit(SimilarBooksLoading());
  var result = await homeRepo.fetchSimilarBooks(cactegory: cactegory);
  result.fold(
      (failure) =>
          emit(FailedToGetSimilarBooks(errMessage: failure.toString())),
      (similarBooks) => emit(SimilarBooksLoaded(similarBooks: similarBooks)));
} on Exception catch (e) {
  // TODO
            emit(FailedToGetSimilarBooks(errMessage: e.toString()));

}
  }
}
