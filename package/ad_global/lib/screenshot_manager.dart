import 'package:screenshot_callback/screenshot_callback.dart';

extension ScreenshotOption on ScreenshotManager {
  /// @title init
  /// @description 初始截屏监听
  /// @param: callback 主监听 移除时该回调不印象
  /// @return void
  /// @updateTime 2022/1/26 11:56 上午
  /// @author 10456
  void init(Function? callback) {
    _mainCallback = callback;
    screenshotCallback.addListener(
      () {
        _mainCallback?.call();
        _callback?.call();
      },
    );
  }

  /// @title cancel
  /// @description 移除截屏通知
  /// @return void
  /// @updateTime 2022/1/26 11:54 上午
  /// @author 10456
  void cancel() {
    _callback = null;
  }

  /// @title add
  /// @description 添加截屏通知
  /// @param: callback
  /// @return void
  /// @updateTime 2022/1/26 11:55 上午
  /// @author 10456
  void add(Function callback) {
    _callback = callback;
  }
}

class ScreenshotManager {
  static ScreenshotManager? _instance;

  factory ScreenshotManager() {
    _instance ??= ScreenshotManager._();
    return _instance!;
  }

  late ScreenshotCallback screenshotCallback;
  Function? _callback;
  Function? _mainCallback;

  ScreenshotManager._() {
    screenshotCallback = ScreenshotCallback();
  }
}
