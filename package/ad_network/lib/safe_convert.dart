import 'package:ad_network/http_request_setting.dart';
import 'package:flutter/foundation.dart';


int asInt(Map<String, dynamic>? json, String key, {int defaultValue = 0}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue;
    var value = json[key];
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is bool) return value ? 1 : 0;
    if (value is String) return int.tryParse(value) ?? defaultValue;
    return defaultValue;
  } catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key error: $e");
    }
    return defaultValue;
  }
}

double asDouble(Map<String, dynamic>? json, String key, {double defaultValue = 0.0}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue;
    var value = json[key];
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is bool) return value ? 1.0 : 0.0;
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  } catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key  error: $e");
    }
    return defaultValue;
  }
}

bool asBool(Map<String, dynamic>? json, String key, {bool defaultValue = false}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue;
    var value = json[key];
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value == 0 ? false : true;
    if (value is double) return value == 0 ? false : true;
    if (value is String) {
      if (value == "1" || value.toLowerCase() == "true") return true;
      if (value == "0" || value.toLowerCase() == "false") return false;
    }
    return defaultValue;
  } catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key  error: $e");
    }
    return defaultValue;
  }
}

String asString(Map<String, dynamic>? json, String key, {String defaultValue = ""}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue;
    var value = json[key];
    if (value == null) return defaultValue;
    if (value is String) return value;
    if (value is int) return value.toString();
    if (value is double) return value.toString();
    if (value is bool) return value ? "true" : "false";
    return defaultValue;
  } catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key  error: $e");
    }
    return defaultValue;
  }
}

Map<String, dynamic> asMap(Map<String, dynamic>? json, String key, {Map<String, dynamic>? defaultValue}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue ?? <String, dynamic>{};
    var tempValue = json[key];
    if(tempValue == null) return defaultValue ?? <String, dynamic>{};
    var value = Map<String, dynamic>.from(tempValue);
    return value;
  } catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key  error: $e");
    }
    return defaultValue ?? <String, dynamic>{};
  }
}

List asList(Map<String, dynamic>? json, String key, {List? defaultValue}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue ?? [];
    var value = json[key];
    if (value == null) return defaultValue ?? [];
    if (value is List) return value;
    return defaultValue ?? [];
  }catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key  error: $e");
    }
    return defaultValue ?? [];
  }
}


List<String> asListStr(Map<String, dynamic>? json, String key, {List<String>? defaultValue}) {
  try{
    if (json == null || !json.containsKey(key)) return defaultValue ?? [];
    var value = json[key];
    if (value == null) return defaultValue ?? [];
    if (value is List){
      List<String> list = [];
      for (var obj in value) {
        var tempObj = "";
        if (obj is String) tempObj = obj;
        if (obj is int) tempObj = obj.toString();
        if (obj is bool) tempObj = obj ? "true" : "false";
        if (obj is double) tempObj = obj.toString();
        list.add(tempObj);
      }
      return list;
    }
    return defaultValue ?? [];
  } catch(e){
    if (kDebugMode) {
      print("❎❎❎❎ key: $key  error: $e");
    }
    return defaultValue ?? [];
  }
}
