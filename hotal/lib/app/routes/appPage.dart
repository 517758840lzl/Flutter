import 'package:get/get.dart';
import 'package:hotal/app/modules/bookmark/binding.dart';
import 'package:hotal/app/modules/bookmark/view.dart';
import 'package:hotal/app/modules/discount/binding.dart';
import 'package:hotal/app/modules/discount/view.dart';
import 'package:hotal/app/modules/discount_detail/binding.dart';
import 'package:hotal/app/modules/discount_detail/view.dart';
import 'package:hotal/app/modules/person/binding.dart';
import 'package:hotal/app/modules/person/view.dart';
import 'package:hotal/app/modules/profile/binding.dart';
import 'package:hotal/app/modules/profile/view.dart';
import 'package:hotal/app/modules/wrapper_menu/binding.dart';
import 'package:hotal/app/modules/wrapper_menu/view.dart';
import 'package:hotal/app/test/privatefuction/binding.dart';
import 'package:hotal/app/test/privatefuction/view.dart';

part 'route.dart';

class AppPage {

  static const String initRoute = Routes.Menu;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => PrivatefuctionPage(),
        binding:  PrivatefuctionBinding()
    ),
    GetPage(
        name: _Paths.Pesanan,
        page: () => PersonPage(),
        binding:  PersonBinding()
    ),
    GetPage(
        name: _Paths.Bookmark,
        page: () => BookmarkPage(),
        binding:  BookmarkBinding()
    ),
    GetPage(
        name: _Paths.Profile,
        page: () => ProfilePage(),
        binding:  ProfileBinding()
    ),
    GetPage(
        name: _Paths.Discount,
        page: () => DiscountPage(),
        binding:  DiscountBinding()
    ),
    GetPage(
        name: _Paths.Menu,
        page: () => Wrapper_menuPage(),
        binding:  Wrapper_menuBinding()
    ),
    GetPage(
        name: _Paths.DiscountDetail,
        page: () => Discount_detailPage(),
        binding:  Discount_detailBinding()
    ),
  ];
}
