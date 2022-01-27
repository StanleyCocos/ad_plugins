import 'package:ad_network/ad_network.dart';

class MyHttpRequestError extends HttpRequestError {

  void handleError(HttpRequestErrorCallback? errorCallback, DioError? error) {
    print("请求错误全局处理");
  }
}
