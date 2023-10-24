
import 'package:dio/dio.dart';

class RequestManage {

  static final baseOptions = BaseOptions(
    baseUrl: LZLBaseOptions.baseUrl,
    connectTimeout: LZLBaseOptions.connectTimeout,
    sendTimeout: LZLBaseOptions.sendTimeout,
    receiveTimeout: LZLBaseOptions.receiveTimeout
  );

  static Future request<T>(String url, {
    String method = "get",
    Map<String, dynamic>? params,
    Interceptor? inter
  }) async {
    final dio = Dio(baseOptions);
    final options = Options(method: method);
    try {
      Response response = await dio.request(url,options: options,queryParameters: params);
      return response.data;
    } catch (error) {
      return Future.error(error);
    }
  }
}

class LZLBaseOptions{
  static const connectTimeout =  Duration(milliseconds: 10000);
  static const receiveTimeout =  Duration(milliseconds: 10000);
  static const sendTimeout    =  Duration(milliseconds: 10000);
  static const baseUrl = "https://httpbin.org";
}
