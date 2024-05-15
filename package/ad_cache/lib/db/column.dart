abstract class BaseColumn<T> {

  T? content;

  /// 数据类型(int char set enum)等 子类自动设定
  final String type;

  /// 是否可以为null
  final bool canNull;

  /// 默认值
  final Object? defaultValue;

  /// 是否为主键
  final bool primaryKey;

  /// 是否自动累计
  final bool autoIncrement;

  BaseColumn({
    this.type = "",
    this.canNull = true,
    this.primaryKey = false,
    this.autoIncrement = false,
    this.defaultValue,
  });


  Map<String, Object> get map => {
    "type": type,
    "canNull": "$canNull",
    "primaryKey": "$primaryKey",
    "autoIncrement": "$autoIncrement",
    "defaultValue": "$defaultValue",
  };
}

/// set 集合
class STSet extends BaseColumn<List<int>> {
  /// 枚举
  List<String>? setList = [];
  List<String> setValue = [];
  STSet({
    this.setList,
    bool canNull = true,
    String? defaultValue,
  }) : super(
    type: "set",
    canNull: canNull,
    defaultValue: defaultValue,
  );
}

/// enum 枚举字符串
class STEnum extends BaseColumn<int> {
  /// 枚举
  List<String>? enumList = [];
  String? enumValue;
  STEnum({
    this.enumList,
    bool canNull = true,
    String? defaultValue,
  }) : super(
    type: "enum",
    canNull: canNull,
    defaultValue: defaultValue,
  );
}

/// text 文本字符串
class STText extends BaseColumn<String> {

  STText({
    bool canNull = true,
    String? defaultValue,
    bool primaryKey = false,
    bool autoIncrement = false,
  }) : super(
    type: "text",
    canNull: canNull,
    defaultValue: defaultValue,
    primaryKey: primaryKey,
  );
}


class STDatetime extends BaseColumn<String> {
  STDatetime({
    bool canNull = true,
    Object? defaultValue,
    bool primaryKey = false,
    bool autoIncrement = false,
  }) : super(
    type: "datetime",
    canNull: canNull,
    defaultValue: defaultValue,
  );
}


class STTimestamp extends BaseColumn<int> {

  STTimestamp({
    bool canNull = true,
    Object? defaultValue,
    bool primaryKey = false,
    bool autoIncrement = false,
  }) : super(
    type: "timestamp",
    canNull: canNull,
    defaultValue: defaultValue,
  );
}


class STInt extends BaseColumn<int> {

  STInt({
    bool canNull = true,
    Object? defaultValue,
    bool primaryKey = false,
    bool autoIncrement = false,
  }) : super(
    type: "integer",
    canNull: canNull,
    defaultValue: defaultValue,
    primaryKey: primaryKey,
    autoIncrement: autoIncrement,
  );
}

class STDouble extends BaseColumn<double> {
  STDouble({
    bool canNull = true,
    Object? defaultValue,
  }) : super(
    type: "double",
    canNull: canNull,
    defaultValue: defaultValue,
  );
}

