


import 'package:ad_mvc/ad_mvc.dart';
import 'package:flutter/cupertino.dart';

class Util {

  static String? getRouteName(String? page, String? name, dynamic arguments,){
    String? routeName;
    print("getRouteName: 1");
    if(name != null){
      print("getRouteName: 2");
      routeName = name;
    } else {
      print("getRouteName: 3");
      if(MvcManager().routeMaps != null){
        print("getRouteName: 4");
        if(MvcManager().routeMaps!.containsKey(page)){
          print("getRouteName: 5");
          routeName = MvcManager().routeMaps![page];
        } else {
          print("getRouteName: 6");
          routeName = page;
        }
      } else {
        print("getRouteName: 7");
        routeName = page;
      }

    }
    if(routeName != null && routeName.contains("/")){
      String? route;
      List<String> paths = routeName.split("/");
      print("getRouteName: $paths --- $arguments");
      List<String> temp = [];
      if(paths.length > 2){
        for(int index = 0; index < paths.length; index ++){
          var path = paths[index];
          if(path.startsWith(":")){
            String args = path.replaceAll(":", "");
            print("args： $args");
            // paths[index] = arguments[args];
            temp.add(arguments[args]);
            print("arguments[args]: ${arguments[args]}");
          } else {
            temp.add(path);
          }
        }
        print("getRouteName: $paths");
        routeName = temp.join("/");
      }
    }
    print("getRouteName: ${routeName}");
    return routeName;
  }
}