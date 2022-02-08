import 'package:ad_mvc/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'base_controller.dart';
import 'base_state_widget.dart';
import 'mvc_manager.dart';
import 'navigation_bar.dart';

abstract class BaseBodyPage<T extends BaseController> extends StatelessWidget
    implements PageInterface {
  late T controller;

  BaseBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<T>(
          builder: (context, controller, _) {
            return renderLayout();
          },
        ),
      ),
    );
  }

  @override
  Widget get body {
    switch (controller.switchState) {
      case PageStateType.content:
        return content;
      case PageStateType.error:
        return error;
      case PageStateType.empty:
        return empty;
      case PageStateType.loading:
        return load;
    }
  }

  @override
  Widget get empty {
    return MvcManager().interceptor?.empty(controller.loadRetry) ??
        PageStateEmpty(onRetry: controller.loadRetry);
  }

  @override
  Widget get error {
    return MvcManager().interceptor?.error(controller.loadRetry) ??
        PageStateRequestError(
          onRetry: controller.loadRetry,
        );
  }

  @override
  Widget get load => MvcManager().interceptor?.load ?? const PageStateLoad();

  @override
  Widget? get navigation => MvcManager().interceptor?.navigation ?? NavBar();

  Color get backgroundColor =>
      MvcManager().interceptor?.backgroundColor ?? Colors.white;

  SystemUiOverlayStyle get style => SystemUiOverlayStyle.dark;

  Widget renderLayout() {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: GestureDetector(
        onTap: controller.onScreenClick,
        child: body,
      ),
    );
  }
}