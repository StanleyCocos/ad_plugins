import 'package:ad_mvc/mvc_manager.dart';
import 'package:ad_mvc/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'base.dart';
import 'base_controller.dart';
import 'base_state_widget.dart';

abstract class BasePageState<T extends StatefulWidget, C extends BaseController>
    extends State<T> implements PageInterface, BaseOverrideStatePage<C>{

  @override
  void initState() {
    controller.initLoad();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => controller.widgetDidLoad());
    super.initState();
  }

  @override
  void dispose() {
    controller.widgetDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return renderLayout;
  }

  /// 渲染视图
  Widget get renderLayout {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<C>(
          builder: (context, controller, _) {
            return GestureDetector(
              onTap: controller.onScreenClick,
              child: Scaffold(
                backgroundColor: backgroundColor,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: navigation as PreferredSizeWidget?,
                body: body,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget get body => statePage;

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

  Widget get statePage {
    final state = controller.switchState;
    switch (state) {
      case PageStateType.content:
        return content;
      case PageStateType.loading:
        return load;
      case PageStateType.error:
        return error;
      case PageStateType.empty:
        return empty;
      default:
        return content;
    }
  }

  Color get backgroundColor =>
      MvcManager().interceptor?.backgroundColor ?? Colors.white;

  bool get extendBodyBehindAppBar => false;

  /// 状态栏颜色
  SystemUiOverlayStyle get style => SystemUiOverlayStyle.dark;
}
