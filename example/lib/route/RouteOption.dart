
import 'package:ad_route/ad_route.dart';
import 'package:flutter/material.dart';

class RouteOptions extends BaseRouteOption {

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("从${previousRoute?.settings.name} Push ${route.settings.name}");
  }

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("从${previousRoute?.settings.name} Pop ${route.settings.name}");
  }

  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("从${previousRoute?.settings.name} Remove ${route.settings.name}");
  }

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print("从${oldRoute?.settings.name} Replace ${newRoute?.settings.name}");
  }

  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("从${route.settings.name} didStartUserGesture ${previousRoute?.settings.name}");
  }

  void didStopUserGesture() {
    print("didStopUserGesture");
  }


}