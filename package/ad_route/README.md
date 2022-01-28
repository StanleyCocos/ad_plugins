## flutter 路由管理

### 简介
支持命名路由和创建路由两种方式，同时添加于mvc的控制中

### 引入
```
ad_cache:
    git:
      url: https://github.com/StanleyCocos/ad_plugins.git
      path: package/ad_route/
```

### 初始化
```
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
            /// 首页名称，防止指定返回的时候 返回到最开始路由
            homeName: "MyApp",
            /// 路由生命周期回调
            options: [RouteOptions()],
          ),
      ],
    );
```

### 使用
1. push
```
RouteManager().pushPage(RoutePage2(), arguments: {"id": 2}).then((value){
  print("接收下个页面回传的值: $value");
});
```

2. pop
```
pop(result: "ok");
```


