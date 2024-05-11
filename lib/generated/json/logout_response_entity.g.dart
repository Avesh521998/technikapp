import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/response/logout_response_entity.dart';

LogoutResponseEntity $LogoutResponseEntityFromJson(Map<String, dynamic> json) {
  final LogoutResponseEntity logoutResponseEntity = LogoutResponseEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    logoutResponseEntity.message = message;
  }
  return logoutResponseEntity;
}

Map<String, dynamic> $LogoutResponseEntityToJson(LogoutResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  return data;
}

extension LogoutResponseEntityExtension on LogoutResponseEntity {
  LogoutResponseEntity copyWith({
    String? message,
  }) {
    return LogoutResponseEntity()
      ..message = message ?? this.message;
  }
}