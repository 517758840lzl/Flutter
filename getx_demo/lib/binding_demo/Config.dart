import 'package:getx_demo/binding_demo/binding_one_page/binding.dart';
import 'package:getx_demo/binding_demo/binding_one_page/view.dart';
import 'package:getx_demo/binding_demo/binding_two_page/binding.dart';
import 'package:getx_demo/binding_demo/binding_two_page/view.dart';

import 'package:get/get.dart';

class RouteConfig {
  static const String testOne = "/testOne";
  static const String testTwo = "/testTwo";

  static final List<GetPage> getPages = [
    GetPage(
      name: testOne,
      page: () => BindingOnePagePage(),
      binding: BindingOnePageBinding(),
    ),
    GetPage(
      name: testTwo,
      page: () => BindingTwoPagePage(),
      binding: BindingTwoPageBinding(),
    ),
  ];
}
