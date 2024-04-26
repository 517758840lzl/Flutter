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
*
* AbsorbPointer 完全忽略点击事件，不会向IgnorePointer只是忽略自生包裹的widget，事件任然可以继续传递。AbsorbPointer完全忽略
*
*  事件传递：
*  IgnorePointer：当IgnorePointer包装的子组件处于活动状态时，它将忽略（不处理）所有的指针事件，但仍然会将这些事件传递给子组件。换句话说，子组件仍然可以接收到指针事件，但不会对这些事件做出响应。
*  AbsorbPointer：当AbsorbPointer包装的子组件处于活动状态时，它将吸收（阻止）所有的指针事件，使得子组件无法接收到这些事件，即使它们被传递给了子组件。
*  透明度：
*  IgnorePointer：不影响子组件的外观，即子组件在IgnorePointer包装下仍然可以呈现为活动状态，如按钮可以显示为可点击状态，但实际上不可点击。
*  AbsorbPointer：AbsorbPointer会使子组件看起来处于禁用状态，因为它会阻止子组件接收到指针事件，因此子组件在AbsorbPointer包装下不会显示为活动状态。
*  用途：
*  IgnorePointer：通常用于在特定情况下暂时禁用用户交互，但仍然希望保持子组件的外观不变，或者用于在指定区域内忽略触摸事件。
*  AbsorbPointer：通常用于完全阻止指定区域内的用户交互，使得子组件无法接收到指针事件。
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
      child: AbsorbPointer(
        absorbing: false,
        child: GestureDetector(
          onTapDown: (detail) {
            print("outer 点击");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            alignment: Alignment.center,
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
        ),
      ),
    );
  }
}


