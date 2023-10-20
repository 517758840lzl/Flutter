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
    // return const FadeInImage(placeholder: AssetImage("assets/images/belt.jpg"),
    //     image: NetworkImage("https://pic.616pic.com/bg_w1180/00/00/65/pH7zV5jZ4W.jpg!/fw/1120"));

    // return Icon(Icons.pets, size: 300,color: Colors.orange,);
    // return Icon(IconData(0xe4a1, fontFamily: 'MaterialIcons'), color: Colors.orange,size: 300,);
    return Text("\ue4a1",style: TextStyle(fontFamily: 'MaterialIcons',fontSize: 100,color: Colors.orange),);
  }

}


