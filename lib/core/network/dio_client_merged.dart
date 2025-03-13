import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          print('request/.1/1/11/1/1');

          final accessToken = await _storage.read(key: 'access_token');
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          // 요청 전 로깅
          print("Request URL: ${options.uri}");
          print("Request Method: ${options.method}");
          print("Request Headers: ${options.headers}");
          print('Authorization Token: ${options.headers['Authorization']}');
          print("Request Data: ${options.data}");

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 응답 로깅
          print("Response Data: ${response.data}");
          print("Response Status Code: ${response.statusCode}");

          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // 에러 로깅
          print("Error: ${e.message}");

          return handler.next(e);
        },
      ),
    );
  }
}
