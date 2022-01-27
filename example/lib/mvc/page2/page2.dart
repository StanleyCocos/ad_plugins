

import 'package:ad_mvc/base_state_page.dart';
import 'package:ad_plugins/mvc/page2/controller3.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {

  const Page2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page2();
}


class _Page2 extends BasePageState<Page2, Controller1>{

  @override
  Controller1 controller = Controller1();

  @override
  Widget get content {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
      child: const Center(
        child: Text("这是page2的content"),
      ),
    );
  }


}