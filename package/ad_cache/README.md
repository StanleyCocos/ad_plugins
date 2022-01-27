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
#### 偏好设置缓存
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
```
