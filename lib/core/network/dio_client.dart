import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_interceptor.dart';
import 'logging_interceptor.dart';
import 'error_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  final Dio dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  DioClient._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://dev-medisound-api.dknote.net', // 실제 API URL로 변경
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
        ),
      ) {
    dio.interceptors.add(AuthInterceptor(_storage));
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(ErrorInterceptor());
  }
}
