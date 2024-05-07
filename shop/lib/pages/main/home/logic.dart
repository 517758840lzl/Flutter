import 'package:get/get.dart';
import 'package:shop/core/router/page_name.dart';
import 'package:shop/pages/middle_ware/login_middle_ware.dart';

import 'state.dart';

class HomeLogic extends GetxController with RouteName {
  final HomeState state = HomeState();

  void userLogin() {
    LoginWidget().goToLogin();
  }

  void gotoSearch() {
    Get.toNamed("${RouteName.MAIN}${RouteName.SEARCH}");
  }
}
