import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_plugins/mvc/list_page2/list_controller2.dart';
import 'package:flutter/material.dart';

class ListPage1 extends StatefulWidget {
  const ListPage1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends BasePageState<ListPage1, ListController1> {
  @override
  ListController1 controller = ListController1();

  @override
  Widget get content {
    print("--- ${controller.listData.length}");
    return EasyRefresh(
      onLoad: controller.loadListDataMore,
      onRefresh: controller.loadListData,
      child: ListView.separated(
        itemCount: controller.listData.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey,
            child: Text(controller.listData[index]),
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
}
