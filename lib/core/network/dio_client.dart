import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.bigbookapi.com/'),
  );
  static Dio get dio => _dio;
}
