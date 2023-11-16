
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

    Interceptor dInter = InterceptorsWrapper(
      onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
        print("请求拦截 = ${requestOptions.uri}");
        // requestOptions.baseUrl = "https://pub.dev";
        handler.next(requestOptions);
      },
      onResponse: (Response response,ResponseInterceptorHandler handler) {
        print("相应拦截 = $response");
        handler.next(response);
      },
      onError: (DioError err, ErrorInterceptorHandler handler) {
        print("失败拦截 = $err");
        handler.next(err);
      },
    );

    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);

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
  // static const baseUrl = "https://api.oioweb.cn";
  static const baseUrl = "http://localhost/";
}
