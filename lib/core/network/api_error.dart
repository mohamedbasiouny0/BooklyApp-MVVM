class ApiError {
  final String errMessage;
  final int? statusCode;

  ApiError({required this.errMessage, this.statusCode});
}
