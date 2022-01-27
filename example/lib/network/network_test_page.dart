import 'package:ad_network/ad_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NetworkState();
}

class _NetworkState extends State<NetworkPage> {
  List<String> listData = [
    "get请求",
    "post请求",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求测试"),
      ),
      body: ListView.separated(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ()=> onTap(index),
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(listData[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
            indent: 20,
          );
        },
      ),
    );
  }

  void onTap(int index){
    print(listData[index]);
    switch(index){
      case 0:
        HttpRequest().get("http://api.debug.100.com.tw/api/configs/update_times", params: {}, callBack: (data){});
        break;
      case 1:
        HttpRequest().post("", params: {}, callBack: (data){});
        break;
      case 2:
        break;
      case 3:
        break;
    }

  }

}
