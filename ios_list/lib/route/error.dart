import 'package:flutter/material.dart';

class LZLErrorPage extends StatelessWidget {
  const LZLErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("错误页面"),),
      body:  const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("页面出错")
          ],
        ),
      ),
    );
  }
}
