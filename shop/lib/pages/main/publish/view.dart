import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PublishPage extends StatelessWidget {
  PublishPage({Key? key}) : super(key: key);

  final logic = Get.find<PublishLogic>();
  final state = Get.find<PublishLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Publish",style: TextStyle(fontSize: 30,color: Colors.black),),
    );
  }
}
