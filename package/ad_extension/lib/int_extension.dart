import 'dart:math';

extension IntOption on int {


  /// @title thousandSymbol
  /// @description 将指定数字转换成带千分符文的字符串
  /// @return String
  /// @updateTime 2022/2/8 2:10 下午
  /// @author 10456
  String get thousandSymbol {
    if (this >= 1000) {
      String value = "$this";
      String sub = "";
      int size = value.length;
      for (var i = 0; i < size; ++i) {
        var bean = value[i];
        sub += bean;
        if ((size - i - 1) % 3 == 0 && i != size - 1) {
          sub += ",";
        }
      }
      return sub;
    } else {
      return "$this";
    }
  }


  /// @title random
  /// @description 参数指定范围的随机数
  /// @return int
  /// @updateTime 2022/2/8 2:10 下午
  /// @author 10456
  int get random => Random().nextInt(this);

}
