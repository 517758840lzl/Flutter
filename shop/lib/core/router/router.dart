import 'package:get/get.dart';
import 'package:shop/pages/main/binding.dart';
import 'package:shop/pages/main/dynamic_circle/binding.dart';
import 'package:shop/pages/main/dynamic_circle/view.dart';
import 'package:shop/pages/main/home/binding.dart';
import 'package:shop/pages/main/home/login/binding.dart';
import 'package:shop/pages/main/home/login/view.dart';
import 'package:shop/pages/main/home/view.dart';
import 'package:shop/pages/main/mall/binding.dart';
import 'package:shop/pages/main/mall/view.dart';
import 'package:shop/pages/main/mine/binding.dart';
import 'package:shop/pages/main/mine/view.dart';
import 'package:shop/pages/main/publish/binding.dart';
import 'package:shop/pages/main/publish/view.dart';
import 'package:shop/pages/main/search/binding.dart';
import 'package:shop/pages/main/search/view.dart';
import 'package:shop/pages/main/view.dart';
import 'package:shop/pages/unknown/binding.dart';
import 'package:shop/pages/unknown/view.dart';

class BiliBiliRouter {
  final String initialRoute = "/main";

  final GetPage unKnownPage = GetPage(
      name: "/unknown",
      page:() => UnknownPage(),
      binding: UnknownBinding()
  );

  final List<GetPage> getPages = [
    GetPage(
        name: "/main",
        page:() => MainPage(),
        // 可以绑定一组
        bindings: [
          MainBinding(),
          HomeBinding(),
          MallBinding(),
          Dynamic_circleBinding(),
          MineBinding(),
        ],
        children: [
          GetPage(
              name: "/publish",
              page:() => PublishPage(),
              binding: PublishBinding()
          ),
          GetPage(
              name: "/search",
              page:() => SearchPage(),
              binding: SearchBinding()
          ),
        ],
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: "/home",
        page:() => HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: "/mall",
        page:() => MallPage(),
        binding: MallBinding()
    ),
    GetPage(
        name: "/dynamic",
        page:() => Dynamic_circlePage(),
        binding: Dynamic_circleBinding()
    ),
    GetPage(
        name: "/mine",
        page:() => MinePage(),
        binding: MineBinding()
    ),
    GetPage(
        name: "/login",
        page:() => LoginPage(),
        binding: LoginBinding()
    ),
  ];
}