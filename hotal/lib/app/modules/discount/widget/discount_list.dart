import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';
import '../../../util/random/alamat_random_util.dart';
import '../../../util/random/price_room_util.dart';
import '../../../util/random/room_image_util.dart';
import '../logic.dart';

class DiscountList extends StatelessWidget {
   DiscountList({super.key});


  @override
  Widget build(BuildContext context) {
    /*
    * 如果将IntrinsicHeight换位Container 就会报以下错误，这是因为Container需要一个确定的高度
    * 而很多情况下文字的高度是不确定的，需要自适应，所以可以使用IntrinsicHeight，这个控件的高位是子控件撑起的
    * RenderFlex children have non-zero flex but incoming height constraints are unbounded.
    * */

    final logic = Get.find<DiscountLogic>();

    return IntrinsicHeight(
      child: InkWell(
        onTap: logic.jumpDiscountDetail,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          // color: appColor(context).useScheme.inversePrimary.withOpacity(0.2),
          color: const Color(0x94A6AFFF),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width / 4,
                              fit: BoxFit.fill,
                              imageUrl: roomRandomUtil(),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      randomNameHotelUtil(),
                                      style: appFont(context).labelSmall?.copyWith(),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Rp${priceRandomUtil()}",
                                      style: appFont(context).bodyLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.person_outline,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "2",
                                                style:
                                                appFont(context).labelSmall?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.date_range_outlined,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "2",
                                                style:
                                                appFont(context).labelSmall?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.done_all_rounded,
                                          size: 15,
                                          color: appColor(context).useScheme.primary,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Confirmation",
                                          style: appFont(context).labelSmall?.copyWith(
                                            color:
                                            appColor(context).useScheme.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      )),
                  const SizedBox(height: 6,),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0x45749AFF),
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10),
                        bottomStart: Radius.circular(10),
                      ),

                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Icon(
                            Icons.date_range_outlined,
                            size: 20,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 20,),
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sen, 26 Okt",
                                  style:
                                  appFont(context).labelSmall?.copyWith(
                                    color: appColor(context)
                                        .useScheme
                                        .primary,
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    "14:00",
                                    style: appFont(context)
                                        .labelSmall
                                        ?.copyWith(),
                                  ),
                                ),
                              ],
                            )
                          ],),
                          const Spacer(flex: 9,),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 20,
                            color: appColor(context).useScheme.primary,
                          ),
                          const Spacer(flex: 11,),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sen, 26 Okt", style:
                                  appFont(context).labelSmall?.copyWith(
                                    color: appColor(context)
                                        .useScheme
                                        .primary,
                                  ),
                                  ),
                                  const SizedBox(height: 4),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      "12:00",
                                      style: appFont(context)
                                          .labelSmall
                                          ?.copyWith(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
