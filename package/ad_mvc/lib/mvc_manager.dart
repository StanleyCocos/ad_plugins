

import 'package:ad_mvc/state_interceptor.dart';
import 'package:get/get.dart';

class MvcManager {

  factory MvcManager() {
    _instance ??= MvcManager._internal();
    return _instance!;
  }
  static MvcManager? _instance;
  MvcManager._internal();

  StateInterface? _interceptor;
  Map<String, dynamic>? _routeMaps;

  void init({StateInterface? interceptor, Map<String, dynamic>? routeMaps}){
   _interceptor = interceptor;
   _routeMaps = routeMaps;
   // if(routes.isNotEmpty){
   //   for(var route in routes){
   //     _routeMaps![route.name] = route.page..runtimeType.toString();
   //   }
   // }
   // print("_routeMaps: ${_routeMaps}");
   // _routeMaps =
  }
}

extension Public on MvcManager {

  StateInterface? get interceptor => _interceptor;
  Map<String, dynamic>? get routeMaps => _routeMaps;

}
