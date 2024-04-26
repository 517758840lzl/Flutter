import 'package:flutter/material.dart';
import 'package:ios_list/view_model.dart';
import 'package:provider/provider.dart';

/*
*
* Provider.of 刷新机制是整个build方法都会被刷新
* Consumer者不会整个widget的build方法进行刷新，而是基于自己的builder方法进行刷新，所以它是尽可能少的刷新
* */
main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => shareData(),
      child: const LZLApp(),
    ),
  );
}

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

class LZLHomePage extends StatefulWidget {
  const LZLHomePage({super.key});

  @override
  State<LZLHomePage> createState() => _LZLHomePageState();
}

class _LZLHomePageState extends State<LZLHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showData1(),
            const SizedBox(height: 8,),
            showData2(),
          ],),
      ),
      floatingActionButton: Consumer<shareData>(
        builder: (context,shareDataVM,child) {
          return FloatingActionButton(onPressed: () {
            setState(() {
              shareDataVM.count++;
            });
          },child: child,);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class showData1 extends StatelessWidget {
  showData1({super.key});

  @override
  Widget build(BuildContext context) {
    print("showData1 的build");
    return Container(
        color: Colors.red,
        child: Consumer<shareData>(
          builder: (context,vm,child) {
            return Text("showData1 ${vm?.count}", style: const TextStyle(fontSize: 24),);
          },
        )
    );
  }
}

class showData2 extends StatelessWidget {
  const showData2({super.key});

  @override
  Widget build(BuildContext context) {
    print("showData2 的build");
    int data = Provider.of<shareData>(context).count;
    return Container(
        color: Colors.blue,
        child: Text("showData2 $data", style: const TextStyle(fontSize: 24),)
    );
  }
}

