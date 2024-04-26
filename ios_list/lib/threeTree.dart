import 'package:flutter/material.dart';

main() => runApp(const LZLApp());

class StateFullDemo extends StatefulWidget {
  const StateFullDemo({super.key});
  // # git config --global http.proxy 'socks5://127.0.0.1:7890'
  //   git config --global https.proxy 'socks5://127.0.0.1:7890'
  // # git config --global all.proxy 'socks5://127.0.0.1:7890'

  @override
  State<StateFullDemo> createState() => _StateFullDemoState();
}

class _StateFullDemoState extends State<StateFullDemo> {
  @override
  Widget build(BuildContext context) {
    // this.widget

    return const Placeholder();
  }
}


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
        onPressed: () => future5(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class LZLHomeContent extends StatelessWidget {
  const LZLHomeContent({super.key});


  @override
  Widget build(BuildContext context) {
    // Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(createRenderObject)
    // Padding(createRenderObject) -> RenderPadding -> RenderShiftedBox -> RenderBox -> RenderObject
    // Container()
    // ComponentElement -> mount -> firstBuild -> reBuild -> performRebuild -> build -> _widget.build(this)

    return const Center(


      child: Text(
        "hello flutter",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

void createStream(BuildContext context) {
  Future future = Future(() {
    print('我是第一个future'); //1
  });
  future.then((value) => print('我是future的then')); //2
  print('future1方法体'); //3
}

void createFuture(BuildContext context) async {
  // 使用async/await之后，后面所有的都会暂停执行，需等待当前的future执行完成之后才会执行
  Future future = Future(() {
    print('我是第一个future'); //1
  });
  await future;
  future.then((value) => print('我是future的then')); //2
  print('future1方法体'); //3
}

void future3() {
  Future future3 = Future(() {
    print('我是future3'); //3
  });

  Future future2 = Future(() {
    print('我是future2'); //2
  });

  Future future1 = Future(() {
    print('我是future1'); //1
  });

  future1.then((value) => print('我是future1的then')); //6
  future3.then((value) => print('我是future3的then')); //4
  future2.then((value) => print('我是future2的then')); //5

  //print:162534
}

void future4() {
  /*
  * Future中嵌套Future，嵌套的Future是不受第一个Future的影响
  * 第一个Future也不会影响第二个Future
  * */
  Future future1 = Future(() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      print('我是future1');
    }); //1;
  });
  Future future2 = Future(() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      print('我是future2');
    }); //2;
  });
  Future future3 = Future(() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      print('我是future3');
    }); //3;
  });
  future3.then((value) => print('我是future3的then')); //4
  future2.then((value) => print('我是future2的then')); //5
  future1.then((value) => print('我是future1的then')); //6
  //print:654321
}

/**
 *
 * Future.wait 可以相当于group、添加任务的依赖，所有的执行完毕之后才回去执行Future.wait。then函数
 * 而wait中函数是async执行的，
 */
void future5() {
  Future.wait([test1(), test2()]).then((value) {
    print(value[0]); //3
    print(value[1]); //4
  });
}

Future<String> test1() async {
  return Future.delayed(const Duration(milliseconds: 1500)).then((value) {
    print('test1执行完毕'); //1
    return '我是test1字符串';
  });
}

Future<String> test2() async {
  return Future.delayed(const Duration(milliseconds: 500)).then((value) {
    print('test2执行完毕'); //2
    return '我是test2字符串';
  });
}
