import 'package:flutter/foundation.dart';
import 'package:ad_extension/date_extension.dart';

const bool isDebug = !kReleaseMode;

stLog(Object message, {StackTrace? current}) {
  if (isDebug) {
    if (current != null) {
      HYCustomTrace programInfo = HYCustomTrace(current);
      print(
          "${programInfo.fileName} line ${programInfo.lineNumber} time ${DateTime.now().string(format: "HH:mm:ss")}: $message");
    } else {
      print("${DateTime.now().string(format: "HH:mm:ss")}: $message");
    }
  }
}

class HYCustomTrace {
  final StackTrace _trace;

  String? fileName;
  int? lineNumber;
  int? columnNumber;

  HYCustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = _trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    fileName = listOfInfos[0];
    lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    columnNumber = int.parse(columnStr);
  }
}
