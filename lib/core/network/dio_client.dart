import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.bigbookapi.com/'));
  Dio get dio => _dio;
}
