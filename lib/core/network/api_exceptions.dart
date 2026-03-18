import 'package:dio/dio.dart';
import 'package:test2/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(errMessage: "Connection timeout");

      case DioExceptionType.sendTimeout:
        return ApiError(errMessage: "Request send timeout");

      case DioExceptionType.receiveTimeout:
        return ApiError(errMessage: "Receive timeout");

      case DioExceptionType.badCertificate:
        return ApiError(errMessage: "Bad SSL certificate");

      case DioExceptionType.cancel:
        return ApiError(errMessage: "Request was cancelled");

      case DioExceptionType.connectionError:
        return ApiError(errMessage: "No internet connection");

      case DioExceptionType.badResponse:
        print('Data is:${error.response!.data}');
        print('Code is:${error.response!.statusCode}');

        final data = error.response;
        if (error is Map<String, dynamic>) {
          return ApiError(
            errMessage: data!.data['message'],
            statusCode: data.statusCode,
          );
        } else {
          return ApiError(
            errMessage: 'Unexpected error occurred',
            statusCode: data!.statusCode,
          );
        }

      case DioExceptionType.unknown:
        return ApiError(errMessage: "Unexpected error occurred");
    }
  }
}
