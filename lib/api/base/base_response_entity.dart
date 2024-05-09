
import '../../generated/json/base/json_field.dart';
import '../../generated/json/base_response_entity.g.dart';

@JsonSerializable()
class BaseResponseEntity {

	BaseResponseEntity();

	factory BaseResponseEntity.fromJson(Map<String, dynamic> json) => $BaseResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $BaseResponseEntityToJson(this);

	int? status;
	String? message;
	dynamic data;
}
