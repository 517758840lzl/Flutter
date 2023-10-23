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
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
            height: 300,
            width: 250,
            color: Colors.red,
            child: Image(image: AssetImage('assets/images/belt.jpg'),fit: BoxFit.fitWidth,)
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            height: 100,
            width: 200,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text('hello flutter',style: TextStyle(fontSize: 24,color: Colors.red,fontWeight: FontWeight.bold),),
          ),
        )
      ],
    );
  }
}


