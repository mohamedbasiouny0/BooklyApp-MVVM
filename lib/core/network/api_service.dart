import 'package:dio/dio.dart';
import 'package:test2/core/network/api_exceptions.dart';
import 'package:test2/core/network/dio_client.dart';

class ApiService {
  final DioClient dioClient;

  ApiService({required this.dioClient});

  Future<dynamic> get({required String endPoint}) async {
    try {
      final Response response = await dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }
}
