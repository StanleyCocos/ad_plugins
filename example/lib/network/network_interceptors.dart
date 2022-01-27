

import 'package:ad_network/ad_network.dart';

class MyInterceptors extends InterceptorsWrapper {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("开始请求");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("请求错误");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("请求响应");
    super.onResponse(response, handler);
  }

}