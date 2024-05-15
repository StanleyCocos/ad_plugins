import 'dart:async';

// import 'package:sqflite/sqflite.dart';

import 'column.dart';
import 'db_manager.dart';
import 'split_merge.dart';

abstract class BaseTableModel {

  /// @map
  /// @description 表相应的的列字段属性
  /// @return Map<String, BaseColumn>
  /// @updateTime 2021/12/23 10:33 上午
  /// @author 10456
  Map<String, BaseColumn> get map;

  /// @copy
  /// @description 需要提供实现类的实例
  /// @return BaseTableModel
  /// @updateTime 2021/12/23 10:33 上午
  /// @author 10456
  BaseTableModel copy();

  /// @result
  /// @description 是否正常获取到结果(未测试)
  /// @return bool
  /// @updateTime 2021/12/23 10:34 上午
  /// @author 10456
  bool result = false;

  /// @id
  /// @description 默认主键(需要自己设定到字段map里面)
  /// @return STInt
  /// @updateTime 2021/12/23 10:35 上午
  /// @author 10456
  STInt id = STInt(primaryKey: true, autoIncrement: true);

  /// @execute
  /// @description 执行相应的sql
  /// @return Future
  /// @updateTime 2021/12/23 10:36 上午
  /// @author 10456
  static Future<void> execute(String sql) async {
    // Database? db = await DBManager.getDatabase();
    // return await db?.execute(sql);
  }

  /// @create
  /// @description 创建表
  /// @return Future
  /// @updateTime 2021/12/23 10:36 上午
  /// @author 10456
  Future create() async {
    // try {
    //   var createSql = "create table if not exists $runtimeType($column);";
    //   Database? db = await DBManager.getDatabase();
    //   return await db?.execute(createSql);
    // } catch (e) {
    //   return e;
    // }
  }

  /// @save
  /// @description 插入数据
  /// @return Future<int> 受影响有多少条数据
  /// @updateTime 2021/12/23 10:37 上午
  /// @author 10456
  Future<int> save() async {
    return 0;
    // try {
    //   await create();
    //   Database? db = await DBManager.getDatabase();
    //   return (await db?.insert("$runtimeType", contentMap)) ?? 0;
    // } catch (e) {
    //   return 0;
    // }
  }

  /// @saveBatch
  /// @description 批量插入数据
  /// @param: list 插入的数据
  /// @Future<int> 受影响有多少条数据
  /// @updateTime 2021/12/23 10:38 上午
  /// @author 10456
  Future<int> saveBatch<T extends BaseTableModel>(List<T> list) async {
    return 0;
    // try {
    //   await create();
    //   Database? db = await DBManager.getDatabase();
    //   var count = 0;
    //   await db?.transaction((txn) async {
    //     list.forEach((element) async {
    //       var state = await txn.insert("$runtimeType", element.contentMap);
    //       if (state > 0) count++;
    //     });
    //   });
    //   return count;
    // } catch (e) {
    //   return 0;
    // }
  }

  /// @update
  /// @description 更新数据
  /// @param: where 删除条件('id=xxx')
  /// @return Future<int> 受影响有多少条数据
  /// @updateTime 2021/12/23 10:39 上午
  /// @author 10456
  Future<int> update({String? where}) async {
    return 0;
    // try {
    //   where ??= "id = ${id.content}";
    //   Database? db = await DBManager.getDatabase();
    //   return (await db?.update("$runtimeType", contentMap,
    //       where: where)) ?? 0;
    // } catch (e) {
    //   return 0;
    // }
  }

  /// @title delete
  /// @description 删除数据
  /// @param: where 删除条件('id=xxx')
  /// @return Future<int> 受影响有多少条数据
  /// @updateTime 2021/12/23 10:40 上午
  /// @author 10456
  Future<int> delete({String? where}) async {
    return 0;
    // try {
    //   Database? db = await DBManager.getDatabase();
    //   return (await db?.delete("$runtimeType",
    //       where: where == null ? "id = ${id.content}" : where)) ?? 0;
    // } catch (e) {
    //   return 0;
    // }
  }

