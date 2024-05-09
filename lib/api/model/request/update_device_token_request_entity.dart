
import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/update_device_token_request_entity.g.dart';

@JsonSerializable()
class UpdateDeviceTokenRequestEntity {

	UpdateDeviceTokenRequestEntity();

	factory UpdateDeviceTokenRequestEntity.fromJson(Map<String, dynamic> json) => $UpdateDeviceTokenRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $UpdateDeviceTokenRequestEntityToJson(this);

	@JSONField(name: "device_type")
  String deviceType = "";
  @JSONField(name: "device_token")
  String deviceToken = "";
  @JSONField(name: "app_type")
  String appType = "";
}
