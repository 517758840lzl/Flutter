import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UnknownPage extends StatelessWidget {
  UnknownPage({Key? key}) : super(key: key);

  final logic = Get.find<UnknownLogic>();
  final state = Get.find<UnknownLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("错误页面",style: TextStyle(fontSize: 30,color: Colors.black),),
      ),
    );
  }
}
