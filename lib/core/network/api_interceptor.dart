import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'User-Agent': 'FlutterApp/1.0.0',
      'Accept': 'application/json',
    });
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('api_interceptor');
    // 공통 응답 처리 (예: 특정 데이터 구조를 변환)
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 오류 응답 처리 (예: 특정 에러 메시지 변환)
    return handler.next(err);
  }
}
