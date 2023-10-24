import 'package:day01/network/NetWorkTool.dart';
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
  @override
  var name = "";
  void initState() {
    // TODO: implement initState
    super.initState();

    RequestManage.request("/get",params: {'name':"我是参数名称",'age':'18'}).then((value) {
      print("value1 = ${value['args']}");
      setState(() {
        name = value['args']['age'];
      });
      print("name = $name");
    }).onError((error, stackTrace) {
      print("error = $error");
    }).whenComplete(() {
      print("接收完成");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hello flutter $name",style: TextStyle(fontSize: 24),),
    );
  }
}


