import 'package:shop/http/core/network_adapter.dart';
import 'package:shop/http/core/network_response.dart';
import 'package:shop/http/request/base_request.dart';

class MockAdapter extends NetworkAdapter {
  @override
  Future<NetworkResponse<T>> send<T>(BaseRequest request) {
    return Future(() => NetworkResponse(
        data: {"code":200,"message":"success"} as T,
        statusCode: 403,
        statusMessage: "请求成功"
    ));
  }
}