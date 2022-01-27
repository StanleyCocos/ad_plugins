import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_plugins/route/route2/route_controller2.dart';
import 'package:flutter/cupertino.dart';

class RoutePage2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoutePage2();

}

class _RoutePage2 extends BasePageState<RoutePage2, RouteController2> {

  @override
  RouteController2 controller = RouteController2();

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