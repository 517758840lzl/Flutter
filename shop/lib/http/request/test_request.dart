import 'package:shop/http/request/base_request.dart';

class TestRequest extends BaseRequest{
  @override
  HttpMethod httpMethod() {
    return HttpMethod.get;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
   return "uapi/test/test";
  }

}