  /// @title clear
  /// @description 清空表
  /// @return Future<int> 受影响有多少条数据
  /// @updateTime 2021/12/23 10:41 上午
  /// @author 10456
  Future<int> clear() async {
    return 0;
    // try {
    //   Database? db = await DBManager.getDatabase();
    //   return await db?.rawDelete("DELETE FROM $runtimeType") ?? 0;
    // } catch (e) {
    //   return 0;
    // }
  }

  /// @title contain
  /// @description 判断当前查询数据是否存在
  /// @param: where 判断条件('id=xxx')
  /// @return Future<bool> 受影响有多少条数据
  /// @updateTime 2021/12/23 10:41 上午
  /// @author 10456
  Future<bool> contain({String where = ""}) async {
    return false;
    // try {
    //   Database? db = await DBManager.getDatabase();
    //   List<String> columns = List.from(map.keys);
    //   List<Map> data = await db?.query(
    //     "$runtimeType",
    //     where: where.isNotEmpty ? where : "id=(select last_insert_rowid())",
    //     columns: columns,
    //   ) ?? <Map>[];
    //   return data.isNotEmpty;
    // } catch (e) {
    //   return false;
    // }
  }

  /// @title one
  /// @description 获取单挑记录
  /// @param: where 获取条件('id=xxx')
  /// @return Future<BaseTableModel?>
  /// @updateTime 2021/12/23 10:42 上午
  /// @author 10456
  Future<BaseTableModel?> one({String where = ""}) async {
    return null;
    // try {
    //   Database? db = await DBManager.getDatabase();
    //   List<String> columns = List.from(map.keys);
    //   List<Map> data = await db?.query(
    //     "$runtimeType",
    //     where: where.isNotEmpty ? where : "id=(select last_insert_rowid())",
    //     columns: columns,
    //   ) ?? <Map>[];
    //   if (data.isEmpty) return null;
    //   setRowContent(rowData: data.first as Map<String, Object?>?);
    //   return this;
    // } catch (e) {
    //   return null;
    // }
  }


  /// @title many
  /// @description 获取多条记录
  /// @param: where 获取条件('id=xxx')
  /// @return Future<List<BaseTableModel>>
  /// @updateTime 2022/1/26 11:11 上午
  /// @author 10456
  Future<List<T>> many<T extends BaseTableModel>({String where = ""}) async {
    return [];
    // try {
    //   Database? db = await DBManager.getDatabase();
    //   List<String> columns = List.from(map.keys);
    //   List<Map> data = await db?.query(
    //     "$runtimeType",
    //     where: where.isNotEmpty ? where : "id=(select last_insert_rowid())",
    //     columns: columns,
    //   ) ?? <Map>[];
    //   if (data.isEmpty) return [];
    //   List<T> list = [];
    //   data.forEach((element) {
    //     var obj = this.copy();
    //     obj.setRowContent(rowData: element as Map<String, Object?>?);
    //     list.add(obj as T);
    //   });
    //   return list;
    // } catch (e) {
    //   return [];
    // }
  }


  /// @title all
  /// @description 获取所有记录
  /// @return Future<List<T>>
  /// @updateTime 2021/12/23 10:42 上午
  /// @author 10456
  Future<List<T>> all<T extends BaseTableModel>() async {
    return [];
    //
    // try {
    //   Database? db = await DBManager.getDatabase();
    //   List<Map> maps = await db?.query(
    //     "$runtimeType",
    //   ) ?? <Map>[];
    //   if (maps.isEmpty) return [];
    //   List<T> list = [];
    //   maps.forEach((element) {
    //     var obj = this.copy();
    //     obj.setRowContent(rowData: element as Map<String, Object?>?);
    //     list.add(obj as T);
    //   });
    //   return list;
    // } catch (e) {
    //   return [];
    // }
  }

