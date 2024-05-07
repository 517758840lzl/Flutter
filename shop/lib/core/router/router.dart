import 'package:get/get.dart';
import 'package:shop/core/router/page_name.dart';
import 'package:shop/pages/main/binding.dart';
import 'package:shop/pages/main/dynamic_circle/binding.dart';
import 'package:shop/pages/main/dynamic_circle/view.dart';
import 'package:shop/pages/main/home/binding.dart';
import 'package:shop/pages/main/home/login/binding.dart';
import 'package:shop/pages/main/home/login/view.dart';
import 'package:shop/pages/main/home/view.dart';
import 'package:shop/pages/main/live/binding.dart';
import 'package:shop/pages/main/live/view.dart';
import 'package:shop/pages/main/mall/binding.dart';
import 'package:shop/pages/main/mall/view.dart';
import 'package:shop/pages/main/mine/binding.dart';
import 'package:shop/pages/main/mine/view.dart';
import 'package:shop/pages/main/publish/binding.dart';
import 'package:shop/pages/main/publish/view.dart';
import 'package:shop/pages/main/search/binding.dart';
import 'package:shop/pages/main/search/view.dart';
import 'package:shop/pages/main/view.dart';
import 'package:shop/pages/tool/webview/binding.dart';
import 'package:shop/pages/tool/webview/view.dart';
import 'package:shop/pages/unknown/binding.dart';
import 'package:shop/pages/unknown/view.dart';

import '../../pages/middle_ware/login_middle_ware.dart';

class BiliBiliRouter with RouteName{

  final GetPage unKnownPage = GetPage(
      name: RouteName.UNKNOWN,
      page:() => UnknownPage(),
      binding: UnknownBinding()
  );

  final List<GetPage> getPages = [
    GetPage(
      name: RouteName.MAIN,
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
          name: RouteName.PUBLISH,
          page:() => PublishPage(),
          binding: PublishBinding(),

          /// 中间件（登录）
          middlewares: [
            LoginAuthMiddleWare(),
          ],
        ),
        GetPage(
            name: RouteName.SEARCH,
            page:() => SearchPage(),
            binding: SearchBinding()
        ),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: RouteName.HOME,
        page:() => HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: RouteName.MALL,
        page:() => MallPage(),
        binding: MallBinding()
    ),
    GetPage(
        name: RouteName.DYNAMIC,
        page:() => Dynamic_circlePage(),
        binding: Dynamic_circleBinding()
    ),
    GetPage(
        name: RouteName.MINE,
        page:() => MinePage(),
        binding: MineBinding()
    ),
    GetPage(
        name: RouteName.LOGIN,
        page:() => LoginPage(),
        binding: LoginBinding()
    ),
    GetPage(
        name: RouteName.LIVE,
        page:() => LivePage(),
        binding: LiveBinding()
    ),
    GetPage(
        name: RouteName.USERAGREEMENT,
        page:() => WebviewPage(),
        binding: WebviewBinding()
    ),
  ];
}