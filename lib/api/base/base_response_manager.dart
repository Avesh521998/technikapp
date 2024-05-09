import 'dart:convert';

import 'package:technikapp/api/base/status_checker_entity.dart';
import 'package:technikapp/common/extensions_manager.dart';
import '../../api/network_constants.dart';
import '../../common/label_keys.dart';
import '../../generated/json/base/json_convert_content.dart';
import '../model/response/general_response_entity.dart';
import 'api_result.dart';
import 'base_response_entity.dart';
import 'network_result.dart';

APIResult<T> getAPIResultFromNetwork<T>(NetworkResult networkResult) {
  switch (networkResult.networkResultType) {
    case NetworkResultType.ERROR:
      return APIResult.failure(Labels.ERROR_OCCURRED_TRY_LATER);
    case NetworkResultType.NO_INTERNET:
      return APIResult.noInternet();
    case NetworkResultType.SUCCESS:
    default:
      {
        if (networkResult.data.isNullOrEmpty()) {
          return APIResult.failure("");
        }
        try {
          var baseJson = json.decode(networkResult.data!);
          StatusCheckerEntity? statusChecker =
              JsonConvert.fromJsonAsT(baseJson);

          if (statusChecker == null) {
            return APIResult.failure(Labels.ERROR_OCCURRED_TRY_LATER);
          }

          if (statusChecker.status == APIResultConstant.ERROR) {
            return APIResult.failure(statusChecker.message.orEmpty());
          } else if (statusChecker.status == APIResultConstant.SESSION_EXPIRED) {
            return APIResult.sessionExpired();
          } else {
            BaseResponseEntity? baseResponseEntity =
                JsonConvert.fromJsonAsT(baseJson);
            T? responseModel =
                JsonConvert.fromJsonAsT<T>(baseResponseEntity!.data);
            return APIResult.success(
                baseResponseEntity.message.orEmpty(), responseModel);
          }
        } catch (e, s) {
          //FirebaseCrashlytics.instance.recordError(e, s);
          return APIResult.failure(e.toString());
        }
      }
  }
}

APIResult<T> getAPIResultFromNetworkWithoutBase<T>(
    NetworkResult networkResult) {
  switch (networkResult.networkResultType) {
    case NetworkResultType.ERROR:
      return APIResult.failure(Labels.ERROR_OCCURRED_TRY_LATER);
    case NetworkResultType.NO_INTERNET:
      return APIResult.noInternet();
    case NetworkResultType.SUCCESS:
    default:
      {
        if (networkResult.data.isNullOrEmpty()) {
          return APIResult.failure("");
        }
        try {
          var baseJson = json.decode(networkResult.data!);
          T? responseModel = JsonConvert.fromJsonAsT<T>(baseJson);
          return APIResult.success("", responseModel);
        } catch (e, s) {
          //FirebaseCrashlytics.instance.recordError(e, s);
          return APIResult.failure(e.toString());
        }
      }
  }
}

APIResult<GeneralResponseEntity>
    getAPIResultForGeneralResponse<T extends GeneralResponseEntity>(
        NetworkResult networkResult) {
  switch (networkResult.networkResultType) {
    case NetworkResultType.ERROR:
      return APIResult<GeneralResponseEntity>.failure(
          Labels.ERROR_OCCURRED_TRY_LATER);
    case NetworkResultType.NO_INTERNET:
      return APIResult<GeneralResponseEntity>.noInternet();
    case NetworkResultType.SUCCESS:
    default:
      {
        if (networkResult.data.isNullOrEmpty()) {
          return APIResult<GeneralResponseEntity>.failure("");
        }
        try {
          var baseJson = json.decode(networkResult.data!);
          GeneralResponseEntity? responseModel =
              JsonConvert.fromJsonAsT<GeneralResponseEntity>(baseJson);
          if (responseModel?.status == APIResultConstant.SESSION_EXPIRED) {
            return APIResult.sessionExpired();
          } else if (responseModel != null &&
              responseModel.status == APIResultConstant.SUCCESS) {
            return APIResult<GeneralResponseEntity>.success("", responseModel);
          } else {
            return APIResult<GeneralResponseEntity>.failure(
                responseModel?.message,
                data: responseModel);
          }
        } catch (e, s) {
          //FirebaseCrashlytics.instance.recordError(e, s);
          return APIResult<GeneralResponseEntity>.failure(e.toString());
        }
      }
  }
}
