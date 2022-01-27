import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_plugins/route/route2/route_model2.dart';


class RouteController2 extends BaseController<RouteModel2> {

  @override
  RouteModel2 model = RouteModel2();

  @override
  bool get content => true;


  @override
  void initRouteArguments() {
    model.id = getArgument("id") ?? 0;
    super.initRouteArguments();
  }

}


extension Action on RouteController2 {

  void onTap(){
    // push(page)
    print(model.id);
    pop(result: "ok");
  }

}