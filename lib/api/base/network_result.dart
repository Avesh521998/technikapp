import 'package:flutter/foundation.dart';
import '../network_constants.dart';

class NetworkResult {
  NetworkResultType networkResultType;
  String? data;

  NetworkResult._(this.networkResultType, this.data);

  static NetworkResult noInternet() {
    return NetworkResult._(NetworkResultType.NO_INTERNET, null);
  }

  static NetworkResult sessionExpired() {
    return NetworkResult._(NetworkResultType.SESSION_EXPIRED, null);
  }

  static NetworkResult success(String data) {
    return NetworkResult._(NetworkResultType.SUCCESS, data);
  }

  static NetworkResult error() {
    return NetworkResult._(NetworkResultType.ERROR, null);
  }

  @override
  String toString() {
    if (kDebugMode) {
      return "NetworkResult{networkResultType: $networkResultType, data: $data}";
    } else {
      return "";
    }
  }
}
