import 'package:flutter/material.dart';

main() => runApp(const LZLApp());

class LZLApp extends StatelessWidget {
  const LZLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LZLHomePage(),
    );
  }
}

class LZLHomePage extends StatefulWidget {

  LZLHomePage({super.key});

  @override
  State<LZLHomePage> createState() => _LZLHomePageState();
}

class _LZLHomePageState extends State<LZLHomePage> {
  List<Widget> list = [LZLHomeContent()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            list.add(const Text("hello world"));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LZLHomeContent extends StatefulWidget {
  LZLHomeContent({super.key}) {
    print("1.我是LZLHomeContent的构造器");
  }

  @override
  State<LZLHomeContent> createState() {
    print("2.我是createState的方法");
    return _LZLHomeContentState("hello");
  }
}

class _LZLHomeContentState extends State<LZLHomeContent> {

  String name;
  _LZLHomeContentState(this.name) {
    print("3._LZLHomeContentState of 构造器");
  }

  @override
  void initState() {
    print("4._LZLHomeContentState of initState");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("5._LZLHomeContentState of build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                name += "world";
              });
            },
            icon: const Icon(Icons.face)
        ),
        const Center(
          child: Text("hello flutter",style: TextStyle(fontSize: 24),),
        ),
      ],
    );
  }

  @override
  void dispose() {
    print("6._LZLHomeContentState of dispose");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("_LZLHomeContentState of didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LZLHomeContent oldWidget) {
    print("_LZLHomeContentState of didUpdateWidget 父类视图改变后才会改变");
    super.didUpdateWidget(oldWidget);
  }
}


