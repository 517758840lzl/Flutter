import 'package:flutter/material.dart';

/*
* flutter: widget 的构造方法
* flutter: widget 的createState方法
* flutter: state 的初始化方法
* flutter: state 的initState方法
* flutter: state 的didChangeDependencies方法
* flutter: widgetless 的build方法
*
* BuildContext get context {
    return _element!;
  }
  StatefulElement? _element;
* */
class LZLWidgetFull extends StatefulWidget {

  String? title;

   LZLWidgetFull({super.key, this.title}) {
    print("widget 的构造方法");
  }

  @override
  State<LZLWidgetFull> createState() {
    print("widget 的createState方法");
    return _LZLWidgetFullState();
  }
}

class _LZLWidgetFullState extends State<LZLWidgetFull> {

  _LZLWidgetFullState() {
    print("state 的初始化方法");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("state 的initState方法");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("state 的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("widgetless 的build方法");
    return Scaffold(
      appBar: AppBar(title: Text("widgetfull 的生命周期"),),
      body: Center(
        child: Text(widget.title??"暂未赋值"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        widget.title = "hello Flutter";
        setState(() {});
        context as StatefulElement;

        context.markNeedsBuild();
      },child: Icon(Icons.add),),
    );
  }
}
