// 枚举类型 定义请求的方式
enum HttpMethod {
  get,
  post,
  delete
}

abstract class BaseRequest {
  // 要传入的参数
  var pathParams;
  var useHttps = true;

  /// 请求的基地址,对于一个项目来讲，这个地址是固定的
  String authority() {
    return "api.devio.org";
  }
  HttpMethod httpMethod();
  String path();
  String url() {
    Uri url;
    var pathStr = path();

    // 参数的拼接
    if(pathParams!=null) {
      if(path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    // 地址的拼接
    if(useHttps) {
      url = Uri.https(authority(),pathStr,params);
    } else {
      url = Uri.http(authority(),pathStr,params);
    }
    return url.toString();
  }

  bool needLogin();

  Map<String,String> params = {};
  BaseRequest add(String key, Object value) {
    params[key] = value.toString();
    return this;
  }

  // 添加header
  Map<String,String> header = {};
  BaseRequest addHeader(String key, Object value) {
    header[key] = value.toString();
    return this;
  }
}

