import 'package:ad_cache/ad_cache.dart';
import 'package:flutter/material.dart';

class CacheSpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CacheSpState();
}

class _CacheSpState extends State<CacheSpPage> {
  final listData = [
    "Bool",
    "Int",
    "Double",
    "String",
    "StringList",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences Test"),
      ),
      body: ListView.separated(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return _CacheSpPageListItem(
            title: listData[index],
            index: index,
            onSetCallback: onSetTap,
            onGetCallback: onGetTap,
            onDelCallback: onDelTap,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            indent: 20,
            color: Colors.grey,
          );
        },
      ),
    );
  }

  void onSetTap(index) {
    print("123 ---- onSetTap");
    switch(index){
      case 0:
        SpManager.setBool(listData[index], true);
        break;
      case 1:
        SpManager.setInt(listData[index], index);
        break;
      case 2:
        SpManager.setDouble(listData[index], 0.2);
        break;
      case 3:
        SpManager.setString(listData[index], "$index-string");
        break;
      case 4:
        SpManager.setStringList(listData[index], listData);
        break;
    }
  }

  void onGetTap(index) {
    switch(index){
      case 0:
        print(SpManager.getBool(listData[index]));
        break;
      case 1:
        print(SpManager.getInt(listData[index]));
        break;
      case 2:
        print(SpManager.getDouble(listData[index]));
        break;
      case 3:
        print(SpManager.getString(listData[index]));
        break;
      case 4:
        print(SpManager.getStringList(listData[index]));
        break;
    }
  }

  void onDelTap(index) {
    SpManager.remove(listData[index]);
    switch(index){
      case 0:
        print(SpManager.getBool(listData[index]));
        break;
      case 1:
        print(SpManager.getInt(listData[index]));
        break;
      case 2:
        print(SpManager.getDouble(listData[index]));
        break;
      case 3:
        print(SpManager.getString(listData[index]));
        break;
      case 4:
        print(SpManager.getStringList(listData[index]));
        break;
    }
  }
}

class _CacheSpPageListItem extends StatelessWidget {
  final String title;
  final int index;
  final Function(int index)? onSetCallback;
  final Function(int index)? onGetCallback;
  final Function(int index)? onDelCallback;

  const _CacheSpPageListItem({
    required this.title,
    required this.index,
    this.onSetCallback,
    this.onGetCallback,
    this.onDelCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Text(title),
            ),
          ),
          GestureDetector(
            onTap: ()=> onSetCallback?.call(index),
            child: Container(
              width: 50,
              height: 40,
              alignment: Alignment.center,
              child: Text("设置"),
            ),
          ),
          GestureDetector(
            onTap: ()=> onGetCallback?.call(index),
            child: Container(
              width: 50,
              height: 40,
              alignment: Alignment.center,
              child: Text("获取"),
            ),
          ),
          GestureDetector(
            onTap: ()=> onDelCallback?.call(index),
            child: Container(
              width: 50,
              height: 40,
              alignment: Alignment.center,
              child: Text("删除"),
            ),
          ),
        ],
      ),
    );
  }
}
