import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text('Non-scrollable content'),
              ),
            ),
          ),
          const SliverAppBar(
            title: Text('SliverToBoxAdapter Demo'),
            floating: true,
            expandedHeight: 200,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

