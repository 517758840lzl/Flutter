import 'package:shop/http/core/dio_adapter.dart';
import 'package:shop/http/core/network_error.dart';
import 'package:shop/http/core/network_response.dart';
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
    NetworkResponse? response;
    var error;
    try {
      response = await send(request);
    } on NetworkError catch(e) {
      error = e;
      response = e.data;
    } catch(e) {
      error = e;
    }
    if(response==null) {
      return;
    }

    var statusCode = response!.statusCode;
    switch(statusCode) {
      case 200:
        return response.data;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(response.data.toString(),data: response.data);
      default:
        throw NetworkError(statusCode!, response.data.toString(),data: response.data);
    }
  }

  Future<dynamic>send<T>(BaseRequest request) async {
    // MockAdapter adapter = MockAdapter();
    DioAdapter adapter = DioAdapter();
    return await adapter.send(request);
  }
}