import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get__r_x_demo/view.dart';
import 'get_x_demo/view.dart';
import 'getx_model/view.dart'; // 引入依赖包

// 在 MaterialApp 前面加上 "Get"
void main() => runApp(const GetMaterialApp(home: Home()));

/*
* Obx 是配合 Rx 响应式变量使用、GetBuilder 是配合 update 使用：请注意，这完全是俩套定点刷新控件的方案

区别：前者响应式变量变化，Obx 自动刷新；后者需要使用 update 手动调用刷新

一般来说，对于大多数场景都是可以使用响应式变量的

但是，在一个包含了大量对象的 List，都使用响应式变量，将生成大量的GetStream，必将对内存造成较大的压力，该情况下，就要考虑使用简单状态管理了

总的来说：推荐 GetBuilder 和 update 配合的写法

GetBuilder 内置回收 GetxController 的功能，能避免一些无法自动回收 GetxController 的坑爹问题

使用GetBuilder的自动回收：GetBuilder需要设置assignId: true；或使用插件一键Wrap Widget：GetBuilder（Auto Dispose）

使用 Obx，相关变量定义初始化以及实体更新和常规写法不同，会对初次接触该框架的人，造成很大的困扰
* */
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {

    return GetxModelPage();
  }
}
