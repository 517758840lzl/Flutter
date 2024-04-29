import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MallPage extends StatelessWidget {
  MallPage({Key? key}) : super(key: key);

  final logic = Get.find<MallLogic>();
  final state = Get.find<MallLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Mall",style: TextStyle(fontSize: 30,color: Colors.black),),
    );
  }
}
