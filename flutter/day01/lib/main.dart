import 'package:day01/network/NetWorkTool.dart';
import 'package:dio/dio.dart';

main() {

  RequestManage.request("/get",params: {'name':"hangman",'age':'18'}).then((value) {
    print("value1 = ${value['args']}");
  }).onError((error, stackTrace) {
    print("error = $error");
  }).whenComplete(() {
    print("接收完成");
  });

}
