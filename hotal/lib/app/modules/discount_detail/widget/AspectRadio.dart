import 'package:flutter/material.dart';

class LZLAspectRatio extends StatelessWidget {
  const LZLAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("mbfmnb"),),
      body: Container(
        // width: MediaQuery.of(context).size.width - 60,
        child: AspectRatio(
            aspectRatio: 3/1,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
