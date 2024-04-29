import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Dynamic_circlePage extends StatelessWidget {
  Dynamic_circlePage({Key? key}) : super(key: key);

  final logic = Get.find<Dynamic_circleLogic>();
  final state = Get.find<Dynamic_circleLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Dynamic",style: TextStyle(fontSize: 30,color: Colors.black),),
    );
  }
}
