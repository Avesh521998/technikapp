import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/notification_un_read_count_response_entity.g.dart';

@JsonSerializable()
class NotificationUnReadCountResponseEntity {

	int? count;
  
  NotificationUnReadCountResponseEntity();

  factory NotificationUnReadCountResponseEntity.fromJson(Map<String, dynamic> json) => $NotificationUnReadCountResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationUnReadCountResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}