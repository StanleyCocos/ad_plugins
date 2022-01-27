import 'package:ad_route/ad_route.dart';
import 'package:flutter/material.dart';

enum RouteAction { PUSH, REPLACE, POP, REMOVE }


extension RouteData on RouteManager {

  /// @title routesSize
  /// @description 获取所有路由数量
  /// @return 数量
  /// @updateTime 2022/1/17 10:00 上午
  /// @author 10456
  int get routesSize => _mRoutes.length;

  /// @title routes
  /// @description 获取当前路由
  /// @return 路由
  /// @updateTime 2022/1/17 10:00 上午
  /// @author 10456
  Route? get currentRoute => _mRoutes[routesSize - 1];

  /// @title routes
  /// @description 获取所有路由
  /// @return 路由数组
  /// @updateTime 2022/1/17 10:00 上午
  /// @author 10456
  Route? get previousRoute => routesSize > 1 ? _mRoutes[routesSize - 2] : null;

  /// @title getRouteByIndex
  /// @description 获取指定路由
  /// @param: index 指定下标
  /// @return Route?
  /// @updateTime 2022/1/17 9:51 上午
  /// @author 10456
  Route? getRouteByIndex(int index) {
    if (index < routesSize && index >= 0) return _mRoutes[index];
    return null;
  }

  /// @title routes
  /// @description 获取所有路由
  /// @return 路由数组
  /// @updateTime 2022/1/17 10:00 上午
  /// @author 10456
  List<Route?> get routes => _mRoutes;

  /// @title isCurrentRoute
  /// @description 是否为指定页面
  /// @param: pageType 指定页面
  /// @return bool
  /// @updateTime 2022/1/14 5:50 下午
  /// @author 10456
  bool isCurrentRoute(String pageType) {
    return currentRoute!.settings.name == pageType.toString();
  }

}

extension RouteOption on RouteManager {

  /// @title init
  /// @description 初始路由管理
  /// @param: options 路由切换的时候生命周期对象数组
  /// @param: homeName 首页名称
  /// @param: type 切换动画
  /// @return Future
  /// @updateTime 2022/1/14 5:56 下午
  /// @author 10456
  Future init(
      {List<BaseRouteOption>? options,
        String homeName = "",
        PageTransitionType type = PageTransitionType.sysDefault}) async {
    _option = options ?? [];
    _homePageType = homeName;
    _type = type;
  }


  /// @title routeBuild
  /// @description 创建路由
  /// @param: page 页面
  /// @param: type 切换动画
  /// @param: arguments 参数
  /// @return Route
  /// @updateTime 2022/1/14 6:02 下午
  /// @author 10456
  Route routeBuild({
    required Widget page,
    PageTransitionType? type,
    Object? arguments,
  }) {
    type ??= _type;
    switch (type) {
      case PageTransitionType.scale:
        return ScaleRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );

      case PageTransitionType.fade:
        return FadeRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );

