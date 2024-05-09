import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/logout_request_entity.dart';

LogoutRequestEntity $LogoutRequestEntityFromJson(Map<String, dynamic> json) {
  final LogoutRequestEntity logoutRequestEntity = LogoutRequestEntity();
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    logoutRequestEntity.token = token;
  }
  return logoutRequestEntity;
}

Map<String, dynamic> $LogoutRequestEntityToJson(LogoutRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token'] = entity.token;
  return data;
}

extension LogoutRequestEntityExtension on LogoutRequestEntity {
  LogoutRequestEntity copyWith({
    String? token,
  }) {
    return LogoutRequestEntity()
      ..token = token ?? this.token;
  }
}