import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotal/app/modules/discount_detail/widget/discount_booking.dart';

import '../../../theme/app_theme.dart';
import '../../../util/random/alamat_random_util.dart';
import '../../../util/random/room_image_util.dart';
import 'discount_content.dart';

/*
* padding、margin中的四个边距是不允许设置为负值的，如果想使用负值就要是Container的transfer
* transform: Matrix4.translationValues(-20, 0, 0),
* ConstrainedBox 可以设置最大的高度或者宽度
*
* */
class DiscountDetail extends StatelessWidget {
  const DiscountDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
              child: ListView(children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(children: [
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: FadeInImage(
                                width: size.width - 40,
                                image: NetworkImage(
                                  roomRandomUtil(),
                                ),
                                placeholder: const AssetImage(
                                  "assets/images/peace.png",
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: appColor(context).useScheme.background,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i = 0; i < 5; i++)
                                  Padding(
                                    padding: const EdgeInsets.all(
                                      2.5,
                                    ),
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor:
                                          appColor(context).useScheme.primary,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ]),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        randomNameHotelUtil(),
                        style: appFont(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      randomAlamatUtil(),
                      style: appFont(context).labelSmall?.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const FlutterLogo(
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          double.parse(
                                  (random.nextDouble() * (10.0 - 1.0) + 1.0)
                                      .toStringAsFixed(1))
                              .toString(),
                          style: appFont(context).bodyMedium?.copyWith(
                                color: appColor(context).useScheme.primary,
                              ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "(${random.nextInt(500) + 1})",
                            style: appFont(context).bodyMedium?.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              for (var i = 0; i < random.nextInt(5) + 1; i++)
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 15,
                                  color: Colors.yellow.shade700,
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: appColor(context)
                                      .useScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Text(
                                  "Hotel",
                                  style: appFont(context).labelSmall?.copyWith(
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0x7E8D94FF),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      children: [
                        for (var i = 0;
                            i < (5 + random.nextInt(15 - 5 + 1));
                            i++)
                          randomFasilitas(context, i)
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: appColor(context)
                        .useScheme
                        .inversePrimary
                        .withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Momentary",
                          style: appFont(context).bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(-20, 0, 0),
                          child: SizedBox(
                            width: size.width,
                            height: size.width / 3,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                for (var i = 0;
                                    i < (2 + random.nextInt(15 - 2 + 1));
                                    i++)
                                  commontDetail(context),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  for(var i=0;i<10;i++)
                     const DiscountBooking()
                ],
              ),
            ),
          ])),
        ],
      ),
    ));
  }
}

//  评论的添加
Widget commontDetail(BuildContext context) {
  var data = randomComment();
  return Card(
    color: appColor(context).useScheme.primaryContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
    ),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        //
        maxWidth: MediaQuery.of(context).size.width/2,
        maxHeight: MediaQuery.of(context).size.height/2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(data["name"] as String),
            const SizedBox(height: 5,),
            Row(
              children: [
                for (var i = 0; i < Random().nextInt(5) + 1; i++)
                  Icon(
                    Icons.star_rate_rounded,
                    size: 13,
                    color: Colors.yellow.shade700,
                  ),
              ],
            ),
              Expanded(child: Text(data["momentary"] as String)),
              const SizedBox(height: 5,),
              const Text("4 min ago")
          ],)],
        ),
      ),
    ),
  );
}

