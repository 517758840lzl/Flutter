
part of 'appPage.dart';

abstract class Routes {
  // 私有方法，外部调用默认的构造器会报错
  Routes._();

  static const HOME = _Paths.HOME;
  static const Menu = _Paths.Menu;
  static const Bookmark = _Paths.Bookmark;
  static const Person = _Paths.Pesanan;
  static const DiscountDetail = _Paths.DiscountDetail;
}


abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const DiscountDetail = '/discount/detail';
  static const Pesanan = '/person';
  static const Discount = '/discount';
  static const Bookmark = '/bookmark';
  static const Profile = '/profile';
  static const Menu = '/wrapper-menu';
}