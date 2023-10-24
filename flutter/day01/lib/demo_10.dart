import 'dart:math';

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
    ScrollController controller = ScrollController(initialScrollOffset: 300);

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: LZLHomeContent(controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.arrow_upward),
      ) ,

    );
  }
}

class LZLHomeContent extends StatefulWidget {
  ScrollController controller;
  LZLHomeContent(this.controller,{super.key});

  @override
  State<LZLHomeContent> createState() => _LZLHomeContentState();
}

class _LZLHomeContentState extends State<LZLHomeContent> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.controller,
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
        ),
        SliverGrid(delegate: SliverChildBuilderDelegate(
            childCount: 20,
                (content,index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
              );
            }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),),
        SliverList(delegate: SliverChildBuilderDelegate(
            childCount: 20,
                (content,index) {
              return ListTile(
                leading: Icon(Icons.headphones),
                title: Text("hello $index"),
                trailing: Icon(Icons.deck),
              );
            }
        ))
      ],
    );
  }
}

class SliverDemo1 extends StatelessWidget {
  const SliverDemo1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver:
          SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: 100,
                  (content,index) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                );
              }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),),
        )
      ],
    );
  }
}


