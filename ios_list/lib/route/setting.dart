import 'package:flutter/material.dart';

class LZLSettingPage extends StatefulWidget {
  LZLSettingPage({super.key});

  @override
  State<LZLSettingPage> createState() => _LZLSettingPageState();
}

class _LZLSettingPageState extends State<LZLSettingPage> {

  
  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置页面"),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () => callBack(context),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => callBack(context),
              child: const Text("点击跳转设置页面"),
            ),
            Text(message,style: const TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }

  void callBack(BuildContext context) {
    String result = "我是设置页面返回 带回的数据";
    Navigator.of(context).pop(result);
  }
}
