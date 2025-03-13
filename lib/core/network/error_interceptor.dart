import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 에러 처리 로직 (예: 네트워크 오류 등)
    print("Dio Error: ${err.message}");
    super.onError(err, handler);
  }
}
