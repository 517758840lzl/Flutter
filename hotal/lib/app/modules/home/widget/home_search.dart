import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotal/app/routes/appPage.dart';

import '../../../theme/app_theme.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          height: 45,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              Get.toNamed(Routes.Bookmark);
            },
            child: IgnorePointer(
              ignoring: true,
              child: SearchBar(
                textStyle: MaterialStatePropertyAll(
                  appFont(context).bodySmall,
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                ),
                hintText: "Cari Penginapan...",
                leading: Icon(
                  Icons.home_work_rounded,
                  color: appColor(context).useScheme.primary,
                  size: 20,
                ),
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(
                  appColor(context).useScheme.inversePrimary.withOpacity(0.2),
                ),
              ),
            ),
          ),
        ),
      ),
      toolbarHeight: kTextTabBarHeight + 5,
    );
  }
}
