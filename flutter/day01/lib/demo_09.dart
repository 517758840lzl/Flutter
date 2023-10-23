import 'dart:math';
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
    return GridViewBuild();
  }
}

class GridViewBuild extends StatelessWidget {
  const GridViewBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 水平方向上加间距
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        // 仍然仿造的OC中的代理方式
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          itemCount: 100,
          itemBuilder: (content,index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
            );
          }),
    );
  }
}

class GridViewDefalut extends StatelessWidget {
  const GridViewDefalut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
        );
      }),
    );
  }
}

class ListBuild extends StatelessWidget {
  const ListBuild({
    super.key,
  });

  /*
  * ListView.builder的含义会按需加载要显示的ListTile，不会向默认构造器一样，一次性加载所以有的数据
  *就性能方面而言是远高于默认构造器
  * */
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        padding: EdgeInsets.all(8),
        itemBuilder: (content,index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("people contact list $index"),
            subtitle: Container(
                padding: EdgeInsets.only(top: 10),
                child: Text("Tel:18942343243")
            ),
            trailing: Container(
              width: 100,
              child: IconButton(
                icon: Text("Click me"),
                onPressed: () {
                  print("object");
                },
              ),
            ),
          );
        });
  }
}

/*
* ListView 的默认构造器
* 这种场景只是适合数据量较小的时候，因为这个默认构造器会根据count的个数会一次性的创建出
* ListTile的个数，如果数据量非常的大是非常的消耗性能的，所以再日常开发中不建议使用
* */
class ListDefaultConstrutor extends StatelessWidget {
  const ListDefaultConstrutor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 64,
      children: List.generate(100, (index) {
        return ListTile(
          trailing: Icon(Icons.delete),
          title: Text("contact people ${index+1}"),
          subtitle: Text("133438439045"),
          leading: Icon(Icons.people),
        );
      }),
    );
  }
}



