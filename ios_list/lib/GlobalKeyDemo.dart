import 'package:flutter/material.dart';

class GlobalKeyDemo1 extends StatelessWidget {
  const GlobalKeyDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        BoxWithValue(key: ValueKey(1),),
        BoxWithValue(key: ValueKey(2)),
      ],
    );
  }
}

class BoxWithValue extends StatefulWidget {
  const BoxWithValue({super.key});

  @override
  State<BoxWithValue> createState() => _BoxWithValueState();
}

class _BoxWithValueState extends State<BoxWithValue> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString()),
        ElevatedButton(
            onPressed: () {
              count++;
              setState(() {});
            },
            child: const Icon(Icons.add))
      ],
    );
  }
}
