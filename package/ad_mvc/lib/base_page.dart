// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
//
// import 'base.dart';
// import 'base_controller.dart';
//
//
// abstract class BasePage<T extends BaseController> extends StatefulWidget
//     implements PageInterface {
// }
//
// class _BasePageState<T extends BaseController> extends State<BasePage<T>> {
//   late T controller;
//
//   @override
//   Widget build(BuildContext context) {
//     controller.context = context;
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: style,
//       child: ChangeNotifierProvider.value(
//         value: controller,
//         child: Consumer<T>(
//           builder: (context, controller, _) {
//             return renderLayout();
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget get body {
//     switch (controller.switchState()) {
//       case PageStateType.content:
//         return content;
//       case PageStateType.error:
//         return error;
//       case PageStateType.empty:
//         return empty;
//       case PageStateType.loading:
//         return load;
//     }
//   }
//
//   @override
//   Widget get empty => PageStateEmpty(
//     onRetry: controller.loadRetry,
//   );
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
//   Widget get navigation => NavigationBar();
//
//   Color get backgroundColor => Colors.white;
//
//   SystemUiOverlayStyle get style => SystemUiOverlayStyle.dark;
//
//   Widget renderLayout() {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: navigation as PreferredSizeWidget?,
//       body: GestureDetector(
//         onTap: controller.onScreenClick,
//         child: body,
//       ),
//     );
//   }
// }