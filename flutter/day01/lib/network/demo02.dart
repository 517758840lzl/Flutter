import 'package:flutter/material.dart';
import 'package:day01/network/NetWorkTool.dart';

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
      body: const LZLHomeContent(),
    );
  }
}

class LZLHomeContent extends StatefulWidget {
  const LZLHomeContent({super.key});

  @override
  State<LZLHomeContent> createState() => _LZLHomeContentState();
}

class _LZLHomeContentState extends State<LZLHomeContent> {
  String name = "";
  @override
  void initState() {
    RequestManage.request("/api/common/OneFilm").then((value) {
      print("value = $value");
      setState(() {
        name = value['result']['mov_intro'];
      });
      print("name = $name");
    }).onError((error, stackTrace) {
      print("error = $error");
    }).whenComplete(() {
      print("接收完成");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hello flutter $name",style: TextStyle(fontSize: 24),),
    );
  }
}


