import 'package:flutter/material.dart';

class LZLPictureDetail extends StatelessWidget {
  const LZLPictureDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var imgSrc = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: Hero(
                tag: imgSrc,
                child: Image.network(imgSrc)
            )
        ),
      ),
    );
  }
}

