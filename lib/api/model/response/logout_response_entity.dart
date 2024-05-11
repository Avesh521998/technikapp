import 'package:technikapp/generated/json/base/json_field.dart';
import 'package:technikapp/generated/json/logout_response_entity.g.dart';
import 'dart:convert';
export 'package:technikapp/generated/json/logout_response_entity.g.dart';

@JsonSerializable()
class LogoutResponseEntity {
	String? message;

	LogoutResponseEntity();

	factory LogoutResponseEntity.fromJson(Map<String, dynamic> json) => $LogoutResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $LogoutResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}