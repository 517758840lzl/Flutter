import 'package:flutter/material.dart';

class LZLAboutPage extends StatefulWidget {
  String message = "default message";
  LZLAboutPage(this.message,{super.key});

  @override
  State<LZLAboutPage> createState() => _LZLAboutPageState();
}

class _LZLAboutPageState extends State<LZLAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("关于界面"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => callBack(context),
              child: const Text("点击跳转关于页面"),
            ),
            Text(widget.message),
          ],
        ),
      ),
    );
  }

  void callBack(BuildContext context) {
    String result = "我是about返回 带回的数据";
    Navigator.of(context).pop(result);
  }
}
