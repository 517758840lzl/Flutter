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
      body: LZLHomeContent(["abc","dkhas","hejk"]),
    );
  }
}

class LZLHomeContent extends StatelessWidget {
  final List<String> _names;
  LZLHomeContent(this._names);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _names.map((name) {
        return ListTile(
          leading: const Icon(Icons.people),
          title: Text(name),
        );
      }).toList(),
    );
  }
}


