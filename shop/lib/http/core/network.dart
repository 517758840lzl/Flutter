import 'package:shop/http/request/base_request.dart';

class NetworkManage {

  // 私有构造方法
  NetworkManage._();
  // 定义单例变量
  static NetworkManage? _install;
  static NetworkManage shareNetwork() {
    // 单例变量为null，调用私有方法进行初始化
    _install??=NetworkManage._();
    return _install!;
  }

  Future fire(BaseRequest request) async{
    var result = await send(request);
    print("data = ${result["data"]}");
    return result;
  }

  Future<dynamic>send<T>(BaseRequest request) async {
    request.addHeader("token", "123456");
    print("header = ${request.header}");
    print("params = ${request.params}");
    print("url = ${request.url()}");
    return Future.value({"statusCode":200,"data":{"code":200,"message":"success"}});
  }
}