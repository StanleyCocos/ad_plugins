## flutter mvc 架构

### 简介
1. 统一风格
2. 管理状态
3. 封装常用方法
4. 封装上拉加载 下拉刷新
5. 显示管理等


### 引入  
```
ad_cache:
    git:
      url: https://github.com/StanleyCocos/ad_plugins.git
      path: package/ad_mvc/
```

### 初始化
```
/// 初始化MVC架构
  MvcManager().init(
    /// 状态视图拦截器 (加载视图，空视图，错误视图)
    interceptor: MyStateInterceptor(),

    /// 给列表页上拉加载 下拉刷新使用 后端接口分页数据的key
    page: "page",
    pageSize: "size",
  );
```
拦截器统一设定相应的状态页面
```
/// 页面状态视图
abstract class StateInterface {

  /// 错误
  Widget? error(Function onTap);

  /// 空
  Widget? empty(Function onTap);

  /// 加载
  Widget? get load;

  /// 导航栏
  Widget? get navigation;

  /// 背景颜色
  Color? get backgroundColor;
}
```
一. 继承 
1.  model 
  ```
  Model extends BaseModel
  ```
  2. page 
  ```
  State extends BasePageState<StatefulWidget, BaseController>
  ```
  3. controller
  ```
  Controller extends BaseController<Model1>
  ```

### 控制器使用   
  
一. 控制器显示管理(重写该属性控制展示)
| 属性名 | 类型 | 说明 | 
| :-----| :---- | :---- |
| loading | bool | 是否展示加载中 | 
| error | bool | 是否展示页面错误 |
| empty | bool | 是否显示空页面 |
| content | bool | 是否展示内容 |


流程图:
![有度20220128161920](https://user-images.githubusercontent.com/22318878/151511834-da9b30ad-0f50-4f64-b522-acb8270bd31e.png)



二. 常用属性
| 属性名 | 类型 | 说明 | 
| :-----| :---- | :---- |
| context | BuildContext | 上下文(页面会自动设定) | 
| isHideKeyboard | bool | 是否需要控制点击屏幕任意位置隐藏键盘 默认: ture |
| isLoadFirst | bool | 是否第一次加载(默认: true, 根据可以手动修改) |
| isLoadError | bool | 是否网络错误, 设置true后 刷新会展示错误页面 |
| refreshController | EasyRefreshController | 上拉加载下拉属性控制器(BaseListController属性，基于flutter_easyrefresh) | 
| loadPage | int | 分页 页码 (BaseListController属性，可以初始化调整value)|
| pageSize | int | 分页数量 (BaseListController属性，可以初始化调整value)|
| loadApi | String | 分页请求接口(BaseListController属性) |
| params |  Map<String, dynamic> | 请求参数(BaseListController属性) |
| data | BaseBean | 请求结果解析器(BaseListController属性) |
| requestOptions | Options | 请求额外配置参数(BaseListController属性) |




三. 常用方法 
| 方法名 | 参数 | 说明 | 
| :-----| :---- | :---- |
| widgetDidLoad | 无 | 视图渲染完成调用(只调用一次) | 
| widgetDispose | 无 | 视图销毁调用(只调用一次) |
| initLoad | 无 | 进入页面（widgetDidLoad之前）调用(只调用一次) |
| initRouteArguments | 无 | 初始化路由参数 |
| onNavigationBackClick | 无 | 当前路由点击后退上也页面 | 
| loadRetry | 无 | 空页面 错误页面 点击回调 |
| getArgument | 参数名称 | 获取路由参数 |
| push | Page | 切换页面 |
| pop |  指定页面，返回参数 | 返回指定页面(默认返回上级页面) |
| hideLoading | 无 | 隐藏load加载弹框 |
| showLoading | 显示文本 | 显示加载圈 |
| toast | 显示文本 | 显示Toast |


四. 列表控制器常用方法
| 方法名 | 参数 | 说明 | 
| :-----| :---- | :---- |
| loadListData | 无 | 刷新调用 | 
| loadListDataMore | 无 | 加载调用 |
| loadBegin | 无 | 加载之前调用(这里可以设定参数) |
| loadSuccess | 无 | 请求成功 |
| loadError | 无 | 请求错误 | 
| loadCommon | 无 | 请求成功失败都会调用 |
| addParams | Map<String, dynamic> params | 设定参数 |



### page使用
一. 无需重载build方法
二. 属性介绍  
| 方法名 | 参数 | 说明 | 
| :-----| :---- | :---- |
| backgroundColor | Color | 背景颜色 | 
| extendBodyBehindAppBar | bool | 内容是否置顶 去掉导航栏的高度 |
| style | SystemUiOverlayStyle | 状态栏颜色 |
| load | Widget | 加载页面（这里会覆盖初始设定的load Page ） |
| error | Widget | 错误页面（这里会覆盖初始设定的error Page ） | 
| empty | Widget | 空页面 （这里会覆盖初始设定的empty Page ） |
| navigation | Widget | 导航栏（这里会覆盖初始设定的navigation Page ） |




