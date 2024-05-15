import 'package:ad_cache/ad_cache.dart';
import 'package:ad_cache/db/db_manager.dart';
import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_network/ad_network.dart';
import 'package:ad_plugins/cache_test/cache_sp_page.dart';
import 'package:ad_plugins/mvc/interceptor.dart';
import 'package:ad_plugins/network/my_http_request_error.dart';
import 'package:ad_plugins/network/network_test_page.dart';
import 'package:ad_plugins/route/RouteOption.dart';
import 'package:ad_plugins/route/route1/route_page1.dart';
import 'package:ad_route/ad_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'cache_test/cache_db_page.dart';
import 'mvc/page1/page1.dart';
import 'network/network_interceptors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始偏好缓存模块
  await SpManager.init();

  // / 初始化数据库模块
  // await DBManager.init();

  /// 初始网络请求模块
  HttpRequest().init(
    HttpRequestSetting(
      baseUrl: "",
      connectTimeOut: 15,
      receiveTimeOut: 15,
      interceptors: [
        MyInterceptors(),
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      ],
      rearInterceptor: MyHttpRequestError(),
    ),
  );

  /// 初始化MVC架构
  MvcManager().init(
    /// 状态视图拦截器 (加载视图，空视图，错误视图)
    interceptor: MyStateInterceptor(),

    /// 给列表页上拉加载 下拉刷新使用 后端接口分页数据的key
    page: "page",
    pageSize: "size",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorObservers: [
        /// 路由管理初始化
        RouteManager()
          ..init(
            homeName: "MyApp",
            options: [RouteOptions()],
          ),
      ],

      /// 这里需要初始一下 才能使用loading 插件
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listData = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listData = [
      "Preferences 缓存",
      "Sqllite 缓存",
      "网络请求",
      "mvc1",
      "route"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onListTap(index),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Text(listData[index]),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              color: Colors.grey,
              indent: 20,
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onListTap(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CacheSpPage()));
        break;
      case 1:
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => CacheDBPage()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NetworkPage()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Page1()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RoutePage1()));
        break;
      default:
        break;
    }
  }
}
