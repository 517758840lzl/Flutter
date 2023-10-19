import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("FLutter"),
          ),
          body: Center(
            child: Text("hello Flutter",style: TextStyle(fontSize: 18),),
          ),
        ),
      )
  );
}
