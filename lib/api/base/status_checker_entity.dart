
import '../../generated/json/base/json_field.dart';
import '../../generated/json/status_checker_entity.g.dart';

@JsonSerializable()
class StatusCheckerEntity {

	StatusCheckerEntity();

	factory StatusCheckerEntity.fromJson(Map<String, dynamic> json) => $StatusCheckerEntityFromJson(json);

	Map<String, dynamic> toJson() => $StatusCheckerEntityToJson(this);

	int? status;
	String? message;
}
