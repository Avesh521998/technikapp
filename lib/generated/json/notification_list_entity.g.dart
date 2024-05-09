import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/notification_list_entity.dart';

NotificationListEntity $NotificationListEntityFromJson(
    Map<String, dynamic> json) {
  final NotificationListEntity notificationListEntity = NotificationListEntity();
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    notificationListEntity.count = count;
  }
  final List<NotificationListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<NotificationListData>(e) as NotificationListData)
      .toList();
  if (data != null) {
    notificationListEntity.data = data;
  }
  return notificationListEntity;
}

Map<String, dynamic> $NotificationListEntityToJson(
    NotificationListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['count'] = entity.count;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension NotificationListEntityExtension on NotificationListEntity {
  NotificationListEntity copyWith({
    int? count,
    List<NotificationListData>? data,
  }) {
    return NotificationListEntity()
      ..count = count ?? this.count
      ..data = data ?? this.data;
  }
}

NotificationListData $NotificationListDataFromJson(Map<String, dynamic> json) {
  final NotificationListData notificationListData = NotificationListData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    notificationListData.id = id;
  }
  final int? notificationFromUserId = jsonConvert.convert<int>(
      json['notification_from_user_id']);
  if (notificationFromUserId != null) {
    notificationListData.notificationFromUserId = notificationFromUserId;
  }
  final int? notificationToUserId = jsonConvert.convert<int>(
      json['notification_to_user_id']);
  if (notificationToUserId != null) {
    notificationListData.notificationToUserId = notificationToUserId;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    notificationListData.title = title;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    notificationListData.message = message;
  }
  final dynamic image = json['image'];
  if (image != null) {
    notificationListData.image = image;
  }
  final String? readStatus = jsonConvert.convert<String>(json['read_status']);
  if (readStatus != null) {
    notificationListData.readStatus = readStatus;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    notificationListData.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    notificationListData.updatedAt = updatedAt;
  }
  return notificationListData;
}

Map<String, dynamic> $NotificationListDataToJson(NotificationListData entity) {
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
  return data;
}

extension NotificationListDataExtension on NotificationListData {
  NotificationListData copyWith({
    int? id,
    int? notificationFromUserId,
    int? notificationToUserId,
    String? title,
    String? message,
    dynamic image,
    String? readStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    return NotificationListData()
      ..id = id ?? this.id
      ..notificationFromUserId = notificationFromUserId ??
          this.notificationFromUserId
      ..notificationToUserId = notificationToUserId ?? this.notificationToUserId
      ..title = title ?? this.title
      ..message = message ?? this.message
      ..image = image ?? this.image
      ..readStatus = readStatus ?? this.readStatus
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}