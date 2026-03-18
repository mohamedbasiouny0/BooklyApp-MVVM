import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/network/api_error.dart';
import 'package:test2/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:test2/features/home/data/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.homeRepo}) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getFeaturedBooksFunction() async {
    emit(FeaturedBooksLoading());
    try {
      final List<HomeBookModel> books = await homeRepo.getFeaturedBooks();
      emit(FeaturedBooksSuccess(books: books));
    } on ApiError catch (e) {
      emit(FeaturedBooksFailure(ereMessage: e.errMessage));
    }
  }
}
