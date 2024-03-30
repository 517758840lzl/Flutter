import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../util/random/alamat_random_util.dart';
import '../../../util/random/room_image_util.dart';
import 'discount_content.dart';

class DiscountHeader extends StatelessWidget {
  const DiscountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: ListView(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 10,
                      child: Stack(
                        children: [
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < 5; i++)
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  color: appColor(context).useScheme.primary,
                                  child: Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 10,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: FadeInImage(
                                            image: NetworkImage(
                                              roomRandomUtil(),
                                            ),
                                            placeholder: const AssetImage(
                                              "assets/images/peace.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