      case PageTransitionType.rotate:
        return RotateRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );

      case PageTransitionType.top:
        return TopBottomRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );

      case PageTransitionType.left:
        return LeftRightRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );

      case PageTransitionType.bottom:
        return BottomTopRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );

      case PageTransitionType.right:
        return RightLeftRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );
      case PageTransitionType.none:
        return NoAnimRouter<Object>(
          page: page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),
        );
      case PageTransitionType.sysDefault:
          return MaterialPageRoute(builder: (_)=> page, settings: RouteSettings(
            name: page.runtimeType.toString(),
            arguments: arguments,
          ),);
    }
  }



  /// @title pop
  /// @description 返回到指定页面(最大返回到init设置的首页) 默认返回上级
  /// @param: type 指定页面
  /// @param: result 返回携带参数
  /// @return void
  /// @updateTime 2022/1/14 6:03 下午
  /// @author 10456
  void pop<T extends Object?>({type, T? result}) {
    if (!navigator!.canPop()) return;
    if (_mRoutes.isEmpty || _mRoutes.last!.settings.name == "/") return;
    if (type == null) {
      navigator!.pop(result);
    } else {
      navigator!.popUntil(
            (Route<dynamic> route) {
          if (route.settings.name == _homePageType) {
            return true;
          } else {
            return type.toString() == route.settings.name;
          }
        },
      );
    }
  }



  /// @title pushRoute
  /// @description 路由切换
  /// @param: route 路由
  /// @param: isReplace 是否替换上级页面
  /// @param: isRemoveUntil 是否切换时删除上级页面
  /// @return Future<Object?>
  /// @updateTime 2022/1/14 6:05 下午
  /// @author 10456
  Future<dynamic> pushRoute(
      Route route, {
        bool isReplace = false,
        bool isRemoveUntil = false,
      }) {
    if (isRemoveUntil) {
      return navigator!
          .pushAndRemoveUntil(route, (route) => false);
    } else if (isReplace) {
      return navigator!.pushReplacement(route);
    } else {
      return navigator!.push(route);
    }
  }


  /// @title pushPage
  /// @description 路由切换
  /// @param: page 页面
  /// @param: isReplace 是否替换上级页面
  /// @param: isRemoveUntil 是否删除上级页面
  /// @param: arguments 路由参数
  /// @return Future<Object?>
  /// @updateTime 2022/1/17 9:55 上午
  /// @author 10456
  Future<Object?> pushPage(
      Widget page, {
        bool isReplace = false,
        bool isRemoveUntil = false,
        Object? arguments,
        PageTransitionType? type,
      }) {
    type ??= _type;
    Route route = routeBuild(page: page, type: _type, arguments: arguments);
    return pushRoute(route, isReplace: isReplace, isRemoveUntil: isRemoveUntil);
  }


  /// @title push
  /// @description 路由切换
  /// @param: routeName 页面名称
  /// @param: arguments 携带参数
  /// @param: isReplace 是否替换上级页面
  /// @param: isRemoveUntil  是否切换时删除上级页面
  /// @return Future<Object?>
  /// @updateTime 2022/1/14 6:06 下午
  /// @author 10456
  Future<Object?> push(
      routeName, {
        Object? arguments,
        bool isReplace = false,
        bool isRemoveUntil = false,
      }) {
    if (isRemoveUntil) {
      return navigator!.pushNamedAndRemoveUntil(
          routeName.toString(), (route) => false,
          arguments: arguments ?? "");
    } else if (isReplace) {
      return navigator!.pushReplacementNamed(routeName.toString(),
          arguments: arguments ?? "");
    } else {
      return navigator!
          .pushNamed(routeName.toString(), arguments: arguments ?? "");
    }
  }

}

/// @description 路由管理
/// @return
/// @updateTime 2022/1/17 9:56 上午
/// @author 10456
class RouteManager extends NavigatorObserver {

  /// 工厂模式创建单例
  factory RouteManager() => _getInstance();
  static RouteManager? _instance;

  RouteManager._internal();

  static RouteManager _getInstance() {
    _instance ??= RouteManager._internal();
    return _instance!;
  }

  /// 当前路由栈
  List<Route?> _mRoutes = [];

  List<BaseRouteOption> _option = [];
  String _homePageType = "";
  PageTransitionType _type = PageTransitionType.none;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _mRoutes.add(route);
    _option.forEach((e) => e.didPush(route, previousRoute));
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _mRoutes.remove(route);
    _option.forEach((e) => e.didPop(route, previousRoute));
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _option.forEach((e) => e.didRemove(route, previousRoute));
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _mRoutes.last = newRoute;
    _option
        .forEach((e) => e.didReplace(newRoute: newRoute, oldRoute: oldRoute));
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    _option.forEach((e) => e.didStartUserGesture(route, previousRoute));
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    _option.forEach((e) => e.didStopUserGesture());
  }
}