

import '../../generated/json/base/json_field.dart';
import '../../generated/json/base_request_entity.g.dart';

@JsonSerializable()
class BaseRequestEntity {

	BaseRequestEntity();

	factory BaseRequestEntity.fromJson(Map<String, dynamic> json) => $BaseRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $BaseRequestEntityToJson(this);

	dynamic data;
}
