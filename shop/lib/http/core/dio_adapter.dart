import 'package:dio/dio.dart';

import 'package:shop/http/core/network_adapter.dart';
import 'package:shop/http/core/network_error.dart';
import 'package:shop/http/core/network_response.dart';
import 'package:shop/http/request/base_request.dart';

class DioAdapter extends NetworkAdapter {

  @override
  Future<NetworkResponse<T>> send<T>(BaseRequest request) async {
    var response,error;
    var option = Options(
      headers: request.header,
    );

    try {
      var url = Uri.parse(request.url());
      if (request.httpMethod() == HttpMethod.get) {
        response = await Dio().getUri(url,options: option);
      } else if (request.httpMethod() == HttpMethod.post) {
        response = await Dio().postUri(url,options: option);
      } else if (request.httpMethod() == HttpMethod.delete) {
        response = await Dio().deleteUri(url,options: option);
      }
    } on DioException catch(e) {
      error = e;
      response = e.response;
    }

    if(error != null) {
      throw NetworkError(response?.statusCode??-1, error.toString(),data:buildRes(response, request));
    }
    return buildRes(response, request);
  }

  Future<NetworkResponse<T>> buildRes<T>(response, BaseRequest request) {
    return Future(() => NetworkResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        request: request,
        extra: response
    ));
  }


}