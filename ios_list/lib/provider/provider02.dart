import 'package:flutter/material.dart';
import 'package:ios_list/view_model.dart';
import 'package:provider/provider.dart';


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
            print("object");
            return FloatingActionButton(onPressed: () {
              setState(() {
                shareDataVM.count++;
              });
            },child: const Icon(Icons.add),);
          }
      ),
    );
  }
}

class showData1 extends StatelessWidget {
  showData1({super.key});

  @override
  Widget build(BuildContext context) {
    int data = Provider.of<shareData>(context).count;
    return Container(
        color: Colors.red,
        child: Text("showData1 $data", style: const TextStyle(fontSize: 24),)
    );
  }
}

class showData2 extends StatefulWidget {
  const showData2({super.key});

  @override
  State<showData2> createState() => _showData2State();
}

class _showData2State extends State<showData2> {
  @override
  Widget build(BuildContext context) {
    int data = Provider.of<shareData>(context).count;
    return Container(
        color: Colors.blue,
        child: Text("showData2 $data", style: const TextStyle(fontSize: 24),)
    );
  }
}

