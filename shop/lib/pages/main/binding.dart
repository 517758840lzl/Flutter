import 'package:get/get.dart';
import 'package:shop/pages/main/publish/logic.dart';

import 'logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => PublishLogic());
  }
}
