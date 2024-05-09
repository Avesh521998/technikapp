import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/read_notification_request_entity.dart';

ReadNotificationRequestEntity $ReadNotificationRequestEntityFromJson(
    Map<String, dynamic> json) {
  final ReadNotificationRequestEntity readNotificationRequestEntity = ReadNotificationRequestEntity();
  final List<String>? notificationId = (json['notification_id'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (notificationId != null) {
    readNotificationRequestEntity.notificationId = notificationId;
  }
  return readNotificationRequestEntity;
}

Map<String, dynamic> $ReadNotificationRequestEntityToJson(
    ReadNotificationRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['notification_id'] = entity.notificationId;
  return data;
}

extension ReadNotificationRequestEntityExtension on ReadNotificationRequestEntity {
  ReadNotificationRequestEntity copyWith({
    List<String>? notificationId,
  }) {
    return ReadNotificationRequestEntity()
      ..notificationId = notificationId ?? this.notificationId;
  }
}