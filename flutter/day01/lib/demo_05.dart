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
    return Column(
      children: [
        TextButton(
          onPressed: () {
            print("hello");
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.red;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.red;
              }

            }),
            minimumSize: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const Size(300, 30);
              }
            }),

            // textStyle: MaterialStateProperty.resolveWith((states) {
            //   if (states.contains(MaterialState.pressed)) {
            //     return const TextStyle(fontSize: 24);
            //   }
            // }),
          ),
          child: const Text("hello"),
        ),
        OutlinedButton(onPressed: (){
          print("OutlinedButton");
        }, child: const Text("OutlinedButton")),
        ElevatedButton(onPressed: (){
          print("ElevatedButton");
        },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(30, 64)
            ), child: const Text("ElevatedButton")
        )
      ],
    );
  }
}


