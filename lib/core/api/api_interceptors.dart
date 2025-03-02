import 'package:checkout_feature/core/api/end_pointes.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer ${ApiKey.secretKey}";
    options.contentType = Headers.formUrlEncodedContentType;

    super.onRequest(options, handler);
  }
}
