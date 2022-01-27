import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_plugins/route/route1/route_model1.dart';
import 'package:ad_plugins/route/route2/route_page2.dart';
import 'package:ad_route/ad_route.dart';

class RouteController1 extends BaseController<RouteModel1> {
  @override
  RouteModel1 model = RouteModel1();

  @override
  bool get content => true;
}


extension Action on RouteController1 {
  
  void onTap(){
    // push(RoutePage2(), arguments: {"id": 2});
    RouteManager().pushPage(RoutePage2(), arguments: {"id": 2}).then((value){
      print("接收下个页面回传的值: $value");
    });
  }
  
}