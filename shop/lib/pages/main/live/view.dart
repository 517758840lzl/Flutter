import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LivePage extends StatelessWidget {
  LivePage({Key? key}) : super(key: key);

  final logic = Get.find<LiveLogic>();
  final state = Get.find<LiveLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Live",style: TextStyle(fontSize: 30,color: Colors.black),),
    );
  }
}
