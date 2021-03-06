import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'options_extra.dart';

/// [LogPrintInterceptor] is used to print logs during network requests.
/// It's better to add [LogPrintInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
class LogPrintInterceptor extends Interceptor {
  LogPrintInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.logPrint = print,
    this.showLog = kDebugMode,
  });

  /// Whether to print log [Options]
  bool showLog;

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogPrintInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  void Function(Object object) logPrint;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!showLog) return super.onRequest(options, handler);
    _printRequest(options);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (!showLog) return super.onError(err, handler);
    _printError(err);
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!showLog) return super.onResponse(response, handler);
    _printResponse(response);
    return super.onResponse(response, handler);
  }

  void _printRequest(RequestOptions options) {
    printV('*************** ???????????? ***************');
    printKV('????????????', options.uri);

    //????????????-????????????-????????????
    bool singleRequestShowLog = options.extra[singleRequestShowLogKey] ?? true;
    if (request && singleRequestShowLog) {
      printKV('????????????', options.method);
      if (options.method == "POST") {
        if (options.data is FormData) {
          printV("????????????:");
          printV(options.data);
        } else {
          printV("????????????:");
          prettyPrintJson(options.data);
        }
      } else {
        printV("????????????:");
        prettyPrintJson(options.queryParameters);
      }
    }

    //????????????-????????????-????????????
    bool singleRequestHeaderShowLog =
        options.extra[singleRequestHeaderShowLogKey] ?? true;
    if (requestHeader && singleRequestHeaderShowLog) {
      printV("????????????:");
      options.headers.forEach((key, v) {
        if (key == "Authorization") {
          printV(key.toString());
          prettyLongString(v.toString());
        } else {
          printKV("$key", "$v");
        }
      });
    }

    //????????????-????????????-????????????
    bool singleRequestBodyShowLog =
        options.extra[singleRequestBodyShowLogKey] ?? true;
    if (requestBody && singleRequestBodyShowLog) {
      printV("???????????? Body:");
      prettyPrintJson(options.data.toString());
    }
    printV("");
  }

  void _printError(DioError err) {
    //????????????-????????????-????????????
    bool singleErrorShowLog =
        err.requestOptions.extra[singleErrorShowLogKey] ?? true;
    if (error && singleErrorShowLog) {
      printV('*************** ???????????? ***************:');
      printKV("????????????", err.requestOptions.uri);
      printKV("????????????", err);
      if (err.response != null) {
        _printResponse(err.response!);
      }
      printV("");
    }
  }

  void _printResponse(Response response) {
    printV("*************** ???????????? ***************");
    printKV('????????????', response.requestOptions.uri);
    //????????????-????????????-?????????
    bool singleResponseHeaderShowLog =
        response.requestOptions.extra[singleResponseHeaderShowLogKey] ?? true;
    if (responseHeader && singleResponseHeaderShowLog) {
      printKV('???????????????', response.statusCode);
      if (response.isRedirect == true) {
        printKV('redirect', response.realUri);
      }
      var headers = response.headers.toString().replaceAll("\n", "\n ");
      printKV('????????????', headers);
    }

    //????????????-????????????-?????????
    bool singleResponseBodyShowLog =
        response.requestOptions.extra[singleResponseBodyShowLogKey] ?? true;
    if (responseBody && singleResponseBodyShowLog) {
      printV("????????????:");
      prettyPrintJson(response.data);
    }
    printV("");
  }

  void printV(Object value) {
    logPrint('$value');
  }

  void printKV(String key, Object? value) {
    logPrint('$key: $value');
  }

  JsonDecoder decoder = const JsonDecoder();
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  /// ??????Json???????????????
  void prettyPrintJson(dynamic jsonData) {
    try {
      var prettyString = encoder.convert(jsonData);
      prettyString.split('\n').forEach((element) => logPrint(element));
    } on FormatException catch (_) {
      logPrint(json);
    }
  }

  /// ?????????????????????????????????????????????????????????
  void prettyLongString(String str) {
    if (str.length > 150) {
      logPrint(str.substring(0, 150));
      prettyLongString(str.substring(150, str.length));
    } else {
      logPrint(str);
    }
  }
}
