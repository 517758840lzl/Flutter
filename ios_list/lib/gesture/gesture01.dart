import 'package:flutter/material.dart';

main() => runApp(const LZLApp());
/*
* 当一个Container嵌套一个Container，外层Container设置了200*200的大小，内层Container设置100*100的大小，内层的Container会
* 扩大到跟外层一样的大小。
* 可以有多中途径去解决这个问题，可以在内层嵌套一个Align，这种就不是Container的嵌套关系了，而是Align包裹着Container
* 这种方法比较笨重，我们可以直接进build方法里查看，看到如果我们传递了alignment之后，他会在构造方法里自动进行Align的包裹
* 所以最直接的方式是传递alignment。
*
* 多层的嵌套还有一个问题，就是事件的穿透，我在两个Container都定义点击事件的话，点击最内层的Container，偶尔会发出生，外层Container
* 也会被点击的现象，这种如何去解决？
*
* 我们可以通过Stack来嵌套解决这种现象，让两个Container成为同级的状态，这样就不会出现事件的穿透。
*
* IgnorePointer 可以直接忽略事件的点击，让事件直接进行穿透。
* */
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
      appBar: AppBar(title: const Text("Flutter"),),
      body: const LZLHomeContent(),
    );
  }
}

class LZLHomeContent extends StatelessWidget {
  const LZLHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (detail) {
              print("outer 点击");
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
              alignment: Alignment.center,
            ),
          ),
          // Positioned(
          //   child: GestureDetector(
          //   onTapDown: (detail) {
          //     print("inner 点击");
          //   },
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.yellow,
          //   ),
          // ),
          //   left: 50,
          //   top: 50,
          // ),
          IgnorePointer(
            child: GestureDetector(
              onTapDown: (detail) {
                print("inner 点击");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


