import 'package:flutter/material.dart';

class CircleInkWellButton extends StatelessWidget {
  final Color bgColor;
  final Function() onTap;
  final double width;
  final double height;
  final Widget child;

  CircleInkWellButton({
    required this.bgColor,
    required this.onTap,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
