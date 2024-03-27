import 'package:flutter/material.dart';
import 'package:get/get.dart'; // 引入依赖包

// 在 MaterialApp 前面加上 "Get"
void main() => runApp(const GetMaterialApp(home: Home()));

// 创建一个控制器
class Controller extends GetxController {
  var count = 0.obs; // 在变量后面加上 'obs', 声明响应式变量

  increment() => count++;
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    // 使用 Get.put() 对我们的控制器进行初始化，之后所有的子 widget 都可以访问到它了
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用 Obx() 方法返回一个 widget, 每当依赖的 c.count 发送变化，widget 都会重新新 build
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        body: const Center(child: Text('get')),
        floatingActionButton: FloatingActionButton(onPressed: c.increment, child: const Icon(Icons.add)));
  }
}