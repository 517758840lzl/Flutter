import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SystemOriention {
  // 设置水平方法
  static setHorizontal() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ]);
    }
  }
  /// 设置垂直
  static setVertical() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);
    }
  }
}