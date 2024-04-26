import 'dart:convert';

import 'package:shop/http/request/base_request.dart';

class NetworkResponse<T> {
  T data;
  BaseRequest? request;
  int? statusCode;
  String? statusMessage;
  dynamic? extra;

  NetworkResponse({
        required this.data,
        this.request,
        this.statusCode,
        this.statusMessage,
        this.extra,
      });

  @override
  String toString() {
    if(this.data is Map) {
      return json.encode(this.data);
    }
    return this.data.toString();
  }
}
