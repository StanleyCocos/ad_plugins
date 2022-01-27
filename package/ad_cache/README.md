## 缓存组件

### 简介
1. 偏好设置缓存
2. 数据库缓存

### 引入  
```
ad_cache:
    git:
      url: https://github.com/StanleyCocos/ad_plugins.git
      path: package/ad_cache/
```

### 使用
#### 一. 偏好设置缓存
1. 初始
```
  await SpManager.init();
```

2. 设置缓存
```
SpManager.setBool("name", true);
SpManager.setInt("name", 1);
SpManager.setDouble("name", 0.2);
SpManager.setString("name", "string");
SpManager.setStringList("name", [1, 2, 3]);
```

2. 获取缓存
```
SpManager.getBool("name");
SpManager.getInt("name");
SpManager.getDouble("name", defaultValue: 0);
SpManager.getString("name");
SpManager.getStringList("name");
```

3. 清除缓存
```
SpManager.remove("name");
```

4. 清空缓存
```
await SpManager.clear();
```
#### 二. 数据库

1. 初始化
```
await DBManager.init();
```

2. 创建表
```
class DBTest extends BaseTableModel
```

3. 添加表列属性
```
/// 添加表格属性
  @override
  Map<String, BaseColumn> get map => {
    "age": age,
    "name": name,
    "weight": weight,
    "timestamp": timestamp,
    "datetime": datetime,
    "hobby": hobby,
    "girlfriend": girlfriend,
  };
```
4. 完整表例子
```
/// 所有表都必须继承至 BaseTableModel
class DBTest extends BaseTableModel {


  @override
  BaseTableModel copy() => DBTest();

  /// 添加表格属性
  @override
  Map<String, BaseColumn> get map => {
    "age": age,
    "name": name,
    "weight": weight,
    "timestamp": timestamp,
    "datetime": datetime,
    "hobby": hobby,
    "girlfriend": girlfriend,
  };

  DBTest({int? age, String? name, double? weight, List<int>? hobby, int? girlfriend}){
    this.age.content = age ?? 0;
    this.name.content = name ?? "";
    this.weight.content = weight ?? 0.0;
    timestamp.content = DateTime.now().millisecondsSinceEpoch;
    datetime.content = "2022-01-26";
    this.hobby.content = hobby;
    this.girlfriend.content = girlfriend;
  }


  STInt uId = STInt(canNull: false, primaryKey: true, autoIncrement: true, defaultValue: 200);
  STInt age = STInt(canNull: false);
  STText name = STText(canNull: true);
  STDouble weight = STDouble(canNull: false);
  STTimestamp timestamp = STTimestamp();
  STDatetime datetime = STDatetime();
  STSet hobby = STSet(setList: ["篮球", "足球", "乒乓球", "羽毛球", "跑步"]);
  STEnum girlfriend = STEnum(enumList: ["张三", "李四", "王五", "天线宝宝", "光头强"]);
}
```


5. 保存数据
```
await test1.save();
```

6. 获取数据
```
await DBTest().one(where: "age='14'");
```
7. 删除数据
```
await DBTest().delete(where: "age=18");
```

8. 更新数据
```
await test.update(where: "age='14'");
```

