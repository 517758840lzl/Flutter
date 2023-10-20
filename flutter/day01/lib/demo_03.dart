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
      appBar: AppBar(title: const Text("Flutter"),),
      body: LZLHomeStateFull(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print("object"),
          child: const Icon(Icons.add)),
    );
  }
}

class LZLHomeContent extends StatelessWidget {

  String name;
  LZLHomeContent(this.name,{super.key}) {
    print("构造函数被调用");
  }

  @override
  Widget build(BuildContext context) {
    print("build 方法被调用");
    return const Center(
      child: Text("hello flutter",style: TextStyle(fontSize: 24),),
    );
  }
}

class LZLHomeStateFull extends StatefulWidget {
  LZLHomeStateFull({super.key}) {
    print("我是 LZLHomeStateFull constroduce ");
  }

  @override
  State<LZLHomeStateFull> createState() {
    print("我是 LZLHomeStateFull createState ");
    return  _LZLHomeStateFullState();
  }
}

class _LZLHomeStateFullState extends State<LZLHomeStateFull> {

  _LZLHomeStateFullState() {
    print("我是 _LZLHomeStateFullState constroduce ");
  }

  @override
  void initState() {
    print("我是initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Text("hello flutter");
  }

  @override
  void dispose() {
    print("我是dispose");
    super.dispose();
  }

}



