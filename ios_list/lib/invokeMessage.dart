import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'GlobalKeyDemo.dart';

// flutter create -i swift -a kotlin -t module ios_list
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final MethodChannel _channel =
  const MethodChannel("flynn.AlamofireDemo.orderlist");
  var message = "haha";

  var dict = {"age": 18, "name": "张三"};

  @override
  initState() {
    super.initState();

    print(dict["name"]);
    _channel.setMethodCallHandler((MethodCall call) {
      if (call.method == "showMessage") {
        print(call.arguments.runtimeType);
        print("calll" + call.method);

        print(call.arguments);
        print("flutter--回调结果${call.arguments}");

        var msg = jsonEncode(call.arguments);
        Map<String, dynamic> map = json.decode(msg);
        print("name11 = ${map["name"]}");

        message = map["name"];

        print("message211 = ${message}");
        setState(() {});

        return Future.value(true);
      }
      //这个参数用于反馈给原生端，如果运行出现了问题，那边能通过 callback 监听到回馈
      return Future.value(false); //给一个空Future
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("iOS 与 Flutter的交互"),
        ),
        body: Center(
          // child: Text(message, textDirection: TextDirection.ltr),
          child: GlobalKeyDemo1(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _channel.invokeMethod("showToast", {
              "msg": "我是传递过来的参数",
              "type": 0,
            });
            // _channel.invokeListMethod(method)
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
