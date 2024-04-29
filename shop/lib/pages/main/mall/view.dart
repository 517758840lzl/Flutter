import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MallPage extends StatelessWidget {
  MallPage({Key? key}) : super(key: key);

  final logic = Get.find<MallLogic>();
  final state = Get.find<MallLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
