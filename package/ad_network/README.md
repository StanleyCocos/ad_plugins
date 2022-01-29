## flutter网络请求封装

### 简介
基于dio封装多种请求方式
支持 post get put patch delete等请求方式
提供json安全解析功能


### 引入  
```
ad_network:
    git:
      url: https://github.com/StanleyCocos/ad_plugins.git
      path: package/ad_network/
```

### 初始化
```
/// 初始网络请求模块
  HttpRequest().init(
    HttpRequestSetting(
      baseUrl: "",
      connectTimeOut: 15,
      receiveTimeOut: 15,
      /// 请求拦截器
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
      /// 错误拦截器
      errorHandle: MyHttpRequestError(),
    ),
  );
```

### 使用
1. get 
```
 HttpRequest().get("url", params: {}, callBack: (data){});
```

2. post 
```
 HttpRequest().post("url", params: {}, callBack: (data){});
```
