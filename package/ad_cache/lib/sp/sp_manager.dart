import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';
import 'package:ad_cache/tool/extensions.dart';


/// 偏好设置存储管理类
class SpManager {
  static final Lock _lock = Lock();
  static SharedPreferences? _sharedPreferences;

  /// @title init
  /// @description 同步锁异步初始 Preferences
  /// @return Future
  /// @updateTime 2021/12/23 9:56 上午
  /// @author 10456
  static Future init() async {
    if (_sharedPreferences == null) {
      await _lock.synchronized(() async {
        _sharedPreferences ??= await SharedPreferences.getInstance();
      });
    }
  }

  /// @title get
  /// @description 获取指定任意类型缓存
  /// @param: 缓存名称(String, Enum)
  /// @return dynamic
  /// @updateTime 2021/12/23 10:28 上午
  /// @author 10456
  static dynamic get(Object name) {
    if (name is String && name.isEmptyOrNull) return null;
    return _sharedPreferences?.get(_realName(name));
  }

  /// @title getBool
  /// @description 获取指定Bool类型缓存
  /// @param: 缓存名称(String, Enum)
  /// @param: defaultValue
  /// @return String
  /// @updateTime 2021/12/23 10:28 上午
  /// @author 10456
  static bool getBool(name, {bool defaultValue = false}) {
    if (name is String && name.isEmptyOrNull) return defaultValue;
    try {
      return _sharedPreferences?.getBool(_realName(name)) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  /// @title getInt
  /// @description 获取指定Int类型缓存
  /// @param: 缓存名称(String, Enum)
  /// @param: defaultValue
  /// @return String
  /// @updateTime 2021/12/23 10:28 上午
  /// @author 10456
  static int getInt(name, {int defaultValue = 0}) {
    if (name is String && name.isEmptyOrNull) return defaultValue;
    try {
      return _sharedPreferences?.getInt(_realName(name)) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  /// @title getDouble
  /// @description 获取指定Double类型缓存
  /// @param: 缓存名称(String, Enum)
  /// @param: defaultValue
  /// @return String
  /// @updateTime 2021/12/23 10:28 上午
  /// @author 10456
  static double getDouble(name, {double defaultValue = 0.0}) {
    if (name is String && name.isEmptyOrNull) return defaultValue;
    try {
      return _sharedPreferences?.getDouble(_realName(name)) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }


  /// @title getString
  /// @description 获取指定String类型缓存
  /// @param: 缓存名称(String, Enum)
  /// @param: defaultValue
  /// @return String
  /// @updateTime 2021/12/23 10:28 上午
  /// @author 10456
  static String getString(name, {String defaultValue = ""}) {
    if (name is String && name.isEmptyOrNull) return defaultValue;
    try {
      return _sharedPreferences?.getString(_realName(name)) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }


  /// @title getStringList
  /// @description 获取指定[String]类型缓存
  /// @param: 缓存名称(String, Enum)
  /// @param: defaultValue
  /// @return List<String>
  /// @updateTime 2021/12/23 10:28 上午
  /// @author 10456
  static List<String> getStringList(name, {List<String>? defaultValue}) {
    if (name is String && name.isEmptyOrNull) return defaultValue ?? [];
    try {
      return _sharedPreferences?.getStringList(_realName(name)) ?? defaultValue ?? [];
    } catch (e) {
      return defaultValue ?? [];
    }
  }

  /// @title setBool
  /// @description 缓存bool至Preferences
  /// @param: 缓存名称(String, Enum)
  /// @param: value
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static void setBool(name, bool value) {
    if ((name is String && name.isEmptyOrNull)) return;
    _sharedPreferences?.setBool(_realName(name), value);
  }

  /// @title setInt
  /// @description 缓存int至Preferences
  /// @param: 缓存名称(String, Enum)
  /// @param: value
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static void setInt(name, int value) {
    if ((name is String && name.isEmptyOrNull)) return;
    _sharedPreferences?.setInt(_realName(name), value);
  }

  /// @title setDouble
  /// @description 缓存Double至Preferences
  /// @param: 缓存名称(String, Enum)
  /// @param: value
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static void setDouble(name, double value) {
    if ((name is String && name.isEmptyOrNull)) return;
    _sharedPreferences?.setDouble(_realName(name), value);
  }

  /// @title setString
  /// @description 缓存String至Preferences
  /// @param: 缓存名称(String, Enum)
  /// @param: value
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static void setString(name, String value) {
    if ((name is String && name.isEmptyOrNull)) return;
    _sharedPreferences?.setString(_realName(name), value);
  }

  /// @title setStringList
  /// @description 缓存[String]至Preferences
  /// @param: 缓存名称(String, Enum)
  /// @param: value
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static void setStringList(name, List<String> value) {
    if ((name is String && name.isEmptyOrNull)) return;
    _sharedPreferences?.setStringList(_realName(name), value);
  }

  /// @title remove
  /// @description 删除缓存数据
  /// @param: 缓存名称(String, Enum)
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static void remove(name) {
    if (name is String && name.isEmptyOrNull) return;
    _sharedPreferences?.remove(_realName(name));
  }

  /// @title containsKey
  /// @description 查找缓存数据是否存在
  /// @param: 缓存名称(String, Enum)
  /// @updateTime 2021/12/23 10:15 上午
  /// @author 10456
  static bool containsKey(name) {
    if (name is String && name.isEmptyOrNull) return false;
    return _sharedPreferences?.containsKey(_realName(name)) ?? false;
  }


  static String _realName(Object name) {
    if (name is! String) name = name.toString().enumRowValue;
    return name.toString();
  }
}
