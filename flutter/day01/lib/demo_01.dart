import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter"),
          ),
          body: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LZLHelloFlutter(false),
                // const SizedBox(width: 24,),
                const Text("hello Flutter",style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
        ),
      )
  );
}

class LZLHelloFlutter extends StatefulWidget {

  var stateCheckbox = false;
  LZLHelloFlutter(this.stateCheckbox,{super.key});

  @override
  State<LZLHelloFlutter> createState() => _LZLHelloFlutterState();
}

class _LZLHelloFlutterState extends State<LZLHelloFlutter> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.stateCheckbox,
        onChanged: (value) {
          setState(() {
            widget.stateCheckbox = value ?? false;
          });
        }
    );
  }
}

