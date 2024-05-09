// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:technikapp/api/base/base_request_entity.dart';
import 'package:technikapp/api/base/base_response_entity.dart';
import 'package:technikapp/api/base/status_checker_entity.dart';
import 'package:technikapp/api/model/request/add_expense_request_entity.dart';
import 'package:technikapp/api/model/request/edit_expense_request_entity.dart';
import 'package:technikapp/api/model/request/login_request_entity.dart';
import 'package:technikapp/api/model/request/logout_request_entity.dart';
import 'package:technikapp/api/model/request/pagination_with_search_request_entity.dart';
import 'package:technikapp/api/model/request/read_notification_request_entity.dart';
import 'package:technikapp/api/model/request/update_device_token_request_entity.dart';
import 'package:technikapp/api/model/response/add_estimate_response_entity.dart';
import 'package:technikapp/api/model/response/general_response_entity.dart';
import 'package:technikapp/api/model/response/generate_token_response_entity.dart';
import 'package:technikapp/api/model/response/get_estimate_list_response_entity.dart';
import 'package:technikapp/api/model/response/get_notifications_response_entity.dart';
import 'package:technikapp/api/model/response/get_project_response_list_entity.dart';
import 'package:technikapp/api/model/response/login_response_entity.dart';
import 'package:technikapp/api/model/response/notification_list_entity.dart';
import 'package:technikapp/api/model/response/notification_un_read_count_response_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
  static Map<String, JsonConvertFunction> get convertFuncMap =>
      {
        (BaseRequestEntity).toString(): BaseRequestEntity.fromJson,
        (BaseResponseEntity).toString(): BaseResponseEntity.fromJson,
        (StatusCheckerEntity).toString(): StatusCheckerEntity.fromJson,
        (AddExpenseRequestEntity).toString(): AddExpenseRequestEntity.fromJson,
        (EditExpenseRequestEntity).toString(): EditExpenseRequestEntity
            .fromJson,
        (LoginRequestEntity).toString(): LoginRequestEntity.fromJson,
        (LogoutRequestEntity).toString(): LogoutRequestEntity.fromJson,
        (PaginationWithSearchRequestEntity)
            .toString(): PaginationWithSearchRequestEntity.fromJson,
        (ReadNotificationRequestEntity)
            .toString(): ReadNotificationRequestEntity.fromJson,
        (UpdateDeviceTokenRequestEntity)
            .toString(): UpdateDeviceTokenRequestEntity.fromJson,
        (AddEstimateResponseEntity).toString(): AddEstimateResponseEntity
            .fromJson,
        (GeneralResponseEntity).toString(): GeneralResponseEntity.fromJson,
        (GenerateTokenResponseEntity).toString(): GenerateTokenResponseEntity
            .fromJson,
        (GetEstimateListResponseEntity)
            .toString(): GetEstimateListResponseEntity.fromJson,
        (GetNotificationsResponseEntity)
            .toString(): GetNotificationsResponseEntity.fromJson,
        (GetNotificationsResponseData).toString(): GetNotificationsResponseData
            .fromJson,
        (GetNotificationsResponseDataUserDetailFrom)
            .toString(): GetNotificationsResponseDataUserDetailFrom.fromJson,
        (GetNotificationsResponseDataUserDetailTo)
            .toString(): GetNotificationsResponseDataUserDetailTo.fromJson,
        (GetProjectResponseListEntity).toString(): GetProjectResponseListEntity
            .fromJson,
        (GetProjectResponseListSupplyFiles)
            .toString(): GetProjectResponseListSupplyFiles.fromJson,
        (LoginResponseEntity).toString(): LoginResponseEntity.fromJson,
        (NotificationListEntity).toString(): NotificationListEntity.fromJson,
        (NotificationListData).toString(): NotificationListData.fromJson,
        (NotificationUnReadCountResponseEntity)
            .toString(): NotificationUnReadCountResponseEntity.fromJson,
      };

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<BaseRequestEntity>[] is M) {
      return data.map<BaseRequestEntity>((Map<String, dynamic> e) =>
          BaseRequestEntity.fromJson(e)).toList() as M;
    }
    if (<BaseResponseEntity>[] is M) {
      return data.map<BaseResponseEntity>((Map<String, dynamic> e) =>
          BaseResponseEntity.fromJson(e)).toList() as M;
    }
    if (<StatusCheckerEntity>[] is M) {
      return data.map<StatusCheckerEntity>((Map<String, dynamic> e) =>
          StatusCheckerEntity.fromJson(e)).toList() as M;
    }
    if (<AddExpenseRequestEntity>[] is M) {
      return data.map<AddExpenseRequestEntity>((Map<String, dynamic> e) =>
          AddExpenseRequestEntity.fromJson(e)).toList() as M;
    }
    if (<EditExpenseRequestEntity>[] is M) {
      return data.map<EditExpenseRequestEntity>((Map<String, dynamic> e) =>
          EditExpenseRequestEntity.fromJson(e)).toList() as M;
    }
    if (<LoginRequestEntity>[] is M) {
      return data.map<LoginRequestEntity>((Map<String, dynamic> e) =>
          LoginRequestEntity.fromJson(e)).toList() as M;
    }
    if (<LogoutRequestEntity>[] is M) {
      return data.map<LogoutRequestEntity>((Map<String, dynamic> e) =>
          LogoutRequestEntity.fromJson(e)).toList() as M;
    }
    if (<PaginationWithSearchRequestEntity>[] is M) {
      return data.map<PaginationWithSearchRequestEntity>((
          Map<String, dynamic> e) =>
          PaginationWithSearchRequestEntity.fromJson(e)).toList() as M;
    }
    if (<ReadNotificationRequestEntity>[] is M) {
      return data.map<ReadNotificationRequestEntity>((Map<String, dynamic> e) =>
          ReadNotificationRequestEntity.fromJson(e)).toList() as M;
    }
    if (<UpdateDeviceTokenRequestEntity>[] is M) {
      return data.map<UpdateDeviceTokenRequestEntity>((
          Map<String, dynamic> e) => UpdateDeviceTokenRequestEntity.fromJson(e))
          .toList() as M;
    }
    if (<AddEstimateResponseEntity>[] is M) {
      return data.map<AddEstimateResponseEntity>((Map<String, dynamic> e) =>
          AddEstimateResponseEntity.fromJson(e)).toList() as M;
    }
    if (<GeneralResponseEntity>[] is M) {
      return data.map<GeneralResponseEntity>((Map<String, dynamic> e) =>
          GeneralResponseEntity.fromJson(e)).toList() as M;
    }
    if (<GenerateTokenResponseEntity>[] is M) {
      return data.map<GenerateTokenResponseEntity>((Map<String, dynamic> e) =>
          GenerateTokenResponseEntity.fromJson(e)).toList() as M;
    }
    if (<GetEstimateListResponseEntity>[] is M) {
      return data.map<GetEstimateListResponseEntity>((Map<String, dynamic> e) =>
          GetEstimateListResponseEntity.fromJson(e)).toList() as M;
    }
    if (<GetNotificationsResponseEntity>[] is M) {
      return data.map<GetNotificationsResponseEntity>((
          Map<String, dynamic> e) => GetNotificationsResponseEntity.fromJson(e))
          .toList() as M;
    }
    if (<GetNotificationsResponseData>[] is M) {
      return data.map<GetNotificationsResponseData>((Map<String, dynamic> e) =>
          GetNotificationsResponseData.fromJson(e)).toList() as M;
    }
    if (<GetNotificationsResponseDataUserDetailFrom>[] is M) {
      return data.map<GetNotificationsResponseDataUserDetailFrom>((
          Map<String, dynamic> e) =>
          GetNotificationsResponseDataUserDetailFrom.fromJson(e)).toList() as M;
    }
    if (<GetNotificationsResponseDataUserDetailTo>[] is M) {
      return data.map<GetNotificationsResponseDataUserDetailTo>((
          Map<String, dynamic> e) =>
          GetNotificationsResponseDataUserDetailTo.fromJson(e)).toList() as M;
    }
    if (<GetProjectResponseListEntity>[] is M) {
      return data.map<GetProjectResponseListEntity>((Map<String, dynamic> e) =>
          GetProjectResponseListEntity.fromJson(e)).toList() as M;
    }
    if (<GetProjectResponseListSupplyFiles>[] is M) {
      return data.map<GetProjectResponseListSupplyFiles>((
          Map<String, dynamic> e) =>
          GetProjectResponseListSupplyFiles.fromJson(e)).toList() as M;
    }
    if (<LoginResponseEntity>[] is M) {
      return data.map<LoginResponseEntity>((Map<String, dynamic> e) =>
          LoginResponseEntity.fromJson(e)).toList() as M;
    }
    if (<NotificationListEntity>[] is M) {
      return data.map<NotificationListEntity>((Map<String, dynamic> e) =>
          NotificationListEntity.fromJson(e)).toList() as M;
    }
    if (<NotificationListData>[] is M) {
      return data.map<NotificationListData>((Map<String, dynamic> e) =>
          NotificationListData.fromJson(e)).toList() as M;
    }
    if (<NotificationUnReadCountResponseEntity>[] is M) {
      return data.map<NotificationUnReadCountResponseEntity>((
          Map<String, dynamic> e) =>
          NotificationUnReadCountResponseEntity.fromJson(e)).toList() as M;
    }

    debugPrint("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}