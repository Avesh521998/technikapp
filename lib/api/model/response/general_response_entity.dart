import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/general_response_entity.g.dart';

@JsonSerializable()
class GeneralResponseEntity {

	GeneralResponseEntity();

	factory GeneralResponseEntity.fromJson(Map<String, dynamic> json) => $GeneralResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GeneralResponseEntityToJson(this);

  int? status;
  String? message;
}
