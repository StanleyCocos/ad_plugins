import 'package:ad_extension/int_extension.dart';
import 'package:flutter/material.dart';

extension MyColor on Color {

  static Color get random => Color.fromRGBO(255.random, 255.random, 255.random, 1);

  static Color get black => hex(0x000000, alpha: 1);

  static Color get white => hex(0xFFFFFF, alpha: 1);

  static Color get bg => hex(0xF7F5F6);

  static Color get divider => hex(0xF6F6F6);

  static Color get green => hex(0x55A32A);

  static Color get greenE4 => hex(0xE4F3E5);

  static Color get green4C => hex(0x4CD964);

  static Color get green25 => hex(0x25C489);

  static Color get pink => hex(0xEB6877);

  static Color get red => hex(0xFF0000);

  static Color get redFD => hex(0xFDEEEC);

  static Color get redE9 => hex(0xE94E3C);

  static Color get blue => hex(0x2196F3);

  static Color get gray => hex(0x9E9E9E);

  static Color get gray33 => hex(0x333333);

  static Color get gray4D => hex(0x4D4D4D);

  static Color get gray66 => hex(0x666666);

  static Color get gray99 => hex(0x999999);

  static Color get grayB3 => hex(0xB3B3B3);

  static Color get grayB6 => hex(0xB6B6B6);

  static Color get grayCC => hex(0xCCCCCC);

  static Color get grayDD => hex(0xDDDDDD);

  static Color get grayE6 => hex(0xE6E6E6);

  static Color get grayEE => hex(0xEEEEEE);

  static Color get grayF0 => hex(0xF0F0F0);

  static Color get grayF456 => hex(0xF4F5F6);

  static Color get grayF6 => hex(0xF6F6F6);

  static Color get grayFA => hex(0xFAFAFA);


  /*
  * 16进制转颜色
  * */
  static Color hex(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }

  /*
  * #16进制转颜色
  * */
  static Color hexStr(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}