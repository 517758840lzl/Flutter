import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shop/core/router/router.dart';

import 'core/router/page_name.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
main() => runApp(LZLApp());

class LZLApp extends StatelessWidget {
  LZLApp({super.key});

  final router = BiliBiliRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.MAIN,
        getPages: router.getPages,
        unknownRoute: router.unKnownPage,
        /// 全局去除水波纹
        theme: ThemeData(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),

        ///smartDialog 插件需要初始化
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}




