import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/get_notifications_response_entity.g.dart';

@JsonSerializable()
class GetNotificationsResponseEntity {
  int? count;
  List<GetNotificationsResponseData>? data;

  GetNotificationsResponseEntity();

  factory GetNotificationsResponseEntity.fromJson(Map<String, dynamic> json) =>
      $GetNotificationsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $GetNotificationsResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GetNotificationsResponseData {
  int? id;
  @JSONField(name: "notification_from_user_id")
  int? notificationFromUserId;
  @JSONField(name: "notification_to_user_id")
  int? notificationToUserId;
  String? title;
  String? message;
  String? image;
  @JSONField(name: "read_status")
  String? readStatus;
  @JSONField(name: "created_at")
  String? createdAt;
  @JSONField(name: "updated_at")
  String? updatedAt;
  @JSONField(name: "user_detail_from")
  GetNotificationsResponseDataUserDetailFrom? userDetailFrom;
  @JSONField(name: "user_detail_to")
  GetNotificationsResponseDataUserDetailTo? userDetailTo;

  GetNotificationsResponseData();

  factory GetNotificationsResponseData.fromJson(Map<String, dynamic> json) =>
      $GetNotificationsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $GetNotificationsResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GetNotificationsResponseDataUserDetailFrom {
  int? id;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  String? email;

  GetNotificationsResponseDataUserDetailFrom();

  factory GetNotificationsResponseDataUserDetailFrom.fromJson(
          Map<String, dynamic> json) =>
      $GetNotificationsResponseDataUserDetailFromFromJson(json);

  Map<String, dynamic> toJson() =>
      $GetNotificationsResponseDataUserDetailFromToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GetNotificationsResponseDataUserDetailTo {
  int? id;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  String? email;

  GetNotificationsResponseDataUserDetailTo();

  factory GetNotificationsResponseDataUserDetailTo.fromJson(
          Map<String, dynamic> json) =>
      $GetNotificationsResponseDataUserDetailToFromJson(json);

  Map<String, dynamic> toJson() =>
      $GetNotificationsResponseDataUserDetailToToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
