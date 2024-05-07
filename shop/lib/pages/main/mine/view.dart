import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);

  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Mine",style: TextStyle(fontSize: 30,color: Colors.black),),
    );
  }
}
