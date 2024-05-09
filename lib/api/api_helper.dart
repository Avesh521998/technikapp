import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as network;
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:technikapp/common/extensions_manager.dart';
import 'package:dio/dio.dart';
import '../common/constants.dart';
import '../common/logger.dart';
import '../common/shared_preference_helper.dart';
import 'base/network_result.dart';
import 'network_constants.dart';

class APIHelper {
  final bool _isDebug = kDebugMode;
  Map<String, String>? _headers;

  APIHelper._privateConstructor() {
    _createHeaders();
  }

  static final APIHelper _instance = APIHelper._privateConstructor();

  static APIHelper get instance => _instance;

  Future<NetworkResult> callPostApi(String path, dynamic params,
      {bool? headerShow}) async {
    var callingURL = "${NetworkConstant.BASE_URL_API}/$path";
    if (_notProperHeader()) await _createHeaders();
    var parameter = json.encode(params);
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
      timber("API Parameters -> $parameter");
    }

    if (await isConnected()) {
      try {
        var resp = await network.post(Uri.parse(callingURL),
            body: parameter,
            headers: _headers);
        if (_isDebug) timber("API Response -> ${resp.body}");
        if (resp.statusCode == 200) {
          return Future.value(NetworkResult.success(resp.body));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<NetworkResult> callNewPutApi(String path, dynamic params,
      {bool? headerShow}) async {
    var callingURL = "${NetworkConstant.BASE_URL_API}/$path";
    if (_notProperHeader()) await _createHeaders();
    var parameter = json.encode(params);
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
      timber("API Parameters -> $parameter");
    }

    if (await isConnected()) {
      try {
        var resp = await network.put(Uri.parse(callingURL),
            body: parameter, headers: _headers);
        if (_isDebug) timber("API Response -> ${resp.body}");
        if (resp.statusCode == 200) {
          return Future.value(NetworkResult.success(resp.body));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<NetworkResult> callPutApi(String path, dynamic params) async {
    var callingURL = Uri.parse("${NetworkConstant.BASE_URL_API}/$path")
        .replace(queryParameters: params)
        .toString();
    if (_notProperHeader()) await _createHeaders();
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
    }

    if (await isConnected()) {
      try {
        var resp = await network.put(Uri.parse(callingURL), headers: _headers);
        if (_isDebug) timber("API Response -> ${resp.body}");
        if (resp.statusCode == 200) {
          return Future.value(NetworkResult.success(resp.body));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<NetworkResult> callGetApi(String path, dynamic params) async {
    var callingURL = Uri.parse("${NetworkConstant.BASE_URL_API}/$path")
        .replace(queryParameters: params)
        .toString();
    if (_notProperHeader()) await _createHeaders();
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
    }

    if (await isConnected()) {
      try {
        var resp = await network.get(Uri.parse(callingURL), headers: _headers);
        if (_isDebug) timber("API Response -> ${resp.body}");
        if (resp.statusCode == 200) {
          return Future.value(NetworkResult.success(resp.body));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<NetworkResult> callPostMultiPart(
      String path, dynamic params, String? uploadFilePath,
      {String dataPathName = "data", String imagePathName = "image"}) async {
    var callingURL = "${NetworkConstant.BASE_URL_API}/$path";
    if (_notProperHeader()) await _createHeaders();
    var parameter = json.encode(params);
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
      timber("API Parameters -> $parameter");
      timber("Selected Image Path -> $uploadFilePath");
    }

    if (await isConnected()) {
      try {
        FormData formData;
        if (uploadFilePath.isNotNullOrEmpty()) {
          formData = FormData.fromMap({
            dataPathName: parameter,
            imagePathName: await MultipartFile.fromFile(uploadFilePath!)
          });
        } else {
          formData = FormData.fromMap({dataPathName: parameter});
        }
        var dio = Dio();
        var responseString = await dio.post(callingURL,
            data: formData,
            options:
                Options(headers: _headers, contentType: "application/json"));

        if (_isDebug) timber("API Response -> $responseString");
        if (responseString.statusCode == 200) {
          return Future.value(
              NetworkResult.success(json.encode(responseString.data)));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<NetworkResult> callPostMultiPartForMultipleFiles(
      String path, dynamic params, List<String> uploadFilePaths,
      {String dataPathName = "data", String imagePathName = "image[]"}) async {
    var callingURL = "${NetworkConstant.BASE_URL_API}/$path";
    if (_notProperHeader()) await _createHeaders();
    var parameter = json.encode(params);
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
      timber("API Parameters -> $parameter");
      timber("Selected Image Path -> $uploadFilePaths");
    }

    if (await isConnected()) {
      List<MultipartFile> multiPartList = [];

      if (!uploadFilePaths.isNullOrEmpty()) {
        multiPartList = [];

        for (int i = 0; i < uploadFilePaths.length; i++) {
          var localPath = uploadFilePaths[i];
          if (!localPath.isNullOrEmpty()) {
            var multipartFile =
                await MultipartFile.fromFile(uploadFilePaths[i]);
            multiPartList.add(multipartFile);
          }
        }
      }

      try {
        var formData = FormData.fromMap(
            {dataPathName: parameter, imagePathName: multiPartList});
        var dio = Dio();
        var responseString = await dio.post(callingURL,
            data: formData,
            options:
                Options(headers: _headers, contentType: "application/json"));

        if (_isDebug) timber("API Response -> $responseString");
        if (responseString.statusCode == 200) {
          return Future.value(
              NetworkResult.success(json.encode(responseString.data)));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  Future<NetworkResult> callPostMultiPartWithFromData(
      String path, FormData formData) async {
    var callingURL = "${NetworkConstant.BASE_URL_API}/$path";
    if (_notProperHeader()) await _createHeaders();
    if (_isDebug) {
      timber("API URL -> $callingURL");
      timber("API Headers -> $_headers");
      timber("API Parameters -> ${formData.fields}");
      timber("API Total File Upload -> ${formData.files.length}");
      timber(
          "API File Parameters -> ${formData.files.map((e) => e.key).toList()}");
    }

    if (await isConnected()) {
      try {
        var dio = Dio();
        var responseString = await dio.post(callingURL,
            data: formData,
            options:
                Options(headers: _headers, contentType: "application/json"));

        if (_isDebug) timber("API Response -> $responseString");
        if (responseString.statusCode == 200) {
          return Future.value(
              NetworkResult.success(json.encode(responseString.data)));
        } else {
          return Future.value(NetworkResult.error());
        }
      } catch (e, s) {
        if (_isDebug) {
          timber(e);
          timber(s);
        } else {
          //FirebaseCrashlytics.instance.recordError(e, s);
        }
        return Future.value(NetworkResult.error());
      }
    } else {
      return Future.value(NetworkResult.noInternet());
    }
  }

  bool _notProperHeader() {
    return _headers == null ||
        _headers?.isEmpty == true ||
        _headers?.containsKey(NetworkConstant.AUTHORIZATION) == false;
  }

  Future<void> _createHeaders() async {
    String authToken = await getPreferenceValue(Constant.PREF_AUTH_TOKEN, "");
    print('===> token $authToken');
    if (authToken.isNotEmpty) {
      _headers = {
        NetworkConstant.AUTHORIZATION: authToken,
        'content-type': "application/json"
      };
    } else {
      _headers = {
        'content-type': "application/json"
      };
    }
  }

  Future<void> updateHeaders() async {
    await _createHeaders();
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void makeHeaderNull() {
    _headers = null;
  }
}
