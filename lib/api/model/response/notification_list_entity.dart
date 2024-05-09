import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/notification_list_entity.g.dart';

@JsonSerializable()
class NotificationListEntity {

	int? count;
	List<NotificationListData>? data;
  
  NotificationListEntity();

  factory NotificationListEntity.fromJson(Map<String, dynamic> json) => $NotificationListEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationListData {

	int? id;
	@JSONField(name: "notification_from_user_id")
	int? notificationFromUserId;
	@JSONField(name: "notification_to_user_id")
	int? notificationToUserId;
	String? title;
	String? message;
	dynamic image;
	@JSONField(name: "read_status")
	String? readStatus;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "updated_at")
	String? updatedAt;
  
  NotificationListData();

  factory NotificationListData.fromJson(Map<String, dynamic> json) => $NotificationListDataFromJson(json);

  Map<String, dynamic> toJson() => $NotificationListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}