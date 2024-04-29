import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
