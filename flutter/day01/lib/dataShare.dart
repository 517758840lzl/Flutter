import 'package:flutter/material.dart';

class ShareData extends InheritedWidget {
  final int data;

  const ShareData({required this.data,required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(ShareData oldWidget) {
    return oldWidget.data != data;
  }

  static ShareData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareData>();
  }

}

class LZLDataFather extends StatefulWidget {
  const LZLDataFather({super.key});

  @override
  State<LZLDataFather> createState() => _LZLDataFatherState();
}

class _LZLDataFatherState extends State<LZLDataFather> {
  @override
  var count = 0;
  Widget build(BuildContext context) {
    return ShareData(
      data: count,
      child: Column(
        children: [
          DataOne(count),
          ElevatedButton(onPressed: () {
            count++;
            setState(() {
            });
          }, child: Icon(Icons.add))
        ],
      ),
    );
  }
}

// class _LZLDataFatherState extends State<LZLDataFather> {
//   @override
//   var count = 0;
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DataOne(count),
//         ElevatedButton(onPressed: () {
//           count++;
//           setState(() {
//           });
//         }, child: Icon(Icons.add))
//       ],
//     );
//   }
// }

class DataOne extends StatelessWidget {
  var count;
  DataOne(this.count,{super.key});

  @override
  Widget build(BuildContext context) {
    return DataTwo(count);
  }
}

class DataTwo extends StatelessWidget {
  var count;
  DataTwo(this.count,{super.key});

  @override
  Widget build(BuildContext context) {
    return DataThree(count);
  }
}


class DataThree extends StatefulWidget {
  var count;
  DataThree(this.count,{super.key});

  @override
  State<DataThree> createState() => _DataThreeState();
}

class _DataThreeState extends State<DataThree> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("didChangeDependencies");
  }
  @override
  Widget build(BuildContext context) {
    // return Text(widget.count.toString());

    return Text(ShareData.of(context)!.data.toString());
  }
}



