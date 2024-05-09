import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/get_notifications_response_entity.dart';

GetNotificationsResponseEntity $GetNotificationsResponseEntityFromJson(
    Map<String, dynamic> json) {
  final GetNotificationsResponseEntity getNotificationsResponseEntity = GetNotificationsResponseEntity();
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    getNotificationsResponseEntity.count = count;
  }
  final List<GetNotificationsResponseData>? data = (json['data'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GetNotificationsResponseData>(
          e) as GetNotificationsResponseData).toList();
  if (data != null) {
    getNotificationsResponseEntity.data = data;
  }
  return getNotificationsResponseEntity;
}

Map<String, dynamic> $GetNotificationsResponseEntityToJson(
    GetNotificationsResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['count'] = entity.count;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension GetNotificationsResponseEntityExtension on GetNotificationsResponseEntity {
  GetNotificationsResponseEntity copyWith({
    int? count,
    List<GetNotificationsResponseData>? data,
  }) {
    return GetNotificationsResponseEntity()
      ..count = count ?? this.count
      ..data = data ?? this.data;
  }
}

GetNotificationsResponseData $GetNotificationsResponseDataFromJson(
    Map<String, dynamic> json) {
  final GetNotificationsResponseData getNotificationsResponseData = GetNotificationsResponseData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    getNotificationsResponseData.id = id;
  }
  final int? notificationFromUserId = jsonConvert.convert<int>(
      json['notification_from_user_id']);
  if (notificationFromUserId != null) {
    getNotificationsResponseData.notificationFromUserId =
        notificationFromUserId;
  }
  final int? notificationToUserId = jsonConvert.convert<int>(
      json['notification_to_user_id']);
  if (notificationToUserId != null) {
    getNotificationsResponseData.notificationToUserId = notificationToUserId;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    getNotificationsResponseData.title = title;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    getNotificationsResponseData.message = message;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    getNotificationsResponseData.image = image;
  }
  final String? readStatus = jsonConvert.convert<String>(json['read_status']);
  if (readStatus != null) {
    getNotificationsResponseData.readStatus = readStatus;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    getNotificationsResponseData.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    getNotificationsResponseData.updatedAt = updatedAt;
  }
  final GetNotificationsResponseDataUserDetailFrom? userDetailFrom = jsonConvert
      .convert<GetNotificationsResponseDataUserDetailFrom>(
      json['user_detail_from']);
  if (userDetailFrom != null) {
    getNotificationsResponseData.userDetailFrom = userDetailFrom;
  }
  final GetNotificationsResponseDataUserDetailTo? userDetailTo = jsonConvert
      .convert<GetNotificationsResponseDataUserDetailTo>(
      json['user_detail_to']);
  if (userDetailTo != null) {
    getNotificationsResponseData.userDetailTo = userDetailTo;
  }
  return getNotificationsResponseData;
}

Map<String, dynamic> $GetNotificationsResponseDataToJson(
    GetNotificationsResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['notification_from_user_id'] = entity.notificationFromUserId;
  data['notification_to_user_id'] = entity.notificationToUserId;
  data['title'] = entity.title;
  data['message'] = entity.message;
  data['image'] = entity.image;
  data['read_status'] = entity.readStatus;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['user_detail_from'] = entity.userDetailFrom?.toJson();
  data['user_detail_to'] = entity.userDetailTo?.toJson();
  return data;
}

extension GetNotificationsResponseDataExtension on GetNotificationsResponseData {
  GetNotificationsResponseData copyWith({
    int? id,
    int? notificationFromUserId,
    int? notificationToUserId,
    String? title,
    String? message,
    String? image,
    String? readStatus,
    String? createdAt,
    String? updatedAt,
    GetNotificationsResponseDataUserDetailFrom? userDetailFrom,
    GetNotificationsResponseDataUserDetailTo? userDetailTo,
  }) {
    return GetNotificationsResponseData()
      ..id = id ?? this.id
      ..notificationFromUserId = notificationFromUserId ??
          this.notificationFromUserId
      ..notificationToUserId = notificationToUserId ?? this.notificationToUserId
      ..title = title ?? this.title
      ..message = message ?? this.message
      ..image = image ?? this.image
      ..readStatus = readStatus ?? this.readStatus
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..userDetailFrom = userDetailFrom ?? this.userDetailFrom
      ..userDetailTo = userDetailTo ?? this.userDetailTo;
  }
}

GetNotificationsResponseDataUserDetailFrom $GetNotificationsResponseDataUserDetailFromFromJson(
    Map<String, dynamic> json) {
  final GetNotificationsResponseDataUserDetailFrom getNotificationsResponseDataUserDetailFrom = GetNotificationsResponseDataUserDetailFrom();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    getNotificationsResponseDataUserDetailFrom.id = id;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    getNotificationsResponseDataUserDetailFrom.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    getNotificationsResponseDataUserDetailFrom.lastName = lastName;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    getNotificationsResponseDataUserDetailFrom.email = email;
  }
  return getNotificationsResponseDataUserDetailFrom;
}

Map<String, dynamic> $GetNotificationsResponseDataUserDetailFromToJson(
    GetNotificationsResponseDataUserDetailFrom entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['email'] = entity.email;
  return data;
}

extension GetNotificationsResponseDataUserDetailFromExtension on GetNotificationsResponseDataUserDetailFrom {
  GetNotificationsResponseDataUserDetailFrom copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return GetNotificationsResponseDataUserDetailFrom()
      ..id = id ?? this.id
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..email = email ?? this.email;
  }
}

GetNotificationsResponseDataUserDetailTo $GetNotificationsResponseDataUserDetailToFromJson(
    Map<String, dynamic> json) {
  final GetNotificationsResponseDataUserDetailTo getNotificationsResponseDataUserDetailTo = GetNotificationsResponseDataUserDetailTo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    getNotificationsResponseDataUserDetailTo.id = id;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    getNotificationsResponseDataUserDetailTo.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    getNotificationsResponseDataUserDetailTo.lastName = lastName;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    getNotificationsResponseDataUserDetailTo.email = email;
  }
  return getNotificationsResponseDataUserDetailTo;
}

Map<String, dynamic> $GetNotificationsResponseDataUserDetailToToJson(
    GetNotificationsResponseDataUserDetailTo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['email'] = entity.email;
  return data;
}

extension GetNotificationsResponseDataUserDetailToExtension on GetNotificationsResponseDataUserDetailTo {
  GetNotificationsResponseDataUserDetailTo copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return GetNotificationsResponseDataUserDetailTo()
      ..id = id ?? this.id
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..email = email ?? this.email;
  }
}