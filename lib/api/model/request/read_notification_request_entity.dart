import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/read_notification_request_entity.g.dart';

@JsonSerializable()
class ReadNotificationRequestEntity {

	@JSONField(name: "notification_id")
  List<String>? notificationId;
  
  ReadNotificationRequestEntity();

  factory ReadNotificationRequestEntity.fromJson(Map<String, dynamic> json) => $ReadNotificationRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $ReadNotificationRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}