import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2/core/network/api_error.dart';
import 'package:test2/features/home/data/models/book_details_model/book_details_model.dart';
import 'package:test2/features/home/data/repos/book_details_repo/book_details_repo.dart';

part 'get_book_information_state.dart';

class GetBookInformationCubit extends Cubit<GetBookInformationState> {
  GetBookInformationCubit({required this.bookDetilasRepo})
    : super(GetBookInformationInitial());

  final BookDetailsRepo bookDetilasRepo;

  Future<void> getBookDetailsFunction({required int id}) async {
    emit(GetBookInformationLoading());
    try {
      final BookDetailsModel response = await bookDetilasRepo.getBookDetails(
        id: id,
      );
      emit(GetBookInformationSuccess(bookDetailsModel: response));
    } on ApiError catch (e) {
      emit(GetBookInformationFailure(errMessage: e.errMessage));
    }
  }
}
