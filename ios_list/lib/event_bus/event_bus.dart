
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

main() => runApp(const LZLApp());
// 第一步，先定义event_bus
final event_bus = EventBus();

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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LZLButton(),
            LZLText()
          ],
        ),
      ),
    );
  }
}

class LZLButton extends StatelessWidget {
  const LZLButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print("发生了点击");
          event_bus.fire(UserInfo(name: "我是event_bus发出的消息", age: 18));
        }, child: const Text("点击")
    );
  }
}

class LZLText extends StatefulWidget {
  const LZLText({super.key});

  @override
  State<LZLText> createState() => _LZLTextState();
}

class _LZLTextState extends State<LZLText> {
  String _message = "hello flutter";

  @override
  void initState() {
    // TODO: implement initState
    event_bus.on<UserInfo>().listen((event) {
      print("${event.name}");
      print("${event.age}");
      setState(() {
        _message = '${event.name} ${event.age}';
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}

class UserInfo {
  String name;
  int age;

  UserInfo({required this.name,required this.age});
}



