import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/notification_un_read_count_response_entity.dart';

NotificationUnReadCountResponseEntity $NotificationUnReadCountResponseEntityFromJson(
    Map<String, dynamic> json) {
  final NotificationUnReadCountResponseEntity notificationUnReadCountResponseEntity = NotificationUnReadCountResponseEntity();
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    notificationUnReadCountResponseEntity.count = count;
  }
  return notificationUnReadCountResponseEntity;
}

Map<String, dynamic> $NotificationUnReadCountResponseEntityToJson(
    NotificationUnReadCountResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['count'] = entity.count;
  return data;
}

extension NotificationUnReadCountResponseEntityExtension on NotificationUnReadCountResponseEntity {
  NotificationUnReadCountResponseEntity copyWith({
    int? count,
  }) {
    return NotificationUnReadCountResponseEntity()
      ..count = count ?? this.count;
  }
}