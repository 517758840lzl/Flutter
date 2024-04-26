import 'package:flutter/material.dart';

/*
* print 结果
* flutter: widgetless 的构造方法
* flutter: widgetless 的build方法
*
* */
class LZLWidgetless extends StatefulWidget {
  LZLWidgetless({super.key}) {
    print("widgetless 的构造方法");
  }
  @override
  State<LZLWidgetless> createState() => _LZLWidgetlessState();
}

class _LZLWidgetlessState extends State<LZLWidgetless> {
  @override
  Widget build(BuildContext context) {
    print("widgetless 的build方法");
    return const Center(
      child: Text("hello"),
    );
  }
}
