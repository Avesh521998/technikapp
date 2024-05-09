import 'dart:convert';
import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/logout_request_entity.g.dart';


@JsonSerializable()
class LogoutRequestEntity {

	LogoutRequestEntity();

	factory LogoutRequestEntity.fromJson(Map<String, dynamic> json) => $LogoutRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LogoutRequestEntityToJson(this);

	String token = "";

	@override
	String toString() {
		return jsonEncode(this);
	}
}
