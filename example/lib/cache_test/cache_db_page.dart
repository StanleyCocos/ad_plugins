// import 'package:ad_cache/ad_cache.dart';
// import 'package:ad_cache/db/column.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CacheDBPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _CacheDBState();
// }
//
// class _CacheDBState extends State<CacheDBPage> {
//   var listData = [
//     "保存单条",
//     "保存多条",
//     "获取单条",
//     "获取多条",
//     "获取全部",
//     "删除单条",
//     "删除多条",
//     "删除全部",
//     "更新单条",
//     "更新多条",
//     "清空后更新",
//   ];
//
//   DBTest dbTest = DBTest();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("数据库测试"),
//       ),
//       body: ListView.separated(
//         itemCount: listData.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: ()=> onTap(index),
//             child: Container(
//               width: double.infinity,
//               height: 40,
//               padding: EdgeInsets.only(left: 20),
//               alignment: Alignment.centerLeft,
//               child: Text("${listData[index]} -- $index"),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return const Divider(
//             height: 1,
//             indent: 20,
//             color: Colors.grey,
//           );
//         },
//       ),
//     );
//   }
//
//   void onTap(int index) async{
//     print(listData[index]);
//     switch(index){
//       case 0:
//         var test1 = DBTest(
//           name: "单条数据",
//           age: 18,
//           weight: 69.7,
//           hobby: [1, 3],
//           girlfriend: 1,
//         );
//          await test1.save();
//         break;
//       case 1:
//         var test1 = DBTest(
//           name: "多条插入1",
//           age: 18,
//           weight: 69.7,
//           hobby: [1, 3],
//           girlfriend: 1,
//         );
//
//         var test2 = DBTest(
//           name: "多条插入2",
//           age: 14,
//           weight: 40.7,
//           hobby: [0, 3],
//           girlfriend: 0,
//         );
//         await DBTest().saveBatch([test1, test2]);
//         break;
//       case 2:
//         var test = await DBTest().one(where: "age='14'");
//         print(test?.json);
//         if(test is DBTest){
//           print(test.girlfriend.enumValue);
//           print(test.hobby.setValue);
//         }
//         break;
//       case 3:
//         var list = await DBTest().many(where: "age='18'");
//         print("当前有${list.length}条数据");
//         list.forEach((element) {
//           print(element.json);
//         });
//         break;
//       case 4:
//         var list = await DBTest().all();
//         print("当前有${list.length}条数据");
//         list.forEach((element) {
//           print(element.json);
//         });
//         break;
//       case 5:
//         await DBTest().delete(where: "age=18");
//         break;
//       case 6:
//         await DBTest().delete(where: "age=18");
//         break;
//       case 7:
//         DBTest().clear();
//         break;
//       case 8:
//         var test = await DBTest().one(where: "age='14'");
//         if(test is DBTest){
//           test.name.content = "单条更新";
//           await test.update(where: "age='14'");
//         }
//         break;
//       case 9:
//
//         break;
//     }
//   }
//
//
//   DBTest createTest() {
//     return DBTest(
//       name: "小明1",
//       age: 202,
//       weight: 40.7,
//       hobby: [0, 3],
//       girlfriend: 1,
//     );
//   }
// }
//
//
// class DBTest extends BaseTableModel {
//
//
//   @override
//   BaseTableModel copy() => DBTest();
//
//   @override
//   Map<String, BaseColumn> get map => {
//     "age": age,
//     "name": name,
//     "weight": weight,
//     "timestamp": timestamp,
//     "datetime": datetime,
//     "hobby": hobby,
//     "girlfriend": girlfriend,
//   };
//
//   DBTest({int? age, String? name, double? weight, List<int>? hobby, int? girlfriend}){
//     this.age.content = age ?? 0;
//     this.name.content = name ?? "";
//     this.weight.content = weight ?? 0.0;
//     timestamp.content = DateTime.now().millisecondsSinceEpoch;
//     datetime.content = "2022-01-26";
//     this.hobby.content = hobby;
//     this.girlfriend.content = girlfriend;
//   }
//
//
//   STInt uId = STInt(canNull: false, primaryKey: true, autoIncrement: true, defaultValue: 200);
//   STInt age = STInt(canNull: false);
//   STText name = STText(canNull: true);
//   STDouble weight = STDouble(canNull: false);
//   STTimestamp timestamp = STTimestamp();
//   STDatetime datetime = STDatetime();
//   STSet hobby = STSet(setList: ["篮球", "足球", "乒乓球", "羽毛球", "跑步"]);
//   STEnum girlfriend = STEnum(enumList: ["张三", "李四", "王五", "天线宝宝", "光头强"]);
// }
