

import 'package:ad_mvc/base_state_page.dart';
import 'package:flutter/material.dart';

import 'controller1.dart';

class Page1 extends StatefulWidget {

  const Page1({Key? key}):super(key: key);

  @override
  State<StatefulWidget> createState() => _Page1();
}


class _Page1 extends BasePageState<Page1, Controller1>{

  @override
  Controller1 controller = Controller1();

  @override
  Color get backgroundColor => Colors.green;

  @override
  Widget get content  {

    return Column(
      children: [
        GestureDetector(
          onTap: (){
            controller.test();
          },
          child: Container(
            width: 100,
            height: 40,
            child: Text("123"),
          ),
        ),
      ],
    );

    // return Column(
    //   children: [
    //
    //     TextField(),
    //     TextField(),
    //     TextField(),
    //
    //
    //   ],
    // );


    // return Center(
    //   child: Text("这是page1的content"),
    // );

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
      child: const Center(
        child: Text("这是page1的content"),
      ),
    );
  }
}