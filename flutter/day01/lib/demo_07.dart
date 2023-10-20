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

class LZLHomeContent extends StatelessWidget {
  const LZLHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    * start 从左到右
    * center 从中间开始排
    * end 尾部对其原则
    * spaceBetween左右间距为零，中间平分
    * spaceAround 左右的间距是中间的一半
    * spaceEvenly 间距平分
    *
    * Flex布局
    * fit: FlexFit.tight 会将行间距都给到相应的组件上，它的默认值是loose，显示的是原样
    *
    * Expanded
    * flex :1
    * 效果是上面一样的，一般扩充直接使用Expanded。缩放的比例和flex扥大小是有关系的，是按照这里的比例进行划分
    * */
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Container(height: 100,width: 50,color: Colors.red,)
          ),
          Expanded(
              flex: 1,
              child: Container(height: 80,width: 150,color: Colors.orange,)
          ),
          Container(height: 100,width: 80,color: Colors.blue,),
        ]
    );
  }
}


