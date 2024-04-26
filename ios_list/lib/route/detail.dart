import 'package:flutter/material.dart';

class LZLDetailPage extends StatefulWidget {
  const LZLDetailPage({super.key});

  @override
  State<LZLDetailPage> createState() => _LZLDetailPageState();
}

class _LZLDetailPageState extends State<LZLDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("个人详情页"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => callBack(context),
              child: const Text("点击跳转详情页面"),
            ),
            const Text("个人详情页"),
          ],
        ),
      ),
    );
  }

  void callBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
