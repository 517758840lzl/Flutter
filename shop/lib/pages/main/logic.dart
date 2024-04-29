import 'package:get/get.dart';

import '../../core/system/system_orientions.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    SystemOriention.setVertical();
    super.onInit();
  }

  void updateIndex (int i) {
    state.currentIndex = i;
    update();
  }

  // 点击事件
  void tarBarClick(int i) {
    updateIndex(i);
  }
}
