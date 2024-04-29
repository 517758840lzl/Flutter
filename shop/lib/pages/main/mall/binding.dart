import 'package:get/get.dart';

import 'logic.dart';

class MallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MallLogic());
  }
}
