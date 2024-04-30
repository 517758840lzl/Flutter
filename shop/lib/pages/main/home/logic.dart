import 'package:get/get.dart';
import 'package:shop/core/router/page_name.dart';

import 'state.dart';

class HomeLogic extends GetxController with RouteName {
  final HomeState state = HomeState();

  void userLogin() {
    Get.toNamed(RouteName.LOGIN);
  }

  void gotoSearch() {
    Get.toNamed("${RouteName.MAIN}${RouteName.SEARCH}");
  }
}
