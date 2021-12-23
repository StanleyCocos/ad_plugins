import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'http_request.dart';


class HttpRequestError {

  /// @title handleError
  /// @description 异常错误回调(子类继承重写handleError)处理错误异常
  /// @param: errorCallback
  /// @param: error
  /// @return void
  /// @updateTime 2021/12/23 11:34 上午
  /// @author 10456
  void handleError(HttpRequestErrorCallback? errorCallback, DioError? error){

    String errorOutput = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.other:
          errorOutput = "網絡不順，請檢查網絡後再重新整理";
          break;
        case DioErrorType.cancel:
          errorOutput = "請求取消";
          break;
        case DioErrorType.connectTimeout:
          errorOutput = "連接服務器超時";
          break;
        case DioErrorType.sendTimeout:
          errorOutput = "請求服務器超時";
          break;
        case DioErrorType.receiveTimeout:
          errorOutput = "服務器響應超時";
          break;
        case DioErrorType.response:
          errorOutput = "請求錯誤: ${error.response!.statusMessage}";
          break;
      }
    } else {
      errorOutput = "未知錯誤";
    }
    if(kDebugMode){
      print(errorOutput);
    }
    errorCallback?.call(error, error?.response?.statusCode ?? 0);
  }
}