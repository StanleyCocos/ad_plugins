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

### 使用 
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
  
二. 控制器显示管理(重写该属性控制展示)
| 参数 | 类型 | 说明 | 
| :-----| :---- | :---- |
| loading | bool | 是否展示加载中 | 
| error | bool | 是否展示页面错误 |
| empty | bool | 是否显示空页面 |
| content | bool | 是否展示内容 |

流程图:
![有度20220128161920](https://user-images.githubusercontent.com/22318878/151511834-da9b30ad-0f50-4f64-b522-acb8270bd31e.png)

  

