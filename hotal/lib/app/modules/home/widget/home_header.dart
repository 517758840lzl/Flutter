import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../logic.dart';

class HomeHeader extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  HomeHeader({super.key});


  @override
  Widget build(BuildContext context) {
    var random = Random();
    var minPrice = 1000;
    var maxPrice = 999999;
    // 产生随机数
    var randomPrince = minPrice + random.nextInt(maxPrice - minPrice);

    return SliverToBoxAdapter(
      child: Card(
        color: Colors.pink,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 0,
        child: InkWell(
          onTap: () {
            logic.homePageNotification();
          },
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.payments_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Book Room",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(children: [
                    //   Text("￥${randomPrince}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    //   Text("￥${minPrice} CoinBase",style: TextStyle(color: Colors.white.withOpacity(0.8)),)
                    // ],),
                    Text(
                      "￥${randomPrince}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "￥${minPrice} CoinBase",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    )
                  ],
                )),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: appColor(context).useScheme.secondaryContainer,
                        ),
                        child: Icon(
                          Icons.send_outlined,
                          size: 15,
                          color: appColor(context).useScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          // color: appColor(context).useScheme.secondaryContainer,
                        ),
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 35,
                          color: appColor(context).useScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      color: appColor(context).useScheme.secondaryContainer,
                    ),
                    child: Icon(
                      Icons.qr_code_sharp,
                      size: 15,
                      color: appColor(context).useScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
