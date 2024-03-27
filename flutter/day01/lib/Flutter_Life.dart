import 'dart:io';

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
      body:  LZLHomeContent("hello flutter"),
    );
  }
}

class LZLHomeContent extends StatefulWidget {
  var  title;
  LZLHomeContent(this.title,{super.key}) {
    print("LZLHomeContent 构造方法");
  }

  @override
  State<LZLHomeContent> createState() {
    print("stlful createState");
    return  _LZLHomeContentState();
  }


}

class _LZLHomeContentState extends State<LZLHomeContent> {

  var count = 0;

  _LZLHomeContentState() {
    print("state 初始化");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("initState方法");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies方法");
  }

  @override
  void didUpdateWidget(covariant LZLHomeContent oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print("didUpdateWidget方法");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("dispose方法");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

    widget.title = "change Content";
  }

  @override
  Widget build(BuildContext context) {
    print("build方法");
    // return Center(
    //   child: Text(widget.title??"",style: TextStyle(fontSize: 24,color: Colors.black,),),
    // );

    return Column(
      children: [
        ElevatedButton(onPressed:() {
          debugPrint("click");
          setState(() {
            count++;
          });
        }, child: const Icon(Icons.add_a_photo)),
        Text("$count")
      ],
    );
  }
}


// class LZLHomeContent extends StatelessWidget {
//   final String? title;
//    LZLHomeContent(this.title,{super.key}) {
//     print("构造方法");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("build方法");
//     return Center(
//       child: Text(title??"",style: TextStyle(fontSize: 24,color: Colors.black,),),
//     );
//   }
// }





