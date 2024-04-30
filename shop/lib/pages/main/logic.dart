import 'package:flutter/cupertino.dart';
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

  final currentPage = 0.obs;
  final controller = PageController().obs;

  void showPageWithIndex(int index) {
    state.currentIndex.value = index;
  }

}
