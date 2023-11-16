import 'package:flutter/material.dart';

class LZLStartRating extends StatefulWidget {
   @required int totalStart = 0;
   double currentStart = 0.0;

  LZLStartRating(this.totalStart,{super.key});

  @override
  State<LZLStartRating> createState() => _LZLStartRatingState();
}

class _LZLStartRatingState extends State<LZLStartRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      Row(mainAxisSize: MainAxisSize.min,children: buildUnselectedStar()),
      Row(mainAxisSize: MainAxisSize.min,children: seletedStart()),
    ]);
  }

  // sudo apachectl start 开启本地的服务
  List<Widget> buildUnselectedStar() {
    return List.generate(widget.totalStart, (index) {
      return Icon(Icons.star);
    });
  }

  List<Widget> seletedStart() {
    return List.generate(widget.totalStart, (index){
      return Icon(Icons.star_border);
    });
  }


}

class LZLStarClipper extends CustomClipper<Rect> {
  double width;

  LZLStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(LZLStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}


