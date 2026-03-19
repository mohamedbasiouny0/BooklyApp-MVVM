import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/network/api_error.dart';
import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';
import 'package:test2/features/home/data/repos/home_repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.homeRepo}) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getNewestBooksFunction() async {
    emit(NewestBooksLoading());
    try {
      List<GeneralBookModel> books = await homeRepo.getNewestBooks();
      emit(NewestBooksSuccess(books: books));
    } on ApiError catch (e) {
      emit(NewestBooksFailure(errMessage: e.errMessage));
    }
  }
}
