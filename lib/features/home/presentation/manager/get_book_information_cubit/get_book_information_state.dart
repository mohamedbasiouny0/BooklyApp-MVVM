part of 'get_book_information_cubit.dart';

sealed class GetBookInformationState extends Equatable {
  const GetBookInformationState();

  @override
  List<Object> get props => [];
}

final class GetBookInformationInitial extends GetBookInformationState {}

final class GetBookInformationLoading extends GetBookInformationState {}

final class GetBookInformationSuccess extends GetBookInformationState {
  final BookDetailsModel bookDetailsModel;
  const GetBookInformationSuccess({required this.bookDetailsModel});
}

final class GetBookInformationFailure extends GetBookInformationState {
  final String errMessage;
  const GetBookInformationFailure({required this.errMessage});
}
