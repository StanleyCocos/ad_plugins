
import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_plugins/route/route1/route_controller1.dart';
import 'package:flutter/cupertino.dart';

class RoutePage1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoutePage1();

}

class _RoutePage1 extends BasePageState<RoutePage1, RouteController1> {

  @override
  RouteController1 controller = RouteController1();

  @override
  Widget get content {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: GestureDetector(
          onTap: (){
            controller.onTap();
          },
          child: Text("切换"),
        ),
      ),
    );
  }

}