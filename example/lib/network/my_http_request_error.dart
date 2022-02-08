import 'package:ad_network/ad_network.dart';

class MyHttpRequestError extends HttpRequestRearInterceptor {


  @override
  void onError(HttpRequestErrorCallback? errorCallback, DioError? error) {
    print("请求成功全局处理");
  }

  @override
  void onRequest(HttpRequestSuccessCallback? callBack, Map<String, dynamic>? response) {
    print("请求错误全局处理");
  }
}
