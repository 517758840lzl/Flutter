
/// 登录异常
class NeedLogin extends NetworkError {
  NeedLogin({int code = 401,String message = "请先登录"}) :
        super(code,message);
}

//  授权异常
class NeedAuth extends NetworkError {
  NeedAuth(String message,{int code = 403,dynamic data}) :
        super(code,message,data: data);
}

class NetworkError {
  final int code;
  final String message;
  final dynamic data;

  NetworkError(this.code,this.message,{this.data});
}