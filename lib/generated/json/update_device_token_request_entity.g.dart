import 'package:technikapp/generated/json/base/json_convert_content.dart';
import 'package:technikapp/api/model/request/update_device_token_request_entity.dart';

UpdateDeviceTokenRequestEntity $UpdateDeviceTokenRequestEntityFromJson(
    Map<String, dynamic> json) {
  final UpdateDeviceTokenRequestEntity updateDeviceTokenRequestEntity = UpdateDeviceTokenRequestEntity();
  final String? deviceType = jsonConvert.convert<String>(json['device_type']);
  if (deviceType != null) {
    updateDeviceTokenRequestEntity.deviceType = deviceType;
  }
  final String? deviceToken = jsonConvert.convert<String>(json['device_token']);
  if (deviceToken != null) {
    updateDeviceTokenRequestEntity.deviceToken = deviceToken;
  }
  final String? appType = jsonConvert.convert<String>(json['app_type']);
  if (appType != null) {
    updateDeviceTokenRequestEntity.appType = appType;
  }
  return updateDeviceTokenRequestEntity;
}

Map<String, dynamic> $UpdateDeviceTokenRequestEntityToJson(
    UpdateDeviceTokenRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['device_type'] = entity.deviceType;
  data['device_token'] = entity.deviceToken;
  data['app_type'] = entity.appType;
  return data;
}

extension UpdateDeviceTokenRequestEntityExtension on UpdateDeviceTokenRequestEntity {
  UpdateDeviceTokenRequestEntity copyWith({
    String? deviceType,
    String? deviceToken,
    String? appType,
  }) {
    return UpdateDeviceTokenRequestEntity()
      ..deviceType = deviceType ?? this.deviceType
      ..deviceToken = deviceToken ?? this.deviceToken
      ..appType = appType ?? this.appType;
  }
}