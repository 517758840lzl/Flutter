import 'package:get/get.dart';
import 'package:shop/pages/main/binding.dart';
import 'package:shop/pages/main/dynamic_circle/binding.dart';
import 'package:shop/pages/main/home/binding.dart';
import 'package:shop/pages/main/mall/binding.dart';
import 'package:shop/pages/main/mine/binding.dart';
import 'package:shop/pages/main/publish/binding.dart';
import 'package:shop/pages/main/publish/view.dart';
import 'package:shop/pages/main/view.dart';
import 'package:shop/pages/unknown/binding.dart';
import 'package:shop/pages/unknown/view.dart';

class BiliBiliRouter {
  final String initialRoute = "/main";

  final GetPage unKnownPage = GetPage(
      name: "unknown",
      page:() => UnknownPage(),
      binding: UnknownBinding()
  );

  final List<GetPage> getPages = [
    GetPage(
        name: "main",
        page:() => MainPage(),
        // 可以绑定一组
        bindings: [
          MainBinding(),
          HomeBinding(),
          MallBinding(),
          Dynamic_circleBinding(),
          MineBinding()
        ]
    ),
    GetPage(
        name: "publish",
        page:() => PublishPage(),
        binding: PublishBinding()
    ),
  ];
}