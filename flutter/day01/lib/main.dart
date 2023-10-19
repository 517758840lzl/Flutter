import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter"),
          ),
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CachedNetworkImage(
                  imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                ),
              ],
            ),
          ),
        ),
      )
  );
}
// https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5fVkpske47rrjEYdPvZWx2AU1GHyzdUnXyJSTi8hjLw&s
// https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUnkioP0T3qVSP_wmDkqmlaZFLSrEcGRvpfI1KDqjynQ&s
// https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVwPPZ790FTGhf26MiPKKO5leEr_9ZlkU92b8JbUvR5Q&s
// https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGQIH7MGeZ2Xq0XstdOC4DddbBRNDeADmCTJpAGNQQ6Q&s



