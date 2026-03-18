import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/network/api_error.dart';
import 'package:test2/features/home/data/models/similar_book_model/similar_book_model.dart';
import 'package:test2/features/home/data/repos/book_details_repo/book_details_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.bookDetailsRepo})
    : super(SimilarBooksInitial());

  final BookDetailsRepo bookDetailsRepo;

  Future<void> getSimilarBooks({required int id}) async {
    emit(SimilarBooksLoading());
    try {
      var response = await bookDetailsRepo.getSimilarBooks(id: id);
      emit(SimilarBooksSuccess(similarBooksList: response));
    } on ApiError catch (e) {
      emit(SimilarBooksFailure(message: e.errMessage));
    }
  }
}
