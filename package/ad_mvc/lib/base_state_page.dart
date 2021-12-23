// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
//
// import 'base.dart';
// import 'base_controller.dart';
// import 'base_state_widget.dart';
//
// abstract class BasePageState<T extends StatefulWidget, C extends BaseController>
//     extends State<T> implements PageInterface {
//
//   late C controller;
//
//   @override
//   void initState() {
//     controller.initLoad();
//     WidgetsBinding.instance!
//         .addPostFrameCallback((_) => controller.widgetDidLoad());
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.widgetDispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.context = context;
//     return renderLayout();
//   }
//
//   Widget get body {
//     return statePage;
//   }
//
//   Widget get statePage {
//     final state = controller.switchState();
//     switch (state) {
//       case PageStateType.content:
//         return content;
//       case PageStateType.loading:
//         return load;
//       case PageStateType.error:
//         return error;
//       case PageStateType.empty:
//         return empty;
//     }
//   }
//
//   @override
//   Widget get empty => PageStateEmpty(onRetry: controller.loadRetry);
//
//   @override
//   Widget get error {
//     if (NetworkState().state == ConnectivityResult.none) {
//       return PageStateNetWorkError(
//         onRetry: controller.loadRetry,
//       );
//     } else {
//       return PageStateRequestError(
//         onRetry: controller.loadRetry,
//       );
//     }
//   }
//
//   @override
//   Widget get load => PageStateLoad();
//
//   @override
//   Widget? get navigation => NavigationBar();
//
//   Color get backgroundColor => Colors.white;
//
//   bool get extendBodyBehindAppBar => false;
//
//   /// 状态栏颜色
//   SystemUiOverlayStyle get style => SystemUiOverlayStyle.dark;
//
//   /// 渲染视图
//   Widget renderLayout() {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: style,
//       child: ChangeNotifierProvider.value(
//         value: controller,
//         child: Consumer<C>(
//           builder: (context, controller, _) {
//             return Scaffold(
//               backgroundColor: backgroundColor,
//               extendBodyBehindAppBar: extendBodyBehindAppBar,
//               appBar: navigation as PreferredSizeWidget?,
//               body: body,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }