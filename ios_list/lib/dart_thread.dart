import 'dart:async';

import 'package:flutter/material.dart';

main() => runApp(const LZLApp());

class LZLApp extends StatelessWidget {
  const LZLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LZLHomePage(),
    );
  }
}

class LZLHomePage extends StatelessWidget {
  const LZLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: const LZLHomeContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => testZone(),
        child: const Icon(Icons.present_to_all),
      ),
    );
  }
}

class LZLHomeContent extends StatelessWidget {
  const LZLHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "hello flutter",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

void loadJson(BuildContext context) {
  var result = DefaultAssetBundle.of(context).loadString("assets/book.json");

  Future(() {
    // 可以添加一些耗时的操作，但是dart的机制决定了是单线程执行机制，所以如果这个过程是十分的耗时，那么还是会发现很卡顿，，如果真正的想开启
    // 线程，需要用到compute。为什么系统的网络请求以及IO操作不会出现这种情况，主要是dart会调用系统的多线程机制进行操作，然后把结果拿到
    print("result = ${result}");
  }).then((value) => {});

  // async、await是可以表示异步执行，但是不开辟新线程

  // compute 在底层会生成isolates，isolates相当于沙盒机制，不同的线程之间数据是不共享的
  // compute((message) => null, message)
}

void testZone() async {
  try {
    print(Zone.current);
    throw "My Error";
  } catch (e) {
    print(e);
  }

  try {
    await Future.error("My Future Error");
  } catch (e) {
    print(e);
  }
}
