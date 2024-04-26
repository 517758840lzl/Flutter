import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/binding_demo/Config.dart';
import 'package:getx_demo/binding_demo/binding_one_page/view.dart';


// 在 MaterialApp 前面加上 "Get"
void main() => runApp(GetMaterialApp(
  initialRoute: RouteConfig.testOne,
  getPages: RouteConfig.getPages,
));


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {

    return BindingOnePagePage();
  }
}
