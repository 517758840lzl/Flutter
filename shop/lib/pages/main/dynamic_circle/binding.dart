import 'package:get/get.dart';

import 'logic.dart';

class Dynamic_circleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dynamic_circleLogic());
  }
}
