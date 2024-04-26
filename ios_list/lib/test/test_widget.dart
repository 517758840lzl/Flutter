import 'package:flutter/material.dart';

class LZLHomeContent extends StatelessWidget {
  final List<String> _names;
  LZLHomeContent(this._names, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: ListView(
      children: _names.map((name) {
        return ListTile(
          leading: const Icon(Icons.people),
          title: Text(name),
        );
      }).toList(),
    ));
  }
}


