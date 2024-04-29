import 'package:get/get.dart';

import 'logic.dart';

class UnknownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnknownLogic());
  }
}
