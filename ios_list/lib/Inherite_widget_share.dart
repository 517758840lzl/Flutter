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

class LZLHomePage extends StatefulWidget {
  const LZLHomePage({super.key});

  @override
  State<LZLHomePage> createState() => _LZLHomePageState();
}

class _LZLHomePageState extends State<LZLHomePage> {
  int count = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: Center(
        child: LZLShareCount(
          count:count,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showData1(),
              SizedBox(height: 8,),
              showData2(),
            ],),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          count++;
        });
      },child: const Icon(Icons.add),),
    );
  }
}

class showData1 extends StatelessWidget {
  const showData1({super.key});

  @override
  Widget build(BuildContext context) {
    print("showData1 的build方法会重新构建，所以Inherite的of方法不提倡");
    int data = LZLShareCount.of(context)!.count;
    return Container(
        color: Colors.red,
        child: Text("showData1 $data", style: const TextStyle(fontSize: 24),)
    );
  }
}

class showData2 extends StatefulWidget {
  const showData2({super.key});

  @override
  State<showData2> createState() => _showData2State();
}

class _showData2State extends State<showData2> {
  @override
  void didChangeDependencies() {
    print("didChangeDependencies 他所依赖的LZLShare的updateShouldNotify 返回true，会被调用");
  }

  @override
  Widget build(BuildContext context) {
    print("showData2 的build方法会重新构建，所以Inherite的of方法不提倡");
    int data = LZLShareCount.of(context)!.count;
    return Container(
        color: Colors.blue,
        child: Text("showData2 $data", style: const TextStyle(fontSize: 24),)
    );
  }
}


class LZLShareCount extends InheritedWidget {

  int count;

  LZLShareCount({super.key, required Widget child,required this.count}) : super(child: child);

  static LZLShareCount? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LZLShareCount>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
