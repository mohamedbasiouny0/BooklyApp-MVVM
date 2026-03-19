import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/network/api_error.dart';
import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';
import 'package:test2/features/search/data/repos/search_repo/search_repo.dart';
part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit({required this.searchRepo}) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchBooks({required String q}) async {
    emit(SearchBooksLoading());
    try {
      List<GeneralBookModel> generalBooksList = await searchRepo.getBooks(q: q);
      emit(SearchBooksSuccess(generalBooksList: generalBooksList));
    } on ApiError catch (e) {
      emit(SearchBooksFailure(errMessage: e.errMessage));
    }
  }
}
