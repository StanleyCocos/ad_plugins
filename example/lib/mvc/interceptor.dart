
import 'package:ad_mvc/state_interceptor.dart';
import 'package:flutter/material.dart';

class MyStateInterceptor implements StateInterface {

  @override
  Color? get backgroundColor => Colors.indigo;

  @override
  Widget? empty(Function onTap) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: GestureDetector(
          onTap: ()=> onTap.call(),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Text("这是自定义的空视图"),
          ),
        ),
      ),
    );
  }

  @override
  Widget? error(Function onTap) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: GestureDetector(
          onTap: ()=> onTap.call(),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Text("这是自定义的错误视图"),
          ),
        ),
      ),
    );
  }

  @override
  Widget? get load {
    return Container(
     width: double.infinity,
     height: double.infinity,
     child: Center(
       child: Container(
         width: 200,
         height: 200,
         color: Colors.red,
         child: Text("这是自定义的加载视图"),
       ),
     ),
   );
  }

  @override
  Widget? get navigation => null;

  @override
  // TODO: implement bottomNavigation
  Widget? get bottomNavigation => throw UnimplementedError();
}


class NavBar extends StatelessWidget implements PreferredSizeWidget {

  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      color: Colors.grey,
      child: Center(
        child: Container(
          width: 200,
          color: Colors.red,
          child: const Text("这是自定义的导航栏视图"),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 96);

}
