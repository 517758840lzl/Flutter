import 'package:get/get.dart';
import 'package:shop/pages/main/home/login/logic.dart';
import 'package:shop/pages/main/live/logic.dart';
import 'package:shop/pages/main/publish/logic.dart';
import 'package:shop/pages/main/search/logic.dart';
import 'package:shop/pages/main/search/view.dart';

import 'logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => SearchLogic());
    Get.lazyPut(() => PublishLogic());
    Get.lazyPut(() => LoginLogic());
    Get.lazyPut(() => LiveLogic());
  }
}
