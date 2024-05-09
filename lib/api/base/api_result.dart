import 'package:flutter/foundation.dart';
import '../../common/label_keys.dart';
import '../network_constants.dart';

class APIResult<T> {
  late APIResultType apiResultType;
  String? message;
  T? data;

  APIResult.loading({this.data}) : assert(T != dynamic) {
    apiResultType = APIResultType.LOADING;
    message = Labels.LOADING;
  }

  APIResult.noInternet() : assert(T != dynamic) {
    apiResultType = APIResultType.NO_INTERNET;
    message = Labels.NO_INTERNET_CONNECTION;
    data = null;
  }

  APIResult.success(this.message, this.data) : assert(T != dynamic) {
    apiResultType = APIResultType.SUCCESS;
  }

  APIResult.failure(this.message, {this.data}) : assert(T != dynamic) {
    apiResultType = APIResultType.FAILURE;
  }

  APIResult.sessionExpired() : assert(T != dynamic) {
    apiResultType = APIResultType.SESSION_EXPIRED;
  }

  static bool isLoading(APIResult? value) =>
      value != null && value.apiResultType == APIResultType.LOADING;

  @override
  String toString() {
    if (kDebugMode) {
      return "APIResult{apiResultType: $apiResultType, message: $message, data: $data}";
    } else {
      return "";
    }
  }
}
