
import '../request/base_request.dart';
import 'network_response.dart';

abstract class NetworkAdapter {
  Future<NetworkResponse<T>> send<T>(BaseRequest request);
}