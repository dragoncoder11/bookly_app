import 'package:bloc/bloc.dart';
import 'package:finalapp/features/home/data/repos/home_repo.dart';

import '../../../data/models/test_model.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
final HomeRepo homeRepo;

  Future  fetchNewestBooks()async{
    try {
      emit(NewestBooksLoading());
  var result=await homeRepo.fetchNewestBooks();
  result.fold((failure) {
emit(NewestBooksFailure(errMessage: failure.toString()));
  }, (newestBooks) {
    emit(NewestBooksSuccess(newestBooks: newestBooks));
  });
}  catch (e) {
  // TODO
  return (e.toString());
}
    
  }
}