  /// @title json
  /// @description 获取模型的键值对
  /// @return Map<String, Object?>
  /// @updateTime 2021/12/23 10:42 上午
  /// @author 10456
  Map<String, Object?> get json {
    var columnMap = map;
    Map<String, Object?> json = {};
    columnMap.forEach((key, value) {
      json[key] = value.content;
    });
    return json;
  }
}

/*
* 数据处理
* */
extension DataOption on BaseTableModel {
  /*
  * 获取列键值对
  * */
  Map<String, Object?> get contentMap {
    var columnMap = map;
    if (columnMap.isEmpty) return {};
    Map<String, Object?> contents = {};
    columnMap.forEach((k, v) {
      if (v.type == "enum") {
        contents[k] = getEnumContent(v as STEnum);
      } else if (v.type == "set") {
        contents[k] = getSetContent(v as STSet);
      } else {
        contents[k] = v.content;
      }
    });
    return contents;
  }

  /*
  * 转换枚举列数据
  * */
  String getEnumContent(STEnum obj) {
    if (obj.enumList!.isEmpty || obj.content == null) return "";
    if (obj.content! >= 0 && obj.content! < obj.enumList!.length) {
      return obj.enumList![obj.content!];
    }
    return "";
  }

  /*
  * 转换集合列数据
  * */
  String getSetContent(STSet obj) {
    if (obj.setList!.length <= 0 ||
        obj.content == null ||
        obj.content!.length <= 0) return "";
    var value = "";
    obj.content!.forEach((element) {
      if (element >= 0 && element < obj.setList!.length) {
        value += value.length > 0
            ? ",${obj.setList![element]}"
            : "${obj.setList![element]}";
      }
    });
    return value;
  }

  /*
  * 获取所有列的值
  * */
  String get values {
    if (map.isEmpty) return "";
    var value = "";
    map.forEach((k, v) {
      value += value.isNotEmpty ? ",$v" : "$v";
    });
    return value;
  }

  /*
  * 获取所有列的名称
  * */
  String get keys {
    if (map.isEmpty) return "";
    var key = "";
    map.forEach((k, v) {
      key += key.isNotEmpty ? ",$k" : k;
    });
    return key;
  }

  /*
  * 获取整体列的所有声明和属性
  * */
  String get column {
    return "";
    // var columnMap = map;
    // if (columnMap.isEmpty) return "";
    // var columns = "";
    // columnMap.forEach((k, v) {
    //   var temp = columns.isNotEmpty ? "," : "";
    //   columns += "$temp${ColumnSplitMerge.combine(v, key: k)}";
    // });
    // return columns;
  }

  /*
  * 映射模型相应的值
  * */
  void setRowContent({Map<String, Object?>? rowData}) {
    if (rowData == null || rowData.isEmpty) return;
    var temp = map;
    rowData.forEach((key, value) {
      if (temp[key]!.type == "set") {
        var setObj = temp[key];
        if(setObj != null && setObj is STSet){
          setObj.content = setSetRowContent(temp[key] as STSet, value as String);
          setObj.content?.forEach((element) {
            setObj.setValue.add(setObj.setList?[element] ?? "");
          });
        }
      } else if (temp[key]!.type == "enum") {
        var enumObj = temp[key];
        if(enumObj != null && enumObj is STEnum){
          enumObj.content = setEnumRowContent(temp[key] as STEnum, value as String?);
          enumObj.enumValue = enumObj.enumList?[enumObj.content!] ?? "";
        }
      } else {
        temp[key]!.content = value;
      }
    });
    result = true;
  }

  /*
  * 映射转换枚举的值
  * */
  int? setEnumRowContent(STEnum obj, String? value) {
    for (int index = 0; index < obj.enumList!.length; index++) {
      var element = obj.enumList![index];
      if (value == element) {
        return index;
      }
    }
    return null;
  }

  /*
  * 映射集合枚举的值
  * */
  List<int> setSetRowContent(STSet obj, String value) {
    List<String> list = value.split(",");
    List<int> indexList = [];
    for (int index = 0; index < obj.setList!.length; index++) {
      var element = obj.setList![index];
      if (list.contains(element)) {
        indexList.add(index);
      }
    }
    return indexList;
  }
}
