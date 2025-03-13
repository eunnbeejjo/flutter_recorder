import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 요청 로깅
    print("Request URL: ${options.uri}");
    print("Request Method: ${options.method}");
    print("Request Headers: ${options.headers}");
    print("Request Data: ${options.data}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 응답 로깅
    print("Response Data: ${response.data}");
    print("Response Status Code: ${response.statusCode}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 에러 로깅
    print("Error: ${err.message}");
    super.onError(err, handler);
  }
}